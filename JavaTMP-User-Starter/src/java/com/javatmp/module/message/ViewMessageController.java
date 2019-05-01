package com.javatmp.module.message;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/message/ViewMessageController")
public class ViewMessageController extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
            MessageService ms = sf.getMessageService();

            HttpSession session = request.getSession();
            ResponseMessage responseMessage = new ResponseMessage();

            Message message = new Message();
            MvcHelper.populateBeanByRequestParameters(request, message);
            logger.info("message to read [" + MvcHelper.deepToString(message) + "]");

            message = ms.readMessageById(message);

            request.setAttribute("message", message);

            request.getRequestDispatcher("/WEB-INF/pages/message/ViewMessage.jsp").forward(request, response);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ViewMessageController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvocationTargetException ex) {
            Logger.getLogger(ViewMessageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
