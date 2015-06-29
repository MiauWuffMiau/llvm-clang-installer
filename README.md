# llvm-clang-installer

This shell script will build **LLVM** and **Clang**.

## Description

This script will checkout the latest version of LLVM and Clang out of the GIT repository.

It is highly recommended to use absolute paths while using this script. This will avoid some mistakes. 

This script is quite agile and flexible. The flexibility comes with its parameters. 

One will find the parameters below. 

## Caution

Please take care of one **post installation** step!

One has to export / add something to the users **_PATH_** variable. Otherwise one will not be able to test, run or execute clang and LLVM tools. One has to do something like this:

`export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/llvm/installation/bin`

In this case the installation folder of LLVM was:

**/root/llvm/installation**

What you have to do is to append the `/bin` folder. The operating system knows where to find the executables now. Another solution could be that one specifies an installation that is already set in the PATH variable. This would workaround the **_PATH_** problem.

## Parameters

-I:

    Specifies the installation path.
    Example: '/path/to/install/dir'

## Dependencies

This script has some dependencies, one can find in the list below:

- build-essential
- zlib1g-dev
- python
- git
- groff
- time (optional)