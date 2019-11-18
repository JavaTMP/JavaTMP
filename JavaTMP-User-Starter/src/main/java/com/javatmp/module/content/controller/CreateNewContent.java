package com.javatmp.module.content.controller;

import com.javatmp.module.user.entity.User;
import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.content.entity.Content;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/content/CreateNewContent")
public class CreateNewContent extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ContentService cs = sf.getContentService();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

        try {
//            Content contentToBeCreated = (Content) MvcHelper.readObjectFromRequest(request, Content.class);
            Content contentToBeCreated = new Content();
            MvcHelper.populateBeanByRequestParameters(request, contentToBeCreated);

            contentToBeCreated.setCreationDate(new Date());
            contentToBeCreated.setStatus((short) 1);
            contentToBeCreated.setCreatedBy(loggedInUser.getId());

            contentToBeCreated = cs.getJpaDaoHelper().create(contentToBeCreated);
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Content Created Successfully");
            responseMessage.setData(contentToBeCreated);
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t.getCause() != null) {
                t = t.getCause();
            }
            logger.log(Level.SEVERE, t.getMessage(), t);
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(t.getMessage());
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CreateNewContent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(CreateNewContent.class.getName()).log(Level.SEVERE, null, ex);
        }

        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
