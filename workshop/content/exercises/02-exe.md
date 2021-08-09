
You need a new project with the dependency `Spring Web`. There are many ways to begin a new project from the most popular at the [Spring Initializr](start.spring.io) website, with the Spring Boot CLI, cloning repos, and using Spring Tools in your favorite IDE. 

To make things easier your project is ready for you it is appropriately called `spring-boot` and has the `Spring Web` dependency with `Maven` as the build tool. 

First, lets move into `spring-boot` in both teminals to make our commands relative to this path.
```execute-all
cd spring-boot
```

The `pom.xml` is created when you create a Maven project, this is where your dependency of `Spring Web` was added for you. 

Click the following command to see your `Spring Web`dependency in your `pon.xml`.
```editor:select-matching-text
file: ~/spring-boot/pom.xml
text: "spring-boot-starter-web"
```
