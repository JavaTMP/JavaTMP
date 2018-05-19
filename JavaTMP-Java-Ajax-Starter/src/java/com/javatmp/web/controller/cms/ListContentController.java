package com.javatmp.web.controller.cms;

import com.javatmp.domain.Content;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.Page;
import com.javatmp.mvc.ResponseMessage;
import com.javatmp.service.ContentService;
import com.javatmp.service.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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
            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(ListContentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ListContentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
