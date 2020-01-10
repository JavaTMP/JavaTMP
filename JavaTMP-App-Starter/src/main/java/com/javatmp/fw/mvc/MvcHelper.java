package com.javatmp.fw.mvc;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.fw.mvc.adapter.ClassTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.fw.mvc.adapter.ByteArrayToBase64TypeAdapter;
import com.javatmp.fw.domain.table.OrderDir;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.lang3.builder.RecursiveToStringStyle;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class MvcHelper {

    private static final Logger logger = Logger.getLogger(MvcHelper.class.getName());
    private static final Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
            .registerTypeAdapter(Class.class, new ClassTypeAdapter())
            .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
            .registerTypeHierarchyAdapter(byte[].class, new ByteArrayToBase64TypeAdapter())
            .create();

    /**
     * Returns a String object representation of passing object attributes.
     *
     * @see
     * http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ReflectionToStringBuilder.html
     * @param object
     * @return
     */
    public static String toString(Object object) {
        return ReflectionToStringBuilder.toString(object);
    }

    public static String toString(Object object, String... fields) {
        return ReflectionToStringBuilder.toStringExclude(object, fields);
    }

    /**
     * Returns a String object representation of passing object attributes.
     *
     * @see
     * http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ReflectionToStringBuilder.html
     * @param object
     * @return
     */
    public static String deepToString(Object object) {
        return ReflectionToStringBuilder.toString(object, new RecursiveToStringStyle());
    }

    private static DecimalFormat getDecimalFormat(String pattern) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setDecimalSeparator('.');
        DecimalFormat format = new DecimalFormat(pattern);
        format.setParseBigDecimal(true);
        format.setDecimalFormatSymbols(symbols);
        return format;
    }

    public static void sendMessageAsJson(HttpServletResponse response, ResponseMessage responseMessage) throws IOException {
        String json = getGson().toJson(responseMessage);
//        logger.info("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    public static <T> T readObjectFromRequest(HttpServletRequest request, T object) throws IOException {
        return (T) getGson().fromJson(request.getReader(), object.getClass());
    }

    public static Object readObjectFromRequest(HttpServletRequest request, Class clz) throws IOException {
        return getGson().fromJson(request.getReader(), clz);
    }

    public static Document readDocumentFromRequest(HttpServletRequest request, String partName) throws IOException, ServletException {
        Document fileUploading = null;
        Part filePart = request.getPart(partName); // Retrieves <input type="file" name="{{partName}}">
        logger.log(Level.INFO, "filePart [" + filePart + "]");
        logger.log(Level.INFO, "file part size [" + filePart.getSize() + "]");

        if (filePart.getSize() == 0) {
            throw new IllegalArgumentException("Part Name [" + partName + "] does not contain valid data");
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String contentType = filePart.getContentType();
        InputStream fileContentStream = filePart.getInputStream();
        String fieldName = filePart.getName();
        long partSize = filePart.getSize();

        fileUploading = new Document();
        fileUploading.setContentType(contentType);
        fileUploading.setDocumentName(fileName);
        fileUploading.setDocumentSize(partSize);
        fileUploading.setCreationDate(new Date());
        long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
        fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
        // the following block is intended for simple cases
        // where it is convenient to read all bytes into a byte array.
        // It is not intended for reading input streams with large amounts of data.
        int nRead;
        byte[] data = new byte[4 * 1024];
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }

        fileUploading.setDocumentContent(buffer.toByteArray());
        logger.info("original size [" + fileUploading.getDocumentSize()
                + "] stream size [" + fileUploading.getDocumentContent().length + "]");

        return fileUploading;
    }

    public static Document readDocumentFromRequestIfExist(HttpServletRequest request, String partName) throws IOException, ServletException {
        Document fileUploading = null;
        Part filePart = request.getPart(partName); // Retrieves <input type="file" name="{{partName}}">
        logger.log(Level.INFO, "filePart [" + filePart + "]");
        logger.log(Level.INFO, "file part size [" + filePart.getSize() + "]");

        if (filePart.getSize() != 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String contentType = filePart.getContentType();
            InputStream fileContentStream = filePart.getInputStream();
            String fieldName = filePart.getName();
            long partSize = filePart.getSize();

            fileUploading = new Document();
            fileUploading.setContentType(contentType);
            fileUploading.setDocumentName(fileName);
            fileUploading.setDocumentSize(partSize);
            fileUploading.setCreationDate(new Date());
            long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
            fileUploading.setRandomHash((Long) Math.abs(fileUploading.getDocumentName().hashCode() + randomLongValue));
            // the following block is intended for simple cases
            // where it is convenient to read all bytes into a byte array.
            // It is not intended for reading input streams with large amounts of data.
            int nRead;
            byte[] data = new byte[4 * 1024];
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }

            fileUploading.setDocumentContent(buffer.toByteArray());
            logger.info("original size [" + fileUploading.getDocumentSize()
                    + "] stream size [" + fileUploading.getDocumentContent().length + "]");
        }

        return fileUploading;
    }

    /**
     * @return the gson
     */
    public static Gson getGson() {
        return gson;
    }

}
