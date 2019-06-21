package com.javatmp.module.dms;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.util.Constants;
import com.javatmp.util.ServicesFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dms/UpdateProfilePhoto")
public class UpdateProfilePhoto extends HttpServlet {

    private final Logger logger = Logger.getLogger(getClass().getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServicesFactory sf = (ServicesFactory) request.getServletContext().getAttribute(Constants.SERVICES_FACTORY_ATTRIBUTE_NAME);
        ResponseMessage responseMessage = new ResponseMessage();

        DocumentService ds = sf.getDocumentService();
        String text = "";
        try {
            int nRead;
            byte[] data = new byte[4 * 1024];
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            while ((nRead = request.getInputStream().read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }

            Document fileUploading = new Document();
            fileUploading.setDocumentContentTemp(buffer.toString());
            fileUploading.setDocumentType((short) 1);
            fileUploading.setStatus((short) 1);
            fileUploading.setCreationDate(new Date());
            long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
            fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
            ds.createNewDocument(fileUploading);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Personal Profile Photo Updated Successfully");
            responseMessage.setData(fileUploading);

        } catch (IllegalStateException e) {
            logger.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes");
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        }
        MvcHelper.sendMessageAsJson(response, responseMessage);

    }
}
