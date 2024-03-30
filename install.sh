#!/bin/bash
## Users can change the default environment variables configuration file here
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
### Unzip .tar.gz files in the ./database folder ###

echo -e "\n**Unzipping .tar.gz files in the database folder**"

if [ -d "./database" ]; then
    cd ./database
    for file in *.tar.gz; do
        if [ -f "$file" ]; then
            tar -xzf "$file"
            echo "Unzipped: $file"
        fi
    done
    cd ..
else
    echo "The database directory does not exist."
fi

### End ###
echo -e "\n**PM-profiler Installation Complete**"
echo -e "\n**Please check the \"example\" directory for an example dataset with a demo script.**"
