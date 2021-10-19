package com.javatmp.demo.rest.openapi;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.IntStream;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class ReactiveRestDemoApplication {

    private final Integer threadPoolSize;
    private final Integer taskQueueSize;
    @Value("${api.common.version}")
    String apiVersion;
    @Value("${api.common.title}")
    String apiTitle;
    @Value("${api.common.description}")
    String apiDescription;
    @Value("${api.common.termsOfService}")
    String apiTermsOfService;
    @Value("${api.common.license}")
    String apiLicense;
    @Value("${api.common.licenseUrl}")
    String apiLicenseUrl;
    @Value("${api.common.externalDocDesc}")
    String apiExternalDocDesc;
    @Value("${api.common.externalDocUrl}")
    String apiExternalDocUrl;
    @Value("${api.common.contact.name}")
    String apiContactName;
    @Value("${api.common.contact.url}")
    String apiContactUrl;
    @Value("${api.common.contact.email}")
    String apiContactEmail;
    public ReactiveRestDemoApplication(
            @Value("${app.threadPoolSize:10}") Integer threadPoolSize,
            @Value("${app.taskQueueSize:100}") Integer taskQueueSize) {
        this.threadPoolSize = threadPoolSize;
        this.taskQueueSize = taskQueueSize;
    }

    public static void main(String[] args) {
        SpringApplication.run(ReactiveRestDemoApplication.class, args);
    }

    /**
     * Will exposed on $HOST:$PORT/swagger-ui.html
     *
     * @return the common OpenAPI documentation
     */
    @Bean
    public OpenAPI getOpenApiDocumentation() {
        return new OpenAPI()
                .info(new Info().title(apiTitle)
                        .description(apiDescription)
                        .version(apiVersion)
                        .contact(new Contact()
                                .name(apiContactName)
                                .url(apiContactUrl)
                                .email(apiContactEmail))
                        .termsOfService(apiTermsOfService)
                        .license(new License()
                                .name(apiLicense)
                                .url(apiLicenseUrl)))
                .externalDocs(new ExternalDocumentation()
                        .description(apiExternalDocDesc)
                        .url(apiExternalDocUrl));
    }

    @Bean
    public Scheduler reactiveScheduler() {
        log.info("Creates a jdbcScheduler with thread pool size = {}",
                threadPoolSize);
        return Schedulers.newBoundedElastic(
                threadPoolSize, taskQueueSize, "reactiveScheduler-pool");
    }

    private RestDto getRandomDto(long index) {
        RestDto restDto = RestDto.builder()
                .id(index)
                .intField((int) index)
                .integerField((int) index)
                .stringField("String Field for index " + index)
                .date(new Date())
                .localDate(LocalDate.now())
                .localDateTime(LocalDateTime.now())
                .booleanField(true)
                .build();

        return restDto;
    }

    @Bean
    public Set<RestDto> getRestDtoRepository() {
        final Set<RestDto> data = Collections
                .synchronizedSet(new LinkedHashSet<>());
        IntStream.range(1, 100).forEach(i -> {
            RestDto restDto = this.getRandomDto(i);
            data.add(restDto);
        });
        return data;
    }

    @Bean
    public CommandLineRunner springBootMain() throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
        };
    }

}
