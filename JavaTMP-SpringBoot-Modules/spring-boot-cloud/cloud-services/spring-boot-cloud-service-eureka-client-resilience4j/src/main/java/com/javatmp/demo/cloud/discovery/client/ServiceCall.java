package com.javatmp.demo.cloud.discovery.client;

import com.javatmp.demo.cloud.discovery.client.type.DiscoveryClientType;
import com.javatmp.demo.cloud.discovery.client.type.FeignClientType;
import com.javatmp.demo.cloud.discovery.client.type.RestTemplateClientType;
import io.github.resilience4j.bulkhead.annotation.Bulkhead;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;
import io.github.resilience4j.retry.annotation.Retry;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ServiceCall {

    @Autowired
    DiscoveryClient discoveryClient;
    @Autowired
    DiscoveryClientType discoveryClientType;
    @Autowired
    FeignClientType feignClientType;
    @Autowired
    RestTemplateClientType restTemplateClientType;

    @CircuitBreaker(name = "callService", fallbackMethod = "callServiceFallbackMethod")
    @RateLimiter(name = "callService", fallbackMethod = "callServiceFallbackMethod")
    @Retry(name = "retryCallService", fallbackMethod = "callServiceFallbackMethod")
    @Bulkhead(name = "bulkheadCallService", type = Bulkhead.Type.THREADPOOL,
            fallbackMethod = "callServiceFallbackMethod")
    public void callService() {
        log.info("*** Start Spring Boot Project ***");

        List<ServiceInstance> instances = discoveryClient.getInstances("eureka-client");
        log.info("current instances are : {}", instances.size());

        String controllerResponse = null;
        controllerResponse = discoveryClientType.getHello();
        log.info("using discoveryClientType.getHello() : {}", controllerResponse);
        controllerResponse = feignClientType.getHello();
        log.info("using feignClientType.getHello() : {}", controllerResponse);
        controllerResponse = restTemplateClientType.getHello();
        log.info("using restTemplateClientType.getHello() : {}", controllerResponse);
    }

    @SuppressWarnings("unused")
    private void callServiceFallbackMethod(Throwable t){
        log.info("exception has thrown and catch in fallback : {}", t.getMessage());
    }

}
