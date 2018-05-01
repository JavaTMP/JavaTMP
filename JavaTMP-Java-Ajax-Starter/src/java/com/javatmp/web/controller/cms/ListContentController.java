package com.javatmp.web.controller.cms;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Content;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ContentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cms/ListContentController")
public class ListContentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ContentService cs = sf.getContentService();

        Page<Content> requestedPage = new Page<>(Content.class);
        try {
            MvcHelper.populateBeanByRequestParameters(request, requestedPage);
            requestedPage = cs.listContent(requestedPage);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Content Read successfully");
            responseMessage.setData(requestedPage);
            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                    .create();
            String json = gson.toJson(responseMessage);
            System.out.println("response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(ListContentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ListContentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
