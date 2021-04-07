package com.javatmp.demo.db;

import com.javatmp.demo.db.entity.User;
import com.javatmp.demo.db.entity.User_;
import com.javatmp.demo.db.repository.UserSpecificationRepository;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ExecutionException;

@Slf4j
@Component
@ComponentScan()
public class UserSpecificationApplication {

    @Autowired
    UserSpecificationRepository userSpecRepository;

    public static void main(String[] args) throws IOException, ExecutionException, InterruptedException {

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();

        Properties props = PropertiesLoaderUtils.loadAllProperties("my.properties");
        ctx.getEnvironment().getPropertySources().addLast(new PropertiesPropertySource("myProps", props));
        ctx.register(UserSpecificationApplication.class);
        ctx.refresh();
        UserSpecificationApplication bean = ctx.getBean(UserSpecificationApplication.class);

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

        List<User> users = this.userSpecRepository.findAll(
                (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(User_.id), 1L));

        users.stream().forEach(user -> {
            log.info("user is : {}", user);
        });


    }

}
