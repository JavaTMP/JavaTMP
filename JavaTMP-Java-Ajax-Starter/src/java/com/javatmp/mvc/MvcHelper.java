package com.javatmp.mvc;

import com.javatmp.mvc.domain.ResponseMessage;
import com.javatmp.mvc.adapter.OrderDirTypeAdapter;
import com.javatmp.mvc.adapter.ClassTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.javatmp.mvc.domain.table.OrderDir;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.lang3.builder.RecursiveToStringStyle;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class MvcHelper {

    private static final Logger logger = Logger.getLogger(MvcHelper.class.getName());
    private static final Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX").serializeNulls()
            .registerTypeAdapter(Class.class, new ClassTypeAdapter())
            .registerTypeAdapter(OrderDir.class, new OrderDirTypeAdapter())
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
        ConvertUtils.register(dtConverter, Date.class);

        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            map.put(name, request.getParameterValues(name));
        }

        BeanUtils.populate(bean, map);
    }

    public static void sendMessageAsJson(HttpServletResponse response, ResponseMessage responseMessage) throws IOException {
        String json = gson.toJson(responseMessage);
        logger.info("response [" + json + "]");
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

}
