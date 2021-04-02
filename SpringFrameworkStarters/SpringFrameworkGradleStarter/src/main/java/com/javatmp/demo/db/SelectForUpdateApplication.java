package com.javatmp.demo.db;

import com.javatmp.demo.db.config.AppPUConfig;
import com.javatmp.demo.db.entity.User;
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
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.io.IOException;
import java.util.Date;
import java.util.Optional;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.stream.Stream;

import static com.javatmp.demo.db.config.AppPUConfig.TRANSACTION_MANAGER_REF;

@Slf4j
@Component
@ComponentScan()
public class SelectForUpdateApplication {

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
        ctx.register(SelectForUpdateApplication.class);
        ctx.refresh();
        SelectForUpdateApplication bean = ctx.getBean(SelectForUpdateApplication.class);

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

    @Transactional(transactionManager = TRANSACTION_MANAGER_REF)
    public void run() throws ExecutionException, InterruptedException {

        // fetch an individual customer by ID
        Optional<User> customer1 = repository.findById(1L);
        log.info("Customer found with findById(1L):");
        log.info("--------------------------------");
        log.info("customer by findById : {}", customer1);
        log.info("");

        Pageable page = PageRequest.of(10, 10);
        log.info("page is :{}", page);
        Page<User> customers = repository.findAll(page);
        for (User customer11 : customers) {
            log.info("customer from page is {}", customer11);
        }

        Future<User> completableFuture =
                repository.findOneById(1L);

        User come = completableFuture.get();
        log.info("customer from completeable futrue is : {}", come);

        Stream<User> customerStream = repository.selectForUpdateNative(0);
        Optional<User> optionalCustomer = customerStream.findFirst();
        log.info("is present : {}", optionalCustomer.isPresent());
        optionalCustomer.ifPresent(customer -> {
            log.info("customer exists is {}", customer);
//            customer.setStatus(1);
            repository.updateUserStatus(customer.getId(),
                    customer.getStatus());
        });
        log.info("customer1 isPresent : {}", customer1.isPresent());

        customerStream.close();


    }

}
