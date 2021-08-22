package com.javatmp.demo.webclient;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication(exclude = {WebMvcAutoConfiguration.class})
@Slf4j
public class RestDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(RestDemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            // https://www.baeldung.com/spring-5-webclient
            // https://www.baeldung.com/spring-webclient-json-list
            // https://reflectoring.io/spring-webclient/
            // https://stackoverflow.com/questions/48598233/deserialize-a-json-array-to-objects-using-jackson-and-webclient
            WebClient webClient = WebClient.builder()
                    .baseUrl("http://localhost:8080/rest")
                    .defaultHeader(HttpHeaders.CONTENT_TYPE,
                            MediaType.APPLICATION_JSON_VALUE)
                    .build();
            Mono<List<RestDto>> getAllMono = webClient.get().uri("/get")
                    .header(HttpHeaders.CONTENT_TYPE,
                            MediaType.APPLICATION_JSON_VALUE)
                    .retrieve()
                    .bodyToFlux(RestDto.class)
                    .collectList();
            CompletableFuture<List<RestDto>> future = getAllMono.toFuture();
            List<RestDto> getAll = future.get();
            log.info("all size is : {}", getAll.size());
            getAll.forEach(o -> {
                log.info("object id is : {}", o.getId());
            });

        };
    }

}
