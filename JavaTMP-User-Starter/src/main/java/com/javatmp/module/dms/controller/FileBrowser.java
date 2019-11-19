package com.javatmp.module.dms.controller;

import com.javatmp.module.user.entity.User;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/dms/FileBrowser")
public class FileBrowser extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);

        String requestPage = "/WEB-INF/pages/dms/FileBrowser.jsp";
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        logger.info("logged in user [" + loggedInUser + "] and username is [" + loggedInUser.getUserName() + "]");

        request.getRequestDispatcher(requestPage).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);

        String basePath = request.getServletContext().getRealPath("");
        String parent = request.getParameter("parent");
        logger.info("parent [" + parent + "]");
        File file = new File(basePath, parent);

        logger.info("basePath [" + basePath + "]");
        logger.info("file [" + file.getAbsolutePath() + "]");

        List<Map<String, Object>> files = new LinkedList<>();
        File[] children = file.listFiles();
        Arrays.sort(children, new Comparator<File>() {
            @Override
            public int compare(File o1, File o2) {
                File f1 = (File) o1;
                File f2 = (File) o2;
                if (f1.isDirectory() && !f2.isDirectory()) {
                    // Directory before non-directory
                    return -1;
                } else if (!f1.isDirectory() && f2.isDirectory()) {
                    // Non-directory after directory
                    return 1;
                } else {
                    // Alphabetic order otherwise
                    return o1.compareTo(o2);
                }
            }
        });
        for (File item : children) {
            Map<String, Object> myMap = new HashMap<>();
            myMap.put("title", item.getName());
            myMap.put("size", item.length());
            if (item.isDirectory()) {
                myMap.put("folder", item.isDirectory());
                myMap.put("lazy", item.isDirectory());
                myMap.put("expanded", !item.isDirectory());
                myMap.put("logicalPath", item.getAbsolutePath().substring(basePath.length()));
            }
            logger.info(item.getAbsolutePath().substring(basePath.length()));
            files.add(myMap);
        }

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(files);
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
