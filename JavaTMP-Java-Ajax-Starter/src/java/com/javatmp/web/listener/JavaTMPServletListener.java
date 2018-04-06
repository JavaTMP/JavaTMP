/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.web.listener;

import java.util.Date;
import java.util.logging.LogManager;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class JavaTMPServletListener implements ServletContextListener {

    private Logger logger = LogManager.getLogManager().getLogger(JavaTMPServletListener.class.getName());

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().log("*** Start App @ [" + new Date() + "] ***");
        sce.getServletContext().log("****** End *********");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("*** End App @ [" + new Date() + "] ***");
    }
}
