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

**-I:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies the installation path.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: '/path/to/install/dir'

**-B:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies the build path.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: '/path/to/build/dir'

**-S:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies the source path.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: '/path/to/source/dir'

**-c:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies the amount of CPU cores<br/>
&nbsp;&nbsp;&nbsp;&nbsp;the make process is allowed to use.<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;**Pay attention!**<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;This will probably result in a<br/>
&nbsp;&nbsp;&nbsp;&nbsp;very high load average of the host!<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: -c8

**-d:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies whether the installation<br/>
&nbsp;&nbsp;&nbsp;&nbsp;will be run as a debug version or not.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: -d

**-t:**

&nbsp;&nbsp;&nbsp;&nbsp;Specifies whether the time programm<br/>
&nbsp;&nbsp;&nbsp;&nbsp;will take place to display additional<br/>
&nbsp;&nbsp;&nbsp;&nbsp;information about execution.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Example: -t

## Dependencies

This script has some dependencies, one can find in the list below:

- build-essential
- zlib1g-dev
- python
- git
- groff
- time (optional)