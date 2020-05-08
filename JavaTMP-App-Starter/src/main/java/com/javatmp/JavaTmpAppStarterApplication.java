package com.javatmp;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import java.io.File;

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
        Resource[] resources = resolver.getResources(".");
        log.info("resources count = " + resources.length);
        for(Resource resource : resources) {
            log.info("resource is file = " + resource.isFile());
            log.info("resource urI = " + resource.getURI());
            log.info("resource filename = " + resource.getFilename());
        }
        File file = new File(".");
        log.info("file of . is = [" + file.getAbsolutePath() + "]");

        ApplicationHome home = new ApplicationHome(JavaTmpAppStarterApplication.class);
        System.out.println("home get dir [" + home.getDir() + "]");    // returns the folder where the jar is. This is what I wanted.
        System.out.println("home getSource [" + home.getSource() + "]"); // returns the jar absolute path.


    }

}
