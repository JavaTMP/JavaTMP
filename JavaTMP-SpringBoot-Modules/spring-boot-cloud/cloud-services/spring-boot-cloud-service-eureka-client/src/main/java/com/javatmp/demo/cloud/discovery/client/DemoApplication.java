package com.javatmp.demo.cloud.discovery.client;

import com.javatmp.demo.cloud.discovery.client.type.DiscoveryClientType;
import com.javatmp.demo.cloud.discovery.client.type.FeignClientType;
import com.javatmp.demo.cloud.discovery.client.type.RestTemplateClientType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import java.util.List;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
@RefreshScope
@EnableDiscoveryClient
@EnableFeignClients
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @LoadBalanced
    @Bean
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }

    @Value("${application.message}")
    String message;

    @Bean
    public CommandLineRunner springBootMain(
            DiscoveryClient discoveryClient,
            DiscoveryClientType discoveryClientType,
            FeignClientType feignClientType,
            RestTemplateClientType restTemplateClientType) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");

            Thread.sleep(60 * 1000);

            List<ServiceInstance> instances = discoveryClient.getInstances("eureka-client");
            log.info("current instances are : {}", instances.size());

            String controllerResponse = null;
            controllerResponse = discoveryClientType.getHello();
            Thread.sleep(5 * 1000);
            log.info("using discoveryClientType.getHello() : {}", controllerResponse);
            Thread.sleep(5 * 1000);
            controllerResponse = feignClientType.getHello();
            log.info("using feignClientType.getHello() : {}", controllerResponse);
            Thread.sleep(5 * 1000);
            controllerResponse = restTemplateClientType.getHello();
            log.info("using restTemplateClientType.getHello() : {}", controllerResponse);
        };
    }

}
