package com.javatmp.demo;

import com.javatmp.demo.db.config.AppPUConfig;
import com.javatmp.demo.db.entity.User;
import com.javatmp.demo.db.repository.UserRepository;
import com.javatmp.demo.db.repository1.UserRepository1;
import com.javatmp.demo.db.service.DateTimeService;
import com.javatmp.demo.rest.RestTemplateApplication;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.Properties;

@Slf4j
@Component
@ComponentScan
public class  RestOauth2TemplateApplication {

    @Autowired
    RestTemplate restTemplate;

    public static void main(String[] args) throws IOException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("my.properties");
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        ctx.register(RestTemplateApplication.class);
        ctx.refresh();
        RestTemplateApplication bean = ctx.getBean(RestTemplateApplication.class);
        bean.run();

        final Thread mainThread = Thread.currentThread();
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @SneakyThrows
            public void run() {
                log.info("*** Application Shutdown Starting ***");
                ctx.close();
                mainThread.join(5 * 1000);
                log.info("*** Application Shutdown End ***");
            }
        });
    }

    public void run() {



    }

}
