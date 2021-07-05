package com.javatmp.demo.cloud.discovery.client.type;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Component
public class DiscoveryClientType {

    @Autowired
    private DiscoveryClient discoveryClient;

    public String getHello() {
        RestTemplate restTemplate = new RestTemplate();
        List<ServiceInstance> instances = discoveryClient.getInstances("eureka-client");

        if (instances.size()==0) return null;
        String serviceUri = String.format("%s/hello",instances.get(0).getUri().toString());

        ResponseEntity< String > restExchange =
                restTemplate.exchange(
                        serviceUri,
                        HttpMethod.GET, null, String.class);

        return restExchange.getBody();
    }
}
