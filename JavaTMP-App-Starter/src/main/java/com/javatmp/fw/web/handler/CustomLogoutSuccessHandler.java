/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.web.handler;

import com.javatmp.fw.util.Constants;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
//        response.setStatus(HttpServletResponse.SC_OK);
        HttpSession session = request.getSession();
//        session.setAttribute(Constants.LANGUAGE_ATTR_KEY, null);
//        session.removeAttribute(Constants.LANGUAGE_ATTR_KEY);
//        session.setAttribute(Constants.LOG_IN_USER_NAME, null);
        session.removeAttribute(Constants.LOG_IN_USER_NAME);
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
