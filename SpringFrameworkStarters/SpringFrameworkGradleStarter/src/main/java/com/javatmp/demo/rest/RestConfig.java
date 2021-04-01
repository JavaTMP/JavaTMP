package com.javatmp.rest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

@Configuration
@Slf4j
public class RestConfig {
    @Bean("RestTemplateExplicit")
    public RestTemplateBuilder restTemplateBuilder() {
        return new RestTemplateBuilder(restTemplate -> {
            // customize the rest template bean here
            log.debug("an instance of Rest Template created");
        });
    }

    @Bean
    public RestTemplate restTemplate(
            @Qualifier("RestTemplateExplicit") RestTemplateBuilder builder) {
        return builder
                .setConnectTimeout(Duration.ofMillis(3000))
                .setReadTimeout(Duration.ofMillis(3000))
                .build();
    }

}
