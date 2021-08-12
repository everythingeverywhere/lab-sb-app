
You need a new project with the dependency `Spring Web`. There are many ways to begin a new project from the most popular at the [Spring Initializr](start.spring.io) website, with the Spring Boot CLI, cloning repos, and using Spring Tools in your favorite IDE. 

To make things easier your project is ready for you it is appropriately called `spring-boot` and has the `Spring Web` dependency with `Maven` as the build tool. 

Here use the [Spring Boot CLI]() to create your project and make note of the options we are choosing.
```execute-1
spring init --name=spring-boot --artifactId=spring-boot --groupId=com.example --java-version=11 --dependencies=web spring-boot.zip
```

Unzip your package of `spring-boot.zip`
```execute-1
unzip spring-boot.zip
```
Move into your project `spring-boot` in both teminals.
```execute-all
cd spring-boot
```
The Spring Initializr has many convenient defaults like using the latest most stable version of Spring Boot we are choosing `2.5.1` to lock in a version for the lab. 
curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=2.5.1 -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot-initial.zip


The `pom.xml` is created when you create a Maven project, this is where your dependency of `Spring Web` was added for you. 

Click the following command to see your `Spring Web`dependency in your `pon.xml`.
```editor:select-matching-text
file: ~/spring-boot/pom.xml
text: "spring-boot-starter-web"
```
