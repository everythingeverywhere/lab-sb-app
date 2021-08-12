#!/bin/bash 

# Install Spring CLI

## cd into install directory
cd opt
## download binary and make into a zip
curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.3/spring-boot-cli-2.5.3-bin.zip -o /opt/spring.zip
## unzip binary into appropriate directory
unzip /opt/spring.zip -d /opt
## create bash_profile and add spring
echo 'alias spring="/opt/spring-2.5.3/bin/spring"' >> ~/.bash_profile

# download
# cd ~
# export VERSION=2.5.1
# curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=$VERSION -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot.zip