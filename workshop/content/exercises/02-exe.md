
## Starting with Spring Initializr

You can visit the [Spring Initializr](https://start.spring.io/#!type=maven-project&language=java&platformVersion=2.5.0&packaging=jar&jvmVersion=1.8&groupId=com.example&artifactId=spring-boot&name=spring-boot&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.spring-boot&dependencies=web) to generate a new project with the required dependencies (Spring Web):

You need a new project with the dependency `Spring Web`. There are many ways to begin a new project from the most popular at the [Spring Initializr](start.spring.io) website, with the Spring Boot CLI, cloning repos, and using Spring Tools in your favorite IDE. 

Curl is easy to use on this platform which is what we are choosing. Take a note of that we are selecting the `web` depenedency.
```execute-1
curl -G https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=2.5.1 -d artifactId=spring-boot -d name=spring-boot -d groupId=com.example -d language=java -o spring-boot.zip
```
Now, to keep things clean make a new directory and move your compressed package into it.
```execute-1
mkdir spring-boot
mv spring-boot.zip spring-boot
```

Unzip your project into the folder you created.
```execute-1
unzip -o spring-boot/spring-boot.zip -d spring-boot
```

Finally, lets move into spring-boot in both teminals
```execute-all
cd spring-boot
```

The `pom.xml` is created when you choose Maven, this is where your dependency of `Spring Web` was added for you. 

Click the following command to see your `Spring Web`dependency in your `pon.xml`.
```editor:select-matching-text
file: ~/spring-boot/pom.xml
text: "spring-boot-starter-web"
```
