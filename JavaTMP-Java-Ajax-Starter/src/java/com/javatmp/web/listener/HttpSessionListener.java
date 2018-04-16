package com.javatmp.web.listener;

import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import javax.servlet.http.HttpSessionEvent;

public class HttpSessionListener implements javax.servlet.http.HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, new ServicesFactory());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServicesFactory sf = (ServicesFactory) se.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        sf.destroy();
        se.getSession().setAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME, null);
        se.getSession().removeAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

    }
}
