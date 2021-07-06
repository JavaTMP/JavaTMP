package com.javatmp.demo.cloud.discovery.client.type;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class RestTemplateClientType {
    @Autowired
    RestTemplate restTemplate;

    public String getHello() {
        ResponseEntity< String > restExchange =
                restTemplate.exchange(
                        "http://eureka-client/hello",
                        HttpMethod.GET, null, String.class);

        return restExchange.getBody();
    }
}
