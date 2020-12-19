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
        basePackages = {AppPU1Config.BASE_PACKAGES},
        entityManagerFactoryRef = AppPU1Config.ENTITY_MANAGER_FACTORY_REF,
        transactionManagerRef = AppPU1Config.TRANSACTION_MANAGER_REF
//        ,repositoryBaseClass = ExtendedJpaRepositoryImpl.class
)
public class AppPU1Config {
    public static final String PERSISTENT_UNIT_NAME = "AppPU1";
    public static final String BASE_PACKAGES = "com.javatmp.demo.repository1";
    public static final String ENTITY_MANAGER_FACTORY_REF = PERSISTENT_UNIT_NAME + "EntityManagerFactory";
    public static final String TRANSACTION_MANAGER_REF = PERSISTENT_UNIT_NAME + "EntityManagerTransactionManager";

    @Bean(name = ENTITY_MANAGER_FACTORY_REF)
    public LocalContainerEntityManagerFactoryBean createEntityManagerFactory() {
        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();
//        factory.setPackagesToScan("com.javatmp.demo.repository");
//        factory.setDataSource(h2DataSource());
//        factory.setPersistenceProviderClass(HibernatePersistenceProvider.class);
        //comment the following line if you want to use default META-INF/persistence.xml
//        factory.setPersistenceXmlLocation("jpa/my-persistence.xml");
        Properties properties = new Properties();
//        properties.setProperty("javax.persistence.schema-generation.database.action", "create");
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
