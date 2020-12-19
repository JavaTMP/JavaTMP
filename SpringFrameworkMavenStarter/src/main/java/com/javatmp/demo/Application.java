package com.javatmp.demo;

import com.javatmp.demo.config.AppPUConfig;
import com.javatmp.demo.entity.User;
import com.javatmp.demo.repository.UserRepository;
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
public class Application {

    @Value("${db.username}")
    private String dbUser;

    @Autowired
    private Environment env;

    @Autowired
    private DateTimeService dateTimeService;

    @Autowired
    private ApplicationConfiguration applicationConfiguration;

    @Autowired
    UserRepository userRepository;

    /*
        @PersistenceContext are called Container Managed Entity Manager
        @PersistenceUnit / entityManagerFactory.createEntityManager() are Application Managed Entity Manager
        https://stackoverflow.com/questions/21038706/persistenceunit-vs-persistencecontext
        https://www.logicbig.com/tutorials/java-ee-tutorial/jpa/entity-context.html
     */
//    @Autowired
    @PersistenceUnit(unitName = AppPUConfig.ENTITY_MANAGER_FACTORY_REF)
    EntityManagerFactory emf;

//    @Autowired
    @PersistenceContext(unitName = AppPUConfig.ENTITY_MANAGER_FACTORY_REF)
    EntityManager em;

    public static void main(String[] args) throws IOException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("c:/my.properties");
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        ctx.register(Application.class);
        ctx.refresh();
        Application bean = ctx.getBean(Application.class);
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
        log.info("data user is : {}", this.dbUser);
        log.info("emf : {}", emf);

        EntityManager em = emf.createEntityManager();
        log.info("em is : {}", em);

        User user = em.find(User.class, new Long(1));

        log.debug("user is : {}", user);

        User user2 = userRepository.findByUserName("Petra64").get();

        log.debug("user2 : {}", user2);

        user2.setLastAccessTime(new Date());

        userRepository.save(user2);

        em.close();

        log.info("user repository is : {}", userRepository);

        User user3 = this.em.find(User.class, 3L);

        log.info("user3 : {}", user3);
    }

}
