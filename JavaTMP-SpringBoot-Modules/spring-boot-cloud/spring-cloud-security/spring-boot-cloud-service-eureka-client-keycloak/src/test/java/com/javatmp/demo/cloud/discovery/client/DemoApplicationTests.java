package com.javatmp.demo.cloud.discovery.client;

import com.javatmp.demo.cloud.discovery.client.type.DiscoveryClientType;
import com.javatmp.demo.cloud.discovery.client.type.FeignClientType;
import com.javatmp.demo.cloud.discovery.client.type.RestTemplateClientType;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;

import java.util.List;

@SpringBootTest
@Slf4j
class DemoApplicationTests {

    @Autowired
    DiscoveryClient discoveryClient;
    @Autowired
    DiscoveryClientType discoveryClientType;
    @Autowired
    FeignClientType feignClientType;
    @Autowired
    RestTemplateClientType restTemplateClientType;

    @Test
    void testConnect() {
        List<ServiceInstance> instances = discoveryClient.getInstances("eureka-client");
        log.info("current instances are : {}", instances.size());

        String controllerResponse = null;
        controllerResponse = discoveryClientType.getHello();
        log.info("using getHello.discoveryClientType.getHello() : {}", controllerResponse);
        controllerResponse = feignClientType.getHello();
        log.info("using getHello.feignClientType.getHello() : {}", controllerResponse);
        controllerResponse = restTemplateClientType.getHello();
        log.info("using getHello.restTemplateClientType.getHello() : {}", controllerResponse);
    }

}
