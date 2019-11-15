/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.Document_;
import com.javatmp.module.user.User;
import com.javatmp.module.user.User_;
import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Tuple;
import javax.persistence.criteria.CompoundSelection;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

/**
 *
 * @author JavaTMP
 */
public class TestObjectQuery {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JpaDaoHelper jpaDaoHelper = new JpaDaoHelper("AppPU");
        EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        String[] selects = new String[]{"id", "userName", "firstName", "lastName", "status",
            "birthDate", "creationDate", "email", "lang", "theme", "countryId", "address", "timezone",
            "profilePicDocumentId", "profilePicDocument.randomHash"};
        CriteriaQuery<Object[]> cq = criteriaBuilder.createQuery(Object[].class);
        Root<User> from = cq.from(User.class);
//        for (String pathStr : selects) {
//            String[] attributes = pathStr.split("\\.");
//            if (attributes != null && attributes.length > 1) {
//                from.join(attributes[0], JoinType.LEFT);
//            }
//        }
        List<Selection<?>> listOfSelect = jpaDaoHelper.convertArrToPaths(from, selects);
        System.out.println("size [" + listOfSelect.size() + "]");
        cq.multiselect(listOfSelect);

        List<Object[]> resultList = em.createQuery(cq).setFirstResult(0).setMaxResults(2).getResultList();
        resultList.forEach(tuple -> {
            System.out.println("Object[] [" + MvcHelper.toString(tuple) + "]");

            HashMap<String, Object> map = new HashMap();

            DateTimeConverter dtConverter = new DateConverter();
            dtConverter.setPattern("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
            ConvertUtils.register(dtConverter, Date.class);

            for (int i = 0; i < tuple.length; i++) {
                String name = selects[i];
                map.put(name, tuple[i]);
            }
            System.out.println("map parameters is [" + map + "]");
            User bean = new User();
            try {
                BeanUtils.populate(bean, map);
                System.out.println(MvcHelper.toString(bean));
            } catch (IllegalAccessException ex) {
                Logger.getLogger(TestObjectQuery.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(TestObjectQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        });

        resultList.forEach(tuple -> {
            System.out.println("Object[] [" + MvcHelper.toString(tuple) + "]");

            User bean = new User();
            try {
                for (int i = 0; i < tuple.length; i++) {
                    String name = selects[i];
                    Object value = tuple[i];
                    System.out.println("name [" + name + "], value [" + value + "]");
                    PropertyDescriptor propertyDescriptor;

                    propertyDescriptor = PropertyUtils.getPropertyDescriptor(bean, name);

                    Class<?> propertyType = propertyDescriptor.getPropertyType();

                    PropertyUtils.setProperty(bean, name, value);

                }
            } catch (IllegalAccessException ex) {
                Logger.getLogger(TestObjectQuery.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(TestObjectQuery.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchMethodException ex) {
                Logger.getLogger(TestObjectQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("custome [" + MvcHelper.toString(bean));
        });

    }

    private void instantiateNestedProperties(Object obj, String fieldName) {
        try {
            String[] fieldNames = fieldName.split("\\.");
            if (fieldNames.length > 1) {
                StringBuffer nestedProperty = new StringBuffer();
                for (int i = 0; i < fieldNames.length - 1; i++) {
                    String fn = fieldNames[i];
                    if (i != 0) {
                        nestedProperty.append(".");
                    }
                    nestedProperty.append(fn);

                    Object value = PropertyUtils.getProperty(obj, nestedProperty.toString());

                    if (value == null) {
                        PropertyDescriptor propertyDescriptor = PropertyUtils.getPropertyDescriptor(obj, nestedProperty.toString());
                        Class<?> propertyType = propertyDescriptor.getPropertyType();
                        Object newInstance = propertyType.newInstance();
                        PropertyUtils.setProperty(obj, nestedProperty.toString(), newInstance);
                    }
                }
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
    }

}
