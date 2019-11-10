package com.javatmp.module.content;

import com.javatmp.module.country.Countrytranslation;
import com.javatmp.module.user.*;
import com.javatmp.module.dms.Document;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.module.dms.DocumentService;
import com.javatmp.module.language.Languagetranslation;
import com.javatmp.module.theme.Themetranslation;
import com.javatmp.module.timezone.Timezonetranslation;
import com.javatmp.util.ServicesFactory;
import com.javatmp.util.Constants;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.PersistenceException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/content/UpdateContent")
public class UpdateContent extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String requestPage = "/WEB-INF/pages/content/UpdateContent.jsp";

            ServletContext context = request.getServletContext();
            ServicesFactory sf = (ServicesFactory) context.getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            Content content = new Content();
            MvcHelper.populateBeanByRequestParameters(request, content);
            logger.info("request user is [" + MvcHelper.deepToString(content) + "]");
            content = sf.getContentService().readContentById(content);
            logger.info("DB user to be Updated is [" + MvcHelper.deepToString(content) + "]");

            HttpSession session = request.getSession();
            User loggedInUser = (User) session.getAttribute("user");

            request.setAttribute("content", content);

            request.getRequestDispatcher(requestPage).forward(request, response);

        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ContentService cs = sf.getContentService();
        Content contentToBeUpdated = new Content();

        try {
            MvcHelper.populateBeanByRequestParameters(request, contentToBeUpdated);
            if (cs.updateContent(contentToBeUpdated) == 1) {
                // content updated successfully:
                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage("Content Updated successfully");
            } else {
                // content does not updated successfully:
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("Content NOT Updated");
            }

            MvcHelper.sendMessageAsJson(response, responseMessage);

        } catch (IllegalAccessException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        } catch (InvocationTargetException ex) {
            logger.log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }
}
