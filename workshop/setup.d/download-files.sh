#!/bin/bash 

# Install Spring CLI

## cd into install directory
cd opt

# if spring.zip doesn't exist, 
if [ ! -f /opt/spring.zip ]; 
then
    echo "create spring.zip"
    echo "download binary and make into a zip"
    curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.3/spring-boot-cli-2.5.3-bin.zip -o /opt/spring.zip
    echo "unzip binary into appropriate directory"
    unzip /opt/spring.zip -d /opt
else
    echo "no need to download spring.zip"
fi

