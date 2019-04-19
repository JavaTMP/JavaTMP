package com.javatmp.web.filter;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;

public abstract class FilterWrapper implements Filter {

    private static final Logger logger = Logger.getLogger(FilterWrapper.class.getName());

    private FilterConfig filterConfig = null;

    private Set<String> excludedUrlsRegex;

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        String excludePattern = filterConfig.getInitParameter("excludedUrlsRegex");
        setExcludedUrlsRegex(new HashSet<>(Arrays.asList(excludePattern.split(","))));
    }

    public boolean isExcludedUrl(String requestPath) {
        boolean isExcluded = false;
        for (String path : getExcludedUrlsRegex()) {
            if (requestPath.matches(path)) {
                isExcluded = true;
                break;
            }
        }
        return isExcluded;
    }

    public static String getBaseUrl(HttpServletRequest request) {
        String scheme = request.getScheme() + "://";
        String serverName = request.getServerName();
        String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
        String contextPath = request.getContextPath();
        return scheme + serverName + serverPort + contextPath;
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return this.filterConfig;
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
    }

    /**
     * @return the excludedUrlsRegex
     */
    public Set<String> getExcludedUrlsRegex() {
        return excludedUrlsRegex;
    }

    /**
     * @param excludedUrlsRegex the excludedUrlsRegex to set
     */
    public void setExcludedUrlsRegex(Set<String> excludedUrlsRegex) {
        this.excludedUrlsRegex = excludedUrlsRegex;
    }
}
