package com.javatmp.fw.web.listener;

import java.util.Date;
import java.util.TimeZone;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class JavaTMPServletListener implements ServletContextListener {

    EntityManagerFactory emf;

    public JavaTMPServletListener(EntityManagerFactory emf) {
        this.emf = emf;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("*** Start App @ [" + new Date() + "] ***");
        // just for demo:
        // -Duser.timezone=UTC
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));

        log.info("****** End @ [" + new Date() + "] *********");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        log.info("*** End App @ [" + new Date() + "] ***");
    }
}
