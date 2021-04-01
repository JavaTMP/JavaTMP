package com.javatmp.demo;

import com.javatmp.demo.config.AppPUConfig;
import com.javatmp.demo.entity.User;
import com.javatmp.demo.repository.UserRepository;
import com.javatmp.demo.repository1.UserRepository1;
import com.javatmp.demo.service.DateTimeService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

@Slf4j
@Component
@ComponentScan
public class RestTemplateApplication {

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
