package com.javatmp.web.listener;

import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.util.Date;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class JavaTMPHttpSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("sessionCreated @ [" + new Date() + "]");
        System.out.println("created id [" + se.getSession().getId() + "]");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("sessionDestroyed @ [" + new Date() + "]");
        System.out.println("Destroyed id [" + se.getSession().getId() + "]");
        ServicesFactory sf = (ServicesFactory) se.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        if (sf != null) {
            sf.destroy();
        }
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        se.getSession().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
    }
}
