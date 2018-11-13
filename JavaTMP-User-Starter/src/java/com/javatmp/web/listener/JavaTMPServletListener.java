package com.javatmp.web.listener;

import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class JavaTMPServletListener implements ServletContextListener {

    private final Logger logger = Logger.getLogger(getClass().getName());
    ServicesFactory sf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("*** Start App @ [" + new Date() + "] ***");
        // just for demo:
        // -Duser.timezone=UTC
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        sf = new ServicesFactory(Constants.DEFAULT_PERSISTENT_UNIT_NAME);
        sce.getServletContext().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, sf);
        logger.info("****** End @ [" + new Date() + "] *********");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        sce.getServletContext().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        sf.destroy();
        logger.info("*** End App @ [" + new Date() + "] ***");
    }
}
