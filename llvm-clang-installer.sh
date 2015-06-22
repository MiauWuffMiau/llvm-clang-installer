#!/bin/bash

while getopts I:B:S:c:dt option
do      case ${option} in
		I)	install_path="$OPTARG";;
		B)	build_path="$OPTARG";;
		S)	source_path="$OPTARG";;
		c)	cpu_cores="$OPTARG";;
		d)	debug="true";;
		t)	time_debug="true";;
		*)	exit 1
			;;
       esac
done

if [ -z "$install_path" ] || [ -z "$build_path" ] || [ -z "$source_path" ]; then
	echo -e "\nPlease specify an installation path (-I /path/to/install/dir),"
	echo -e "a build path (-B /path/to/build/dir)"
	echo -e "and also the path where the source files shall be saved (-S /path/to/source)!"
	echo -e "\nTo be on the save side, please provide absolute paths!\n"
	echo -e "\n-I:"
	echo -e "\tSpecifies the installation path.\n\tExample: '/path/to/install/dir'"
	echo -e "\n-B:"
	echo -e "\tSpecifies the installation path.\n\tExample: '/path/to/build/dir'"
	echo -e "\n-S:"
	echo -e "\tSpecifies the installation path.\n\tExample: '/path/to/source/dir'"
	echo -e "\n-c:"
	echo -e "\tSpecifies the amount of CPU cores\n\tthe make process is allowed to use.\n\n\tPay attention!"
	echo -e "\n\tThis will probably result\n\tin a very high load average!\n\n\tExample: -c8"
	echo -e "\n-d:"
	echo -e "\tSpecifies whether the installation\n\twill be run as a debug version or not.\n\tExample: -d"
	echo -e "\n-t:"
	echo -e "\tSpecifies whether the time programm\n\twill take place to display additional\n\tinformation about execution.\n\tExample: -t\n"
	exit 1337
fi

if [ -z "$cpu_cores" ]; then
	cpu_cores="1"
fi

# Installing required dependencies
sudo apt-get -y install build-essential zlib1g-dev python git groff time
sudo apt-get -y update

echo -e "\nCreating source path...\n"

mkdir -p "$source_path"

echo -e "\nCreating install path...\n"

mkdir -p "$install_path"

echo -e "\nCreating build path...\n"

mkdir -p "$build_path"

echo -e "\nSwitching to sources folder...\n"

cd "$source_path"

echo -e "\nGit session will start now...\n"

git clone http://llvm.org/git/llvm.git
echo ""
cd llvm/tools/
git clone http://llvm.org/git/clang.git
echo ""
cd ../projects/
git clone http://llvm.org/git/compiler-rt.git
echo ""
cd ../tools/clang/tools/
git clone http://llvm.org/git/clang-tools-extra.git
echo ""

cd "$build_path"

if [ "$debug" != "true" ]; then
	"$source_path"/llvm/configure --enable-optimized --prefix="$install_path"
else
	"$source_path"/llvm/configure --disable-optimized --prefix="$install_path"
fi

if [ "$time_debug" != "true" ]; then
	make -j"$cpu_cores" && make -j"$cpu_cores" install
else 
	/usr/bin/time -v make -j"$cpu_cores" && make -j"$cpu_cores" install
fi

check=`echo $?`

if [ "$check" == "0" ]; then
	echo -e "\nEverything went fine!\n"
else 
	echo -e "\nSomething went wrong, please check!\n"
fi

export PATH="$PATH:$install_path/bin"

echo -e "\nVerifying that everything works properly with running clang version check...\n"

clang -v

check=`echo $?`

if [ "$check" == "0" ]; then
	echo -e "\nClang works fine!\n"
else 
	echo -e "\nSomething went wrong, please check!\n"
fi

echo -e "\n\nFINISHED SUCCESSFULLY!\n\n"

