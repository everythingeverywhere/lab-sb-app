Now you can create a web controller for a simple web application, as the following listing (from `src/main/java/com/example/springboot/HelloController.java`) shows:

```editor:append-lines-to-file
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: |
        package com.example.springboot;

        import org.springframework.web.bind.annotation.RestController;
        import org.springframework.web.bind.annotation.RequestMapping;

        @RestController
        public class HelloController {

            @RequestMapping("/")
            public String index() {
                return "Greetings from Spring Boot!";
            }

        }
```


The class is flagged as a `@RestController`, meaning it is ready for use by Spring MVC to handle web requests.
```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: "@RestController"
```


 `@RequestMapping` maps `/` to the `index()` method. 
  ```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: "@RequestMapping"
```
 
When invoked from a browser or by using curl on the command line, the method returns pure text. 
 `@RequestMapping` maps `/` to the `index()` method. 
  ```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: "Greetings from Spring Boot!"
```

That is because `@RestController` combines `@Controller` and `@ResponseBody`, two annotations that results in web requests returning data rather than a view.

