
## Add Unit Tests

You will want to add a test for the endpoint you added, and Spring Test provides some machinery for that.


If you use Maven, the `spring-boot-starter-test` dependency should be added to your `pom.xml` file.
```editor:select-matching-text
file: ~/spring-boot/src/main/java/com/example/springboot/HelloController.java
text: "spring-boot-starter-test"
before: 2
after: 2
```


```editor:insert-lines-before-line
file: ~/spring-boot/pom.xml
line: 20
text: |
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-test</artifactId>
	<scope>test</scope>
</dependency>
```


Now write a simple unit test that mocks the servlet request and response through your endpoint, as the following listing (from `src/test/java/com/example/springboot/HelloControllerTest.java`) shows:


```editor:append-lines-to-file
file: ~/spring-boot/src/test/java/com/example/springboot/HelloControllerTest.java
text: |
		package com.example.springboot;

		import static org.hamcrest.Matchers.equalTo;
		import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
		import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

		import org.junit.jupiter.api.Test;

		import org.springframework.beans.factory.annotation.Autowired;
		import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
		import org.springframework.boot.test.context.SpringBootTest;
		import org.springframework.http.MediaType;
		import org.springframework.test.web.servlet.MockMvc;
		import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

		@SpringBootTest
		@AutoConfigureMockMvc
		public class HelloControllerTest {

			@Autowired
			private MockMvc mvc;

			@Test
			public void getHello() throws Exception {
				mvc.perform(MockMvcRequestBuilders.get("/").accept(MediaType.APPLICATION_JSON))
						.andExpect(status().isOk())
						.andExpect(content().string(equalTo("Greetings from Spring Boot!")));
			}
		}
```


`MockMvc` comes from Spring Test and lets you, through a set of convenient builder classes, send HTTP requests into the `DispatcherServlet` and make assertions about the result. Note the use of `@AutoConfigureMockMvc` and `@SpringBootTest` to inject a `MockMvc` instance. Having used `@SpringBootTest`, we are asking for the whole application context to be created. An alternative would be to ask Spring Boot to create only the web layers of the context by using `@WebMvcTest`. In either case, Spring Boot automatically tries to locate the main application class of your application, but you can override it or narrow it down if you want to build something different.

As well as mocking the HTTP request cycle, you can also use Spring Boot to write a simple full-stack integration test. For example, instead of (or as well as) the mock test shown earlier, we could create the following test (from `src/test/java/com/example/springboot/HelloControllerIT.java`):


```editor:append-lines-to-file
file: ~/spring-boot/src/test/java/com/example/springboot/HelloControllerIT.java
text: |
package com.example.springboot;

import static org.assertj.core.api.Assertions.*;

import java.net.URL;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.ResponseEntity;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class HelloControllerIT {

	@LocalServerPort
	private int port;

	private URL base;

	@Autowired
	private TestRestTemplate template;

    @BeforeEach
    public void setUp() throws Exception {
        this.base = new URL("http://localhost:" + port + "/");
    }

    @Test
    public void getHello() throws Exception {
        ResponseEntity<String> response = template.getForEntity(base.toString(),
                String.class);
        assertThat(response.getBody()).isEqualTo("Greetings from Spring Boot!");
    }
}
```


The embedded server starts on a random port because of `webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT`, and the actual port is discovered at runtime with `@LocalServerPort`.
