package com.javatmp.web.filter;

import com.javatmp.module.activity.Activity;
import com.javatmp.module.activity.ActivityService;
import com.javatmp.module.user.entity.User;
import java.io.IOException;
import java.util.Date;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
public class LoggingFilter extends FilterWrapper {

    @Autowired
    ActivityService activityService;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        Date creationDate = new Date();
        long startTime = creationDate.getTime();
        String ipAddress = request.getRemoteAddr();

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        boolean isExcludedUrl = isExcludedRequest(httpRequest);
        if (isExcludedUrl == true) {
            chain.doFilter(request, response);
        } else {
            Activity activity = new Activity();
            activity.setCreationDate(creationDate);
            activity.setIPaddress(ipAddress);
            activity.setActionType("page_view");
            String url = this.getUrl(httpRequest);
            log.debug("url to be logging in db is [" + url + "]");
            activity.setActionId(url);
            getServiceFactory().getActivityService().save(activity);

            HttpSession session = httpRequest.getSession(false);
            if (session != null) {
                activity.setSessionId(session.getId());
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    activity.setUserId(user.getId());
                }
            }

            chain.doFilter(request, response);

            // check if session exist:
            session = httpRequest.getSession(false);
            if (session != null) {
                activity.setSessionId(session.getId());
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    activity.setUserId(user.getId());
                }
            }

            long endTime = new Date().getTime();
            long lastTime = (endTime - startTime);
            log.info("URI [" + httpRequest.getRequestURI() + "]=[" + (endTime - startTime) + "] milliseconds");

            activity.setTimeLast(lastTime);
            this.getServiceFactory().getActivityService().merge(activity);
        }
    }
}
