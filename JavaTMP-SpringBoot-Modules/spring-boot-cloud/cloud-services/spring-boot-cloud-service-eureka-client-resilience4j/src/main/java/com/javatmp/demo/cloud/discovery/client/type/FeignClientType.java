package com.javatmp.demo.cloud.discovery.client.type;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient("eureka-client")
public interface FeignClientType {
    @RequestMapping(
            method= RequestMethod.GET,
            value="/hello",
            consumes="application/json")
    public String getHello();
}
