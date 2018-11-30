package com.javatmp.mvc;

import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.module.dms.Document;
import com.javatmp.mvc.adapter.ByteArrayToBase64TypeAdapter;
import com.javatmp.mvc.domain.table.OrderDir;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.beanutils.converters.IntegerConverter;
import org.apache.commons.beanutils.converters.LongConverter;
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

    /**
     * Using Commons Beans utility to inject request parameters into bean
     *
     * @see
     * http://commons.apache.org/proper/commons-beanutils/javadocs/v1.9.2/apidocs/org/apache/commons/beanutils/package-summary.html#conversion.beanutils
     * @param request
     * @param bean
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     */
    public static void populateBeanByRequestParameters(HttpServletRequest request, Object bean)
            throws IllegalAccessException, InvocationTargetException {
        HashMap<String, String[]> map = new HashMap();
        Enumeration names = request.getParameterNames();

        DateTimeConverter dtConverter = new DateConverter();
        dtConverter.setPattern("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        IntegerConverter ic = new IntegerConverter(null);
        LongConverter longConverter = new LongConverter(null);

        ConvertUtils.register(dtConverter, Date.class);
        ConvertUtils.register(ic, Integer.class);
        ConvertUtils.register(longConverter, Long.class);

        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            map.put(name, request.getParameterValues(name));
        }
        System.out.println("map parameters is [" + map + "]");
        BeanUtils.populate(bean, map);
    }

    /**
     * Way to map servlet request parameters to a java class
     *
     * @see
     * http://stackoverflow.com/questions/5718557/which-is-best-way-to-map-servlet-request-parameters-to-a-java-class
     * @param req
     * @param obj
     * @throws ParseException
     * @throws IllegalAccessException
     */
    public static void convertRequestParameterToBean(HttpServletRequest req, Object obj) throws ParseException, IllegalAccessException {
        Set<String> names = new HashSet<String>();
        @SuppressWarnings("unchecked")
        Enumeration<String> enm = req.getParameterNames();
        while (enm.hasMoreElements()) {
            names.add(enm.nextElement());
        }
        Class clazz = obj.getClass();
        while (clazz != Object.class && !names.isEmpty()) {
            for (Field f : clazz.getDeclaredFields()) {
                if (!Modifier.isTransient(f.getModifiers())) {
                    String name = f.getName();
                    if (names.contains(name)) {
                        try {
                            names.remove(name);
                            f.setAccessible(true);
                            Object val = convertValue(req, f.getType(), name);
                            f.set(obj, val);
                        } catch (ParseException ex) {
                            // we can here prepare custome error message
                            throw ex;
                        } catch (IllegalAccessException ex) {
                            // we can here prepare a custome error message
                            throw ex;
                        }
                    }
                }
            }
            clazz = clazz.getSuperclass();
        }
    }

    private static Object convertValue(HttpServletRequest req, Class<?> type,
            String name) throws ParseException {
        if (type.isArray()) {
            Class<?> elemType = type.getComponentType();
            String strings[] = req.getParameterValues(name);
            if (strings == null || strings.length == 0) {
                return new Object[0];
            }
            Object array = Array.newInstance(elemType, strings.length);
            for (int i = 0; i < strings.length; ++i) {
                Object val = parse(elemType, strings[i]);
                Array.set(array, i, val);
            }
            return array;
        } else {
            String s = req.getParameter(name);
            if (s == null) {
                return null;
            }
            return parse(type, s);
        }
    }

    private static Object parse(Class<?> type, String value)
            throws ParseException {
        if (type == String.class) {
            return value;
        } else if (value == null || value.length() == 0) {
            return null;
        } else if (Enum.class.isAssignableFrom(type)) {
            @SuppressWarnings("unchecked")
            Object result = Enum.valueOf((Class<? extends Enum>) type, value);
            return result;
        } else if (type == boolean.class || type == Boolean.class) {
            return "true".equals(value);
        } else if (type == byte.class || type == Byte.class) {
            return Byte.valueOf(value);
        } else if (type == short.class || type == Short.class) {
            return Short.valueOf(value);
        } else if (type == int.class || type == Integer.class) {
            return Integer.valueOf(value);
        } else if (type == long.class || type == Long.class) {
            return Long.valueOf(value);
        } else if (type == float.class || type == Float.class) {
            return Float.valueOf(value);
        } else if (type == double.class || type == Double.class) {
            return Double.valueOf(value);
        } else if (type == Date.class) {
            return new SimpleDateFormat("dd/MM/yyyy").parse(value);
        } else if (type == BigDecimal.class) {
            DecimalFormat format = getDecimalFormat("0.00");
            return format.parse(value);
        } else {
            throw new RuntimeException("Cannot convert value of type " + type);
        }
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
        String json = gson.toJson(responseMessage);
//        logger.info("response [" + json + "]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    public static <T> T readObjectFromRequest(HttpServletRequest request, T object) throws IOException {
        return (T) gson.fromJson(request.getReader(), object.getClass());
    }

    public static Object readObjectFromRequest(HttpServletRequest request, Class clz) throws IOException {
        return gson.fromJson(request.getReader(), clz);
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

}
