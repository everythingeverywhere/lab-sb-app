
It's time now to run your app so you can see your beans print out in the terminal as well as interact with your web application.

To run the application, run the following command.
```execute-2
./mvnw spring-boot:run
```

You should see output similar to the following (truncated for readibility):
```bash
Let's inspect the beans provided by Spring Boot:
application
beanNameHandlerMapping
defaultServletHandlerMapping
dispatcherServlet
embeddedServletContainerCustomizerBeanPostProcessor
handlerExceptionResolver
helloController
...
```

Stop your application to continue.
```execute-2
<ctrl+c>
```

You can clearly see `org.springframework.boot.autoconfigure` beans. 
```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/Application.java
text: "org.springframework.boot.autoconfigure"
```
There is also a `tomcatEmbeddedServletContainerFactory` you can find in the output as the `spring-boot-starter-web` includes Tomcat 

Now run the service with curl (in a separate terminal window), by running the following command:
```execute-1
curl localhost:8080
```
Output you should see should reflect the following
```bash
Greetings from Spring Boot!
```

### Optional - As a reminder from previous section
If you forgot where the greeting is coming from you can optionally use this refresher.

When invoked from a browser or by using curl on the command line, the method returns pure text. 
 `@RequestMapping` maps `/` to the `index()` method. 
  ```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: "Greetings from Spring Boot!"
```