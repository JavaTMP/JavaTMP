package com.javatmp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class JavaTmpAppStarterApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(JavaTmpAppStarterApplication.class);
    }

    public static void main(String[] args) {

        ApplicationContext context = SpringApplication.run(JavaTmpAppStarterApplication.class, args);

        for (String name : context.getBeanDefinitionNames()) {
            System.out.println("name [" + name + "] type [" + context.getBean(name).getClass() + "]");
        }
    }

}
