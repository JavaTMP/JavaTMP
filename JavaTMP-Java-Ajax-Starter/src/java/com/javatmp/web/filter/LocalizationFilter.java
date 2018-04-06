/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.web.filter;

import com.javatmp.util.Constants;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "LocalizationFilter", urlPatterns = {"/*"})
public class LocalizationFilter implements Filter {

    private FilterConfig filterConfig = null;

    public LocalizationFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        this.filterConfig.getServletContext().log("*** Start LocalizationFilter ****");
        Locale locale = null;
        HttpServletRequest httpRequest = null;
        try {
            httpRequest = (HttpServletRequest) request;

            this.filterConfig.getServletContext().log("sesseion key ["
                    + Constants.LANGUAGE_ATTR_KEY + "]=>["
                    + httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) + "]");
            if (httpRequest.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY) == null) {
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) == null) {
                    if (httpRequest.getLocale() != null) {
                        this.filterConfig.getServletContext().log("locale [" + httpRequest.getLocale() + "]");
                        locale = httpRequest.getLocale();
                    } else {
                        locale = Locale.forLanguageTag(Constants.DEFAULT_LOCALE_KEY);
                    }
                } else {
                    String localeRequested = httpRequest.getParameter(Constants.LANG_PARAM_NAME);
                    locale = Locale.forLanguageTag(localeRequested);
                }

                this.filterConfig.getServletContext().log("we will create a bundle now for [" + locale + "]");
                ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);

            } else {
                if (httpRequest.getParameter(Constants.LANG_PARAM_NAME) != null) {
                    String localeRequested = httpRequest.getParameter(Constants.LANG_PARAM_NAME);
                    locale = Locale.forLanguageTag(localeRequested);

                    this.filterConfig.getServletContext().log("we will create a bundle now for [" + locale + "]");
                    ResourceBundle bundle = ResourceBundle.getBundle(Constants.RESOURCE_BUNDLE_BASE_NAME, locale);
                    httpRequest.getSession().setAttribute(Constants.LANGUAGE_ATTR_KEY, bundle);

                }
            }
            this.filterConfig.getServletContext()
                    .log(httpRequest.getSession()
                            .getAttribute(Constants.LANGUAGE_ATTR_KEY).toString());
            chain.doFilter(request, response);
        } catch (Throwable t) {
            t.printStackTrace();
        }

    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            this.filterConfig.getServletContext().log("LocalizationFilter:Initializing filter");

        }
    }

    public void destroy() {
        this.filterConfig.getServletContext().log("Destroy LocalizationFilter filter");
    }

}
