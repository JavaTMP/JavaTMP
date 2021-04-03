package com.javatmp.demo.general;

import com.javatmp.demo.db.ApplicationConfiguration;
import com.javatmp.demo.db.service.DateTimeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Properties;

@Slf4j
@Component
@ComponentScan
public class ApplicationOld {

    @Autowired
    private Environment env;

    @Autowired
    private DateTimeService dateTimeService;

    @Autowired
    private ApplicationConfiguration applicationConfiguration;

    public static void main(String[] args) throws IOException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("my.properties");
        PropertySourcesPlaceholderConfigurer properties = new PropertySourcesPlaceholderConfigurer();
        properties.setIgnoreResourceNotFound(false);
        properties.setProperties(props);

//        Environment environment = ctx.getBean(Environment.class);
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        // new PropertiesPropertySource("myProps", props)
//        ctx.scan(Application.class.getPackage().getName());
        ctx.register(ApplicationOld.class);
        ctx.refresh();
        ApplicationOld bean = ctx.getBean(ApplicationOld.class);
        bean.run();

        ctx.close();
    }

//    @Bean
//    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
//        PropertySourcesPlaceholderConfigurer properties = new PropertySourcesPlaceholderConfigurer();
////        properties.setLocation();
//        return properties;
//    }

    public void run() {
        log.info("Current time: {}", dateTimeService.getTime());
        log.info("Current date: {}", dateTimeService.getDate());
        log.info("Current datetime: {}", dateTimeService.getDateTime());
        log.info("env is : {}", env);
        log.info("ApplicationConfiguration is : {}", applicationConfiguration);
    }

}
