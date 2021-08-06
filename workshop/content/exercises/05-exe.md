
## Run the Application
It's time now to run your app so you can see your beans print out in the terminal as well as interact with your web application.
To run the application, run the following command.
```execute-2
./mvnw spring-boot:run
```

You should see output similar to the following:
```bash
Let's inspect the beans provided by Spring Boot:
application
beanNameHandlerMapping
defaultServletHandlerMapping
dispatcherServlet
embeddedServletContainerCustomizerBeanPostProcessor
handlerExceptionResolver
helloController
httpRequestHandlerAdapter
messageSource
mvcContentNegotiationManager
mvcConversionService
mvcValidator
org.springframework.boot.autoconfigure.MessageSourceAutoConfiguration
org.springframework.boot.autoconfigure.PropertyPlaceholderAutoConfiguration
org.springframework.boot.autoconfigure.web.EmbeddedServletContainerAutoConfiguration
org.springframework.boot.autoconfigure.web.EmbeddedServletContainerAutoConfiguration$DispatcherServletConfiguration
org.springframework.boot.autoconfigure.web.EmbeddedServletContainerAutoConfiguration$EmbeddedTomcat
org.springframework.boot.autoconfigure.web.ServerPropertiesAutoConfiguration
org.springframework.boot.context.embedded.properties.ServerProperties
org.springframework.context.annotation.ConfigurationClassPostProcessor.enhancedConfigurationProcessor
org.springframework.context.annotation.ConfigurationClassPostProcessor.importAwareProcessor
org.springframework.context.annotation.internalAutowiredAnnotationProcessor
org.springframework.context.annotation.internalCommonAnnotationProcessor
org.springframework.context.annotation.internalConfigurationAnnotationProcessor
org.springframework.context.annotation.internalRequiredAnnotationProcessor
org.springframework.web.servlet.config.annotation.DelegatingWebMvcConfiguration
propertySourcesBinder
propertySourcesPlaceholderConfigurer
requestMappingHandlerAdapter
requestMappingHandlerMapping
resourceHandlerMapping
simpleControllerHandlerAdapter
tomcatEmbeddedServletContainerFactory
viewControllerHandlerMapping

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