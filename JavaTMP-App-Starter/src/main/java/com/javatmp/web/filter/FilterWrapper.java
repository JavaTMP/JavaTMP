package com.javatmp.web.filter;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public abstract class FilterWrapper implements Filter {

    private FilterConfig filterConfig = null;

    private Set<String> excludedUrlsRegex;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        String excludePatterns = filterConfig.getInitParameter("excludedUrlsRegex");
        if (excludePatterns != null && excludePatterns.trim().equals("") == false) {
            setExcludedUrlsRegex(new HashSet<>(Arrays.asList(excludePatterns.split(","))));
        }
    }

    public boolean isExcludedUrl(String requestPath) {
        boolean isExcluded = false;
        if (this.getExcludedUrlsRegex() != null && this.getExcludedUrlsRegex().isEmpty() == false) {
            for (String path : getExcludedUrlsRegex()) {
                if (requestPath.matches(path)) {
                    isExcluded = true;
                    break;
                }
            }
        }
        return isExcluded;
    }

    public boolean isExcludedRequest(HttpServletRequest request) {
        String url = this.getUrl(request);
        return isExcludedUrl(url);
    }

    public static String getBaseUrl(HttpServletRequest request) {
        String scheme = request.getScheme() + "://";
        String serverName = request.getServerName();
        String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
        String contextPath = request.getContextPath();
        return scheme + serverName + serverPort + contextPath;
    }

    public String getUrl(HttpServletRequest request) {
        String url;
        if (request.getQueryString() != null) {
            url = request.getRequestURI() + "?" + request.getQueryString();
        } else {
            url = request.getRequestURI();
        }
        return url.substring(request.getContextPath().length());
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
