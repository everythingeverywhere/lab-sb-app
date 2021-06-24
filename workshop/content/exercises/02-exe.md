
## Starting with Spring Initializr

You can visit the [Spring Initializr](https://start.spring.io/#!type=maven-project&language=java&platformVersion=2.5.0&packaging=jar&jvmVersion=1.8&groupId=com.example&artifactId=spring-boot&name=spring-boot&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.spring-boot&dependencies=web) to generate a new project with the required dependencies (Spring Web):

You need a new project with the dependency `Spring Web`. There are many ways to do this from the most popular at the Spring Initializr website, through the CLI, cloning repos, and using Spring Tools in your favorite IDE. 


We will take advantage of the embedded IDE (vs code) in this workshop to begin our project. Click the next command to open the text editor with an input bar will open.
```editor:execute-command
command: spring.initializr.maven-project
args:
	- language: Java
	  dependencies: [ "web" ]
	  artifactId: spring-boot
	  groupId: com.example
```

```execute-1
curl -d dependencies=web -d bootVersion=2.5.1 -d artifactId=spring-boot -dgroupId=com.example -d language=java


The `pom.xml` is created when you choose Maven, this is where your dependency of `Spring Web` was added for you. 

Click the following command to see your `Spring Web`dependency in your `pon.xml`.
```editor:select-matching-text
file: ~/spring-boot/pom.xml
text: "spring-boot-starter-web"
```
