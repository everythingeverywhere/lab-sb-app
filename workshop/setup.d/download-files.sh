#!/bin/bash 

cd opt
curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.3/spring-boot-cli-2.5.3-bin.zip -o /opt/spring.zip
unzip /opt/spring.zip -d /opt

echo 'alias spring="/opt/spring-2.5.3"' >> ~/.bash_profile
# export SPRING_HOME=/opt/spring-2.5.3
# export PATH=$SPRING_HOME/bin/spring:$PATH
# chmod 777 /opt/spring
# export PATH=/opt/springcli/spring:$PATH


# # Install SDKMAN 
# curl -s "https://get.sdkman.io" | bash
# # make executable
# source "/opt/.sdkman/bin/sdkman-init.sh"
cd ~
export VERSION=2.5.1
curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=$VERSION -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot.zip

mkdir spring-boot
mv spring-boot.zip spring-boot

unzip -o spring-boot/spring-boot.zip -d spring-boot
