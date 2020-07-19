package com.javatmp.rest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.client.RestTemplateCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
@Slf4j
public class RestConfig {
    @Bean("RestTemplateExplicit")
    public RestTemplateBuilder restTemplateBuilder() {
        return new RestTemplateBuilder(new RestTemplateCustomizer() {
            @Override
            public void customize(RestTemplate restTemplate) {
                // customize the rest template bean here
                log.debug("an instance of Rest Template created");
            }
        });
    }
}
