package com.javatmp.demo.db;

import com.javatmp.demo.db.config.AppPUConfig;
import com.javatmp.demo.db.entity.User;
import com.javatmp.demo.db.entity.User_;
import com.javatmp.demo.db.repository.UserRepository;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.io.IOException;
import java.util.Optional;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.stream.Stream;

@Slf4j
@Component
@ComponentScan()
public class UserPageableApplication {

    @Autowired
    UserRepository repository;
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
    @Autowired
    private Environment env;
    @Autowired
    private ApplicationConfiguration applicationConfiguration;

    public static void main(String[] args) throws IOException, ExecutionException, InterruptedException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("my.properties");
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        ctx.register(UserPageableApplication.class);
        ctx.refresh();
        UserPageableApplication bean = ctx.getBean(UserPageableApplication.class);

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

        bean.run();
    }

    public void run() throws ExecutionException, InterruptedException {
        Pageable page = PageRequest.of(0, 10);
        log.info("page is :{}", page);
        Page<User> customers = repository.findAll(page);
        customers.stream().forEach(user -> {
            log.info("customer from page is {}", user.getUserName());
        });
        page = PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, User_.USER_NAME));
        log.info("page is :{}", page);
        customers = repository.findAll(page);
        customers.stream().forEach(user -> {
            log.info("customer from page is {}", user.getUserName());
        });

    }

}
