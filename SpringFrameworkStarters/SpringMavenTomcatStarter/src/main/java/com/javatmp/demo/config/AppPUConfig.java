package com.javatmp.demo.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        basePackages = {AppPUConfig.BASE_PACKAGES},
        entityManagerFactoryRef = AppPUConfig.ENTITY_MANAGER_FACTORY_REF,
        transactionManagerRef = AppPUConfig.TRANSACTION_MANAGER_REF
)
public class AppPUConfig {
    public static final String PERSISTENT_UNIT_NAME = "AppPU";
    public static final String BASE_PACKAGES = "com.javatmp.demo.repository";
    public static final String ENTITY_MANAGER_FACTORY_REF = PERSISTENT_UNIT_NAME + "EntityManagerFactory";
    public static final String TRANSACTION_MANAGER_REF = PERSISTENT_UNIT_NAME + "EntityManagerTransactionManager";

    @Bean(name = ENTITY_MANAGER_FACTORY_REF)
    public LocalContainerEntityManagerFactoryBean createEntityManagerFactory() {
        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();
        Properties properties = new Properties();
        factory.setJpaProperties(properties);
        factory.setPersistenceUnitName(PERSISTENT_UNIT_NAME);
        return factory;
    }

    @Bean(name = TRANSACTION_MANAGER_REF)
    PlatformTransactionManager createTransactionManager(
            @Qualifier(ENTITY_MANAGER_FACTORY_REF)
                    LocalContainerEntityManagerFactoryBean
                    entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory.getObject());
    }
}
