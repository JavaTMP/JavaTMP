package com.javatmp.demo.core.bundles;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.MessageSourceAccessor;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Spring Boot Main Runner Class
 */
@SpringBootApplication
@Slf4j
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Bean
    public CommandLineRunner nativeResourceBundle(ApplicationContext applicationContext) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            Locale locale = new Locale("ar", "UAE");
            ResourceBundle bundle = ResourceBundle.getBundle("i18n.messages", locale);

            log.info("Bundle Locale is {}", bundle.getLocale());
            log.info("application name is : {}", bundle.getString("global.page.title"));

        };
    }

    @Bean
    public CommandLineRunner usingMessageSource(
            ApplicationContext applicationContext,
            MessageSource messageSource) throws Exception {
        return args -> {
            log.info("*** Start Spring Boot Project ***");
            Locale locale = new Locale("ar", "UAE");
            String paramsArray[] = {"parameter 1","parameter 2"};

            MessageSourceAccessor bundle = new MessageSourceAccessor(
                    messageSource, locale);

            log.info("application name is : {}", messageSource.getMessage("global.page.title", null, locale));
            log.info("application name by wrapper is : {}", bundle.getMessage("global.page.title"));

            log.info("application name by container is : {}",
                    applicationContext.getMessage("global.page.title",
                            paramsArray, locale));

        };
    }
}
