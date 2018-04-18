package com.javatmp.web.controller.tree;

import com.javatmp.web.controller.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.User;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
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
import javax.servlet.http.HttpSession;

@WebServlet("/tree/files")
public class Files extends HttpServlet {

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

        Gson gson = new GsonBuilder().serializeNulls()
                .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                .create();
        String json = gson.toJson(files);
        System.out.println("loginController response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServicesFactory sf = (ServicesFactory) session.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);

        User user = new User();
        ResponseMessage responseMessage = new ResponseMessage();
        try {
            MvcHelper.populateBeanByRequestParameters(request, user);
            System.out.println("Check User [" + MvcHelper.deepToString(user) + "]");
            User dbUser = sf.getUserService().readUserByUsername(user);

            if (dbUser != null && dbUser.getPassword().equals(MD5Util.convertToMD5(user.getPassword()))) {
                // Authenticated user
                session.setAttribute("user", dbUser);

                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage(request.getContextPath() + "/");
            } else {
                // un authenticated user
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("kindly Check your username and password or Refresh current page");
            }

            Gson gson = new GsonBuilder().serializeNulls()
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    .create();
            String json = gson.toJson(responseMessage);
            System.out.println("loginController response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }

}
