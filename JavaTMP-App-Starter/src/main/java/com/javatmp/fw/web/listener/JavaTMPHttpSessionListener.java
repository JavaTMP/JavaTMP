package com.javatmp.fw.web.listener;

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
    }
}
