package com.javatmp.web.filter;

import com.javatmp.fw.util.Constants;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LocalizationFilter extends FilterWrapper {

    public LocalizationFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        log.info("*** Start LocalizationFilter ****");
        Locale locale = null;
        HttpServletRequest httpRequest = null;
        try {
            httpRequest = (HttpServletRequest) request;
            log.info("Is Session New [" + httpRequest.getSession().isNew() + "]");
            log.info("Session ID [" + httpRequest.getSession().getId() + "]");
            log.info("cookies [" + httpRequest.getHeader("cookie") + "]");
            log.info("sesseion key [" + Constants.LANGUAGE_ATTR_KEY + "]=>[" + httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) + "]");

            boolean isExcludedUrl = isExcludedRequest(httpRequest);
            if (isExcludedUrl == true) {
                chain.doFilter(request, response);
            } else if (httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) == null) {
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) == null) {
                    if (httpRequest.getLocale() != null) {
                        log.info("locale [" + httpRequest.getLocale() + "]");
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

                log.info("we will create a bundle now for [" + locale + "]");
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
            } else {
                log.info("Session already contain labels object we check for update");
                log.info("Does request contains parameter ["
                        + Constants.LANG_PARAM_NAME + "]=["
                        + httpRequest.getParameter(Constants.LANG_PARAM_NAME) + "]");
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) != null) {
                    String localeRequested = httpRequest.getParameter(Constants.LANG_PARAM_NAME);
                    log.info("localeRequested is [" + localeRequested + "]");
                    locale = Locale.forLanguageTag(localeRequested);
                    // if provided parameter value is invalid locale key
                    log.info("Locale is [" + locale + "]");
                    if (locale == null) {
                        locale = Locale.forLanguageTag(Constants.DEFAULT_LOCALE_KEY);
                        if (locale == null) {
                            locale = Locale.getDefault();
                        }
                    }
                    log.info("we will create a bundle now for [" + locale + "]");
                    ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                    httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);
                }
            }

            ResourceBundle finalBundle = (ResourceBundle) httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
            log.info("LocalizationFilter Lang is [" + finalBundle.getLocale() + "]");
            chain.doFilter(request, response);
        } catch (Throwable t) {
            t.printStackTrace();
        }

    }

}
