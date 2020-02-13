/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.web.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class CustomErrorPageController implements ErrorController {

    // read more : https://stackoverflow.com/questions/25356781/spring-boot-remove-whitelabel-error-page
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, HttpServletResponse response) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");

        log.debug("custom error for statusCode {}, exception {}", statusCode, exception);

        return "/pages/system/error.jsp";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
