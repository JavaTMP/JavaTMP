package com.javatmp.web.controller.tree;

import com.javatmp.mvc.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tree/files")
public class FilesBrowserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResourceBundle bundle = (ResourceBundle) request.getSession().getAttribute(Constants.LANGUAGE_ATTR_KEY);

        String basePath = request.getServletContext().getRealPath("");
        String parent = request.getParameter("parent");
        System.out.println("parent [" + parent + "]");
        File file = new File(basePath, parent);

        System.out.println("basePath [" + basePath + "]");
        System.out.println("file [" + file.getAbsolutePath() + "]");

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
            if (item.isDirectory()) {
                myMap.put("folder", item.isDirectory());
                myMap.put("lazy", item.isDirectory());
                myMap.put("expanded", !item.isDirectory());
                myMap.put("logicalPath", item.getAbsolutePath().substring(basePath.length()));
            }
            System.out.println(item.getAbsolutePath().substring(basePath.length()));
            files.add(myMap);
        }

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(files);
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
