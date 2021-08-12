
### Actuator module
If you are building a web site for your business, you probably need to add some management services. Spring Boot provides several such services (such as health, audits, beans, and more) with its [actuator module](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready).

Add the `spring-boot-starter-actuator ` dependency to your `pom.xml` file:
```editor:insert-lines-before-line
file: ~/spring-boot/pom.xml
line: 20
text: |
      <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-actuator</artifactId>
      </dependency>
```

If you have the application still running you can terminate it with the next command:
```terminal:interrupt
session: 2
```
Run the following command in a terminal window (in the `complete` directory):

```execute-2
./mvnw spring-boot:run
```

You should see that a new set of RESTful end points have been added to the application. These are management services provided by Spring Boot. 

The following listing shows typical output(truncated for readibility):
```bash
management.endpoint.configprops-org.springframework.boot.actuate.autoconfigure.context.properties.ConfigurationPropertiesReportEndpointProperties
management.endpoint.env-org.springframework.boot.actuate.autoconfigure.env.EnvironmentEndpointProperties
management.endpoint.health-org.springframework.boot.actuate.autoconfigure.health.HealthEndpointProperties
management.endpoint.logfile-org.springframework.boot.actuate.autoconfigure.logging.LogFileWebEndpointProperties
...
```
You can now check the health of the application by running the following command:
```execute-1
curl localhost:8080/actuator/health
```
This should show similar to:
```bash
{"status":"UP","groups":["liveness","readiness"]}
```

The actuator exposes the following:
*   [actuator/health](http://localhost:8080/actuator/health)
*   [actuator/info](http://localhost:8080/actuator/info)
*   [actuator](http://localhost:8080/actuator)

### Shutdown endpoint

There is also an `/actuator/shutdown` endpoint, but, *by default*, it is visible only through JMX. To [enable it as an HTTP endpoint](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready-endpoints-enabling-endpoints), add `management.endpoint.shutdown.enabled=true` to your `application.properties` file and expose it with `management.endpoints.web.exposure.include=health,info,shutdown`. 
```editor:append-lines-to-file
file: ~/spring-boot/src/main/resources/application.properties
text: |
        management.endpoint.shutdown.enabled=true
        management.endpoints.web.exposure.include=health,info,shutdown
```
However, you probably should *not* enable the shutdown endpoint for a publicly available application.

You can try to invoke shutdown through curl to see what happens when you have added the necessary line to `application.properties`.

If you have the application still running you can terminate it with the next command:
```terminal:interrupt
session: 2
```
Restart your application.
```execute-2
./mvnw spring-boot:run
```
Go ahead and shutdown your application.
```execute-1
curl -X POST localhost:8080/actuator/shutdown
```
The previous command will return something like
```bash
{"message":"Shutting down, bye..."}
```

For more details about each of these REST endpoints and how you can tune their settings with an `application.properties` file (in `src/main/resources`), see the the [documentation about the endpoints](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready-endpoints).

