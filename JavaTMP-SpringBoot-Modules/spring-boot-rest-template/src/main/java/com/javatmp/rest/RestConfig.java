package com.javatmp.rest;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.client.RestTemplateCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestConfig {
    @Bean("RestTemplateExplicit")
    public RestTemplateBuilder restTemplateBuilder() {
        return new RestTemplateBuilder(new RestTemplateCustomizer() {
            @Override
            public void customize(RestTemplate restTemplate) {
                // customize the rest template bean here
            }
        });
    }
}
