package com.javatmp.web.listener;

import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class JavaTMPHttpSessionListener implements HttpSessionListener {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        logger.info("sessionCreated @ [" + new Date() + "]");
        logger.info("created id [" + se.getSession().getId() + "]");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        logger.info("sessionDestroyed @ [" + new Date() + "]");
        logger.info("Destroyed id [" + se.getSession().getId() + "]");
        ServicesFactory sf = (ServicesFactory) se.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        if (sf != null) {
            sf.destroy();
        }
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        se.getSession().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
    }
}
