package com.javatmp.demo.cloud.discovery.client;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;

import java.util.List;

@SpringBootTest()
@Slf4j
class DemoApplicationTests {

    @Autowired
    DiscoveryClient discoveryClient;

    @Test
    void testConnect() {
        List<ServiceInstance> instances = discoveryClient.getInstances("eureka-client");
        log.info("current instances are : {}", instances.size());

 }

}
