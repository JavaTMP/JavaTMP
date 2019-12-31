package com.javatmp.web.listener;

import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@WebListener
@Slf4j
public class JavaTMPServletListener implements ServletContextListener {

    EntityManagerFactory emf;

    ServicesFactory sf;

    public JavaTMPServletListener() {

    }

    public JavaTMPServletListener(EntityManagerFactory emf) {
        this.emf = emf;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("*** Start App @ [" + new Date() + "] ***");
        // just for demo:
        // -Duser.timezone=UTC
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        sf = new ServicesFactory(this.emf);
        sce.getServletContext().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, sf);
        log.info("****** End @ [" + new Date() + "] *********");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        sce.getServletContext().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        sf.destroy();
        log.info("*** End App @ [" + new Date() + "] ***");
    }
}
