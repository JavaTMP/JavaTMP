package com.javatmp;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

@Slf4j
@SpringBootApplication
public class JavaTmpAppStarterApplication extends SpringBootServletInitializer implements CommandLineRunner {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(JavaTmpAppStarterApplication.class);
    }

    public static void main(String[] args) {

        ApplicationContext context = SpringApplication.run(JavaTmpAppStarterApplication.class, args);

        for (String name : context.getBeanDefinitionNames()) {
//            log.debug("name [{}] type [{}]", name, context.getBean(name).getClass());
        }
    }

    @Override
    @Order(Ordered.LOWEST_PRECEDENCE)
    public void run(String... args) throws Exception {
        log.info("CommandLineRunner.run start");
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource[] resources = resolver.getResources("classpath:*");
        log.info("resources count = " + resources.length);
        for(Resource resource : resources) {
            log.info("resource is file = " + resource.isFile());
            log.info("resource urI = " + resource.getURI());
            log.info("resource filename = " + resource.getFilename());
        }
        log.info("ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX = " + ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX);
    }

}
