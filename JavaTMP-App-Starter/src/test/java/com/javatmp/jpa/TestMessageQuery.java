/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.module.message.entity.Message;
import com.javatmp.module.message.service.MessageService;
import com.javatmp.module.user.service.UserService;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
public class TestMessageQuery {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("AppPU");
        UserService userService;
        userService = new UserService(emf);
        MessageService messageService = new MessageService(emf, userService);
        EntityManager em = emf.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
//        String[] selects = new String[]{"messageId", "messageTitle", "creationDate", "fromUserId",
//            "toUserId", "fromUser.profilePicDocument.contentType", "fromUser.profilePicDocument.documentName",
//            "fromUser.country.countryId", "fromUser.countryId", "fromUser.country.countryId"};
        String[] selects = new String[]{"messageId", "messageTitle", "creationDate", "fromUserId",
            "toUserId", "fromUser.profilePicDocument"};
        CriteriaQuery<Object[]> cq = criteriaBuilder.createQuery(Object[].class);
        Root<Message> from = cq.from(Message.class);

        List<Selection<?>> listOfSelect = messageService.convertArrToPaths(from, selects);
        System.out.println("size [" + listOfSelect.size() + "]");
        cq.multiselect(listOfSelect);

        DateTimeConverter dtConverter = new DateConverter();
        dtConverter.setPattern("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        ConvertUtils.register(dtConverter, Date.class);

        List<Object[]> resultList = em.createQuery(cq).setFirstResult(0).setMaxResults(1).getResultList();
        resultList.forEach(tuple -> {
            System.out.println("Object[] [" + (tuple) + "]");

            HashMap<String, Object> map = new HashMap();

            for (int i = 0; i < tuple.length; i++) {
                String name = selects[i];
                map.put(name, tuple[i]);
            }
            System.out.println("map parameters is [" + map + "]");
            Message bean = new Message();
            // create child beans
            autoInstantiate(bean, selects);
            try {
                BeanUtils.populate(bean, map);
                System.out.println((bean));
            } catch (IllegalAccessException ex) {
                Logger.getLogger(TestMessageQuery.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(TestMessageQuery.class.getName()).log(Level.SEVERE, null, ex);
            }
        });

    }

    public static void instantiate(Object from, List<String> fields) {
        System.out.println("instantiate [" + fields.get(0) + "] in object [" + from.getClass() + "]");
        instantiateNestedProperties(from, fields.get(0));
//        for (int i = 1; i < attributes.length; i++) {
//            retPath = retPath.get(attributes[i]);
//        }
//        return retPath;
    }

    public static void autoInstantiate(Object from, String[] selectList) {

        for (String select : selectList) {
            if (select.contains(".")) {
                instantiateNestedProperties(from, select);
            }
        }
    }

    private static void instantiateNestedProperties(Object obj, String fieldName) {
        System.out.println("obj [" + obj.getClass() + "], fieldName [" + fieldName + "]");
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
                    System.out.println("nested Property [" + nestedProperty + "]");
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
