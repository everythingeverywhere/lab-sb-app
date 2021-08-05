#!/bin/bash 
export VERSION=2.5.1
curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=$VERSION -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot.zip

mkdir spring-boot
mv spring-boot.zip spring-boot

unzip -o spring-boot/spring-boot.zip -d spring-boot
