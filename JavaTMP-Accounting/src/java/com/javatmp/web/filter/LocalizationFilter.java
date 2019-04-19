package com.javatmp.web.filter;

import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LocalizationFilter extends FilterWrapper {

    private final Logger logger = Logger.getLogger(getClass().getName());

    public LocalizationFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        logger.info("*** Start LocalizationFilter ****");
        Locale locale = null;
        HttpServletRequest httpRequest = null;
        try {
            httpRequest = (HttpServletRequest) request;
            logger.info("Is Session New [" + httpRequest.getSession().isNew() + "]");
            logger.info("Session ID [" + httpRequest.getSession().getId() + "]");
            logger.info("cookies [" + httpRequest.getHeader("cookie") + "]");
            logger.info("sesseion key [" + Constants.LANGUAGE_ATTR_KEY + "]=>[" + httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) + "]");

            boolean isExcludedUrl = isExcludedRequest(httpRequest);
            if (isExcludedUrl == true) {
                chain.doFilter(request, response);
            } else if (httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) == null) {
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) == null) {
                    if (httpRequest.getLocale() != null) {
                        logger.info("locale [" + httpRequest.getLocale() + "]");
                        locale = httpRequest.getLocale();
                    } else {
                        locale = Locale.forLanguageTag(Constants.DEFAULT_LOCALE_KEY);
                        if (locale == null) {
                            locale = Locale.getDefault();
                        }
                    }
                } else {
                    String localeRequested = httpRequest.getParameter(Constants.LANG_PARAM_NAME);
                    locale = Locale.forLanguageTag(localeRequested);
                    if (locale == null) {
                        locale = Locale.getDefault();
                    }
                }

                logger.info("we will create a bundle now for [" + locale + "]");
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
            } else {
                logger.info("Session already contain labels object we check for update");
                logger.info("Does request contains parameter ["
                        + Constants.LANG_PARAM_NAME + "]=["
                        + httpRequest.getParameter(Constants.LANG_PARAM_NAME) + "]");
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) != null) {
                    String localeRequested = httpRequest.getParameter(Constants.LANG_PARAM_NAME);
                    logger.info("localeRequested is [" + localeRequested + "]");
                    locale = Locale.forLanguageTag(localeRequested);
                    // if provided parameter value is invalid locale key
                    logger.info("Locale is [" + locale + "]");
                    if (locale == null) {
                        locale = Locale.forLanguageTag(Constants.DEFAULT_LOCALE_KEY);
                        if (locale == null) {
                            locale = Locale.getDefault();
                        }
                    }
                    logger.info("we will create a bundle now for [" + locale + "]");
                    ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                    httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                }
            }

            ResourceBundle finalBundle = (ResourceBundle) httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
            logger.info("LocalizationFilter Lang is [" + finalBundle.getLocale() + "]");
            chain.doFilter(request, response);
        } catch (Throwable t) {
            t.printStackTrace();
        }

    }

}
