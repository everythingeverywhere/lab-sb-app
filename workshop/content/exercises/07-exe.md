

## Add Production-grade Services

If you are building a web site for your business, you probably need to add some management services. Spring Boot provides several such services (such as health, audits, beans, and more) with its [actuator module](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready).

If you use Gradle, add the following dependency to your `build.gradle` file:


```
implementation 'org.springframework.boot:spring-boot-starter-actuator'
COPY
```


If you use Maven, add the following dependency to your `pom.xml` file:


```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
COPY
```


Then restart the application. If you use Gradle, run the following command in a terminal window (in the `complete` directory):


```
./gradlew bootRun
```


If you use Maven, run the following command in a terminal window (in the `complete` directory):


```
./mvnw spring-boot:run
```


You should see that a new set of RESTful end points have been added to the application. These are management services provided by Spring Boot. The following listing shows typical output:


```
management.endpoint.configprops-org.springframework.boot.actuate.autoconfigure.context.properties.ConfigurationPropertiesReportEndpointProperties
management.endpoint.env-org.springframework.boot.actuate.autoconfigure.env.EnvironmentEndpointProperties
management.endpoint.health-org.springframework.boot.actuate.autoconfigure.health.HealthEndpointProperties
management.endpoint.logfile-org.springframework.boot.actuate.autoconfigure.logging.LogFileWebEndpointProperties
management.endpoints.jmx-org.springframework.boot.actuate.autoconfigure.endpoint.jmx.JmxEndpointProperties
management.endpoints.web-org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties
management.endpoints.web.cors-org.springframework.boot.actuate.autoconfigure.endpoint.web.CorsEndpointProperties
management.health.status-org.springframework.boot.actuate.autoconfigure.health.HealthIndicatorProperties
management.info-org.springframework.boot.actuate.autoconfigure.info.InfoContributorProperties
management.metrics-org.springframework.boot.actuate.autoconfigure.metrics.MetricsProperties
management.metrics.export.simple-org.springframework.boot.actuate.autoconfigure.metrics.export.simple.SimpleProperties
management.server-org.springframework.boot.actuate.autoconfigure.web.server.ManagementServerProperties
management.trace.http-org.springframework.boot.actuate.autoconfigure.trace.http.HttpTraceProperties
COPY
```


The actuator exposes the following:



*   [actuator/health](http://localhost:8080/actuator/health)
*   [actuator/info](http://localhost:8080/actuator/info)
*   [actuator](http://localhost:8080/actuator)

<table>
  <tr>
   <td>
   </td>
   <td>
There is also an <code>/actuator/shutdown</code> endpoint, but, by default, it is visible only through JMX. To <a href="https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready-endpoints-enabling-endpoints">enable it as an HTTP endpoint</a>, add <code>management.endpoint.shutdown.enabled=true</code> to your <code>application.properties</code> file and expose it with <code>management.endpoints.web.exposure.include=health,info,shutdown</code>. However, you probably should not enable the shutdown endpoint for a publicly available application.
   </td>
  </tr>
</table>


You can check the health of the application by running the following command:


```
$ curl localhost:8080/actuator/health
{"status":"UP"}
COPY
```


You can try also to invoke shutdown through curl, to see what happens when you have not added the necessary line (shown in the preceding note) to `application.properties`:


```
$ curl -X POST localhost:8080/actuator/shutdown
{"timestamp":1401820343710,"error":"Not Found","status":404,"message":"","path":"/actuator/shutdown"}
COPY
```


Because we did not enable it, the requested endpoint is not available (because the endpoint does not exist).

For more details about each of these REST endpoints and how you can tune their settings with an `application.properties` file (in `src/main/resources`), see the the [documentation about the endpoints](https://docs.spring.io/spring-boot/docs/2.5.0/reference/htmlsingle/#production-ready-endpoints).

