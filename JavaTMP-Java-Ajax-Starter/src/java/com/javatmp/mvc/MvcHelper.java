package com.javatmp.mvc;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.lang3.builder.RecursiveToStringStyle;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class MvcHelper {

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
        dtConverter.setPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        ConvertUtils.register(dtConverter, Date.class);

        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            map.put(name, request.getParameterValues(name));
        }
        BeanUtils.populate(bean, map);
    }

}
