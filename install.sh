#!/bin/bash
## Users can change the default environment variables configuration file here
if [[ $SHELL = '/bin/zsh' ]]; then
    PATH_File=~/.zshrc
    if [ ! -f "$PATH_File" ]; then
        PATH_File=~/.zsh_profile
        if [ ! -f "$PATH_File" ]; then
            touch $PATH_File
        fi
    fi
else
    PATH_File=~/.bashrc
    if [ ! -f "$PATH_File" ]; then
        PATH_File=~/.bash_profile
        if [ ! -f "$PATH_File" ]; then
            touch $PATH_File
        fi
    fi
fi
PM_PATH=`pwd`
Sys_ver=`uname`
### Checking that environment variable of PMprofiler exists ###
Check_old_PMprofiler=`grep "export PMprofiler" $PATH_File | awk -F '=' '{print $1}'`
Check_old_path=`grep "PMprofiler/bin" $PATH_File | sed 's/\(.\).*/\1/' | awk '{if($1!="#"){print "True";}}'`
Add_Part="#### Disabled by PMprofiler ####"
echo "**PM-profiler Installation**"
echo "**version 1.0**"

### Build source code for src package ###
if [ -f "Makefile" ]; then
    echo -e "\n**PM-profiler src package**"
    make
    echo -e "\n**Build Complete**"
else
    echo -e "\n**PM-profiler bin package**"
fi
### Configure environment variables ###

if [ "$Check_old_PMprofiler" != "" ]; then
    Checking=`grep ^export\ PMprofiler $PATH_File | awk -F '=' '{print $2}'`
    if [ "$Checking" != "$PM_PATH" ]; then
        if [ "$Sys_ver" = "Darwin" ]; then
            sed -i "" "s/^export\ PMprofiler/$Add_Part\ &/g" $PATH_File
            sed -i "" -e "`grep -n "$Add_Part" $PATH_File | cut -d ":" -f 1 | head -1` a\ 
export\ PMprofiler=$PM_PATH
" $PATH_File
        else
            sed -i "s/^export\ PMprofiler/$Add_Part\ &/g" $PATH_File
            sed -i "/$Add_Part\ export\ PMprofiler/a export\ PMprofiler=$PM_PATH" $PATH_File
        fi
    fi
elif [ "$Check_old_PMprofiler" = "" ]; then
    echo "export PMprofiler=$PM_PATH" >> $PATH_File
fi
if [ "$Check_old_path" = "" ]; then
    echo "export PATH=\$PATH:\$PMprofiler/bin" >> $PATH_File
fi

### Source the environment variable file ###
source $PATH_File
echo -e "\n**Environment Variables Configuration Complete**"
### End ###
echo -e "\n**PM-profiler Installation Complete**"
echo -e "\n**Please check the \"example\" directory for an example dataset with a demo script.**"
