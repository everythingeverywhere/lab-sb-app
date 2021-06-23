
## View Spring Boot’s Starters

You have seen some of [Spring Boot’s “starters”](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#using-boot-starter). You can see them all [here in source code](https://github.com/spring-projects/spring-boot/tree/main/spring-boot-project/spring-boot-starters).


## JAR Support and Groovy Support

The last example showed how Spring Boot lets you wire beans that you may not be aware you need. It also showed how to turn on convenient management services.

However, Spring Boot does more than that. It supports not only traditional WAR file deployments but also lets you put together executable JARs, thanks to Spring Boot’s loader module. The various guides demonstrate this dual support through the `spring-boot-gradle-plugin` and `spring-boot-maven-plugin`.

On top of that, Spring Boot also has Groovy support, letting you build Spring MVC web applications with as little as a single file.

Create a new file called `app.groovy` and put the following code in it:


```
@RestController
class ThisWillActuallyRun {

    @RequestMapping("/")
    String home() {
        return "Hello, World!"
    }

}
COPY


<table>
  <tr>
   <td>```


   </td>
   <td>It does not matter where the file is. You can even fit an application that small inside a <a href="https://twitter.com/rob_winch/status/364871658483351552">single tweet</a>!
   </td>
  </tr>
</table>


Next, [install Spring Boot’s CLI](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#getting-started-installing-the-cli).

Run the Groovy application by running the following command:


```
$ spring run app.groovy
COPY


<table>
  <tr>
   <td>```


   </td>
   <td>Shut down the previous application, to avoid a port collision.
   </td>
  </tr>
</table>


From a different terminal window, run the following curl command (shown with its output):


```
$ curl localhost:8080
Hello, World!
COPY
```


Spring Boot does this by dynamically adding key annotations to your code and using [Groovy Grape](http://www.groovy-lang.org/Grape) to pull down the libraries that are needed to make the app run.
