package com.javatmp.web.listener;

import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class JavaTMPServletListener implements ServletContextListener {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("*** Start App @ [" + new Date() + "] ***");
        // just for demo:
        // -Duser.timezone=UTC
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        sce.getServletContext().log("****** End @ [" + new Date() + "] *********");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        logger.info("*** End App @ [" + new Date() + "] ***");
    }
}
