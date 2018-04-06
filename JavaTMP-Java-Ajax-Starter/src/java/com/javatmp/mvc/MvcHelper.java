package com.javatmp.mvc;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;
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
    public static void populateBeanByRequestParameter(HttpServletRequest request, Object bean)
            throws IllegalAccessException, InvocationTargetException {
        HashMap<String, String[]> map = new HashMap();
        Enumeration names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            map.put(name, request.getParameterValues(name));
        }
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

    /**
     *
     * @param relativePath
     * @see
     * http://stackoverflow.com/questions/2786426/how-can-i-get-real-path-for-file-in-my-webcontent-folder
     */
    public static String getAbsoluteClassPath() {
        String decodedPath = null;
        try {
            URL r = MvcHelper.class.getClass().getResource("/");
            decodedPath = URLDecoder.decode(r.getFile(), "UTF-8");
            if (decodedPath.startsWith("/")) {
                decodedPath = decodedPath.replaceFirst("/", "");
            }
        } catch (UnsupportedEncodingException ex) {
            // we specifiy a utf-8 and we know that it is supported.
        }
        return decodedPath;
    }

}
