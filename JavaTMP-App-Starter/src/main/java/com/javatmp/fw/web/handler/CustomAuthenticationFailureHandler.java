/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.web.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Constants;
import java.io.IOException;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException ae) throws IOException, ServletException {
        ResourceBundle labels = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);
        ResponseMessage responseMessage = new ResponseMessage(false, labels.getString("action.login.wrongUserOrPassword"), 0);
        String responseStr = objectMapper.writeValueAsString(responseMessage);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(responseStr);

    }

}
