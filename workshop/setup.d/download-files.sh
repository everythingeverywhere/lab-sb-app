#!/bin/bash 

mkdir -p /home/eduk8s/bin && cd bin
curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.0/spring-boot-cli-2.5.0-bin.zip -o /home/eduk8s/bin/spring
chmod 777 /home/eduk8s/bin/spring
# export PATH=/home/eduk8s/bin/springcli/spring:$PATH


# # Install SDKMAN 
# curl -s "https://get.sdkman.io" | bash
# # make executable
# source "/home/eduk8s/bin/.sdkman/bin/sdkman-init.sh"
cd ~
export VERSION=2.5.1
curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=$VERSION -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot.zip

mkdir spring-boot
mv spring-boot.zip spring-boot

unzip -o spring-boot/spring-boot.zip -d spring-boot
