package com.javatmp.web.controller.cms;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.domain.Content;
import com.javatmp.mvc.ClassTypeAdapter;
import com.javatmp.mvc.MvcHelper;
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

@WebServlet("/cms/UpdateContentController")
public class UpdateContentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ResponseMessage responseMessage = new ResponseMessage();
        ServicesFactory sf = (ServicesFactory) request.getSession().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ContentService cs = sf.getContentService();
        Content contentToBeUpdated = new Content();

        try {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException ex) {
                Logger.getLogger(UpdateContentController.class.getName()).log(Level.SEVERE, null, ex);
            }
            MvcHelper.populateBeanByRequestParameters(request, contentToBeUpdated);
            if (cs.updateContentText(contentToBeUpdated)) {
                // content updated successfully:
                responseMessage.setOverAllStatus(true);
                responseMessage.setMessage("Content Updated successfully");
            } else {
                // content does not updated successfully:
                responseMessage.setOverAllStatus(false);
                responseMessage.setMessage("Content NOT Updated");
            }

            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").serializeNulls()
                    .registerTypeAdapter(Class.class, new ClassTypeAdapter())
                    //                .registerTypeAdapter(Date.class, new DateTypeAdapter())
                    .create();
            String json = gson.toJson(responseMessage);
            System.out.println("response [" + json + "]");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (IllegalAccessException ex) {
            Logger.getLogger(UpdateContentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(UpdateContentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
