package com.javatmp.demo.web.session;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Component
@Slf4j
public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object object) throws Exception {
        log.info("Before Handler execution");
        HttpSession session = request.getSession();
        if (session.getAttribute(Constants.SESSION_KEY) != null) {
            return true;
        }
        String url = "/page/login?redirect=true";
        response.sendRedirect(request.getContextPath() + url);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object object, ModelAndView model)
            throws Exception {
        log.info("Handler execution is complete");
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response,
                                Object object,
                                Exception exception)
            throws Exception {
        log.info("Request is complete");
    }

}
