
You need a new project with the dependency `Spring Web`. There are many ways to begin a new project from the [Spring Initializr](start.spring.io) website, with the Spring Boot CLI, cloning repos, and using Spring Tools in your favorite IDE. The Spring Boot CLI and Spring Tools both leverage the [Spring Initializr](start.spring.io) when creating new projects.

The [Spring Initializr](start.spring.io)'s popularity is due to many reasons one of the main reasons is it makes everything easier and faster by automatically configuring your applications. It uses industry best practices for these configurations ans sets up your applications so you don't have to keep re-inventing the wheel. It has a wide array of dependencies and options to choose giving you what you need to get started.

First, make a directory to hold your project, call it `spring-boot`.
```execute-1
mkdir spring-boot
```

Move into `spring-boot` in both teminals to make this a home for your project.
```execute-all
cd spring-boot
```

The lab has the [Spring Boot CLI](https://docs.spring.io/spring-boot/docs/current/reference/html/cli.html) already integrated and we you will use it to create your project. Make note of the options we are choosing in particular that we are choosing the `web` dependency.

Initialize your project with the [Spring Boot CLI](https://docs.spring.io/spring-boot/docs/current/reference/html/cli.html). Here you are choosing to have it packaged as a zip.
```execute-1
spring init --name=spring-boot --artifactId=spring-boot --groupId=com.example --java-version=11 --dependencies=web spring-boot.zip
```

Unzip your package of `spring-boot.zip`
```execute-1
unzip spring-boot.zip
```

The `pom.xml` is created when you create a Maven project, this is where your dependency of `Spring Web` was added for you. 

Click the following command to see your `Spring Web`dependency in your `pom.xml`.
```editor:select-matching-text
file: ~/spring-boot/pom.xml
text: "spring-boot-starter-web"
```
