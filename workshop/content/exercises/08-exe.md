
You have seen some of [Spring Boot’s “starters”](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#using-boot-starter). You can see them all [here in source code](https://github.com/spring-projects/spring-boot/tree/main/spring-boot-project/spring-boot-starters).

### JAR Support and Groovy Support

The last example showed how Spring Boot lets you wire beans that you may not be aware you need. It also showed how to turn on convenient management services.

However, Spring Boot does more than that. It supports not only traditional WAR file deployments but also lets you put together executable JARs, thanks to Spring Boot’s loader module. The various guides demonstrate this dual support through the `spring-boot-gradle-plugin` and `spring-boot-maven-plugin`.

On top of that, Spring Boot also has Groovy support, letting you build Spring MVC web applications with as little as a single file.

Create a new file called `app.groovy` and put the following code in it:

```editor:append-lines-to-file
file: ~/spring-boot/app.groovy
text: |
@RestController
class ThisWillActuallyRun {

    @RequestMapping("/")
    String home() {
        return "Hello, World!"
    }

}
``` 

It does not matter where the file is. You can even fit an application that small inside a [single tweet](https://twitter.com/rob_winch/status/364871658483351552)!

Next, [install Spring Boot’s CLI](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#getting-started-installing-the-cli).

Shut down the previous application, to avoid a port collision.
```terminal:interrupt
session: 2
```

Run the Groovy application by running the following command:

```execute-2
spring run app.groovy
```

From a different terminal window, run the following curl command:
```execute-1
curl localhost:8080
```
Your output should reflect the following.
```bash
Hello, World!
```
Spring Boot does this by dynamically adding key annotations to your code and using [Groovy Grape](http://www.groovy-lang.org/Grape) to pull down the libraries that are needed to make the app run.
