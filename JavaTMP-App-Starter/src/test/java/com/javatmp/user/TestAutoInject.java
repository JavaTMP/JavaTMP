/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.user;


import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author JavaTMP
 */
public class TestAutoInject {

    public static void populate(Object object, String fieldPath, Object value) throws IllegalArgumentException, IllegalAccessException, NoSuchFieldException, InstantiationException {
        System.out.println("process [" + fieldPath + "]");
        int index = fieldPath.indexOf(".");
        System.out.println("index is [" + index + "]");
        if (index == -1) {
            Field field = object.getClass().getDeclaredField(fieldPath);
            Class<?> clz = field.getType();
            System.out.println(clz.getName());
            field.setAccessible(true);
            field.set(object, value);
        } else {
            // cut
            String objectfieldPath = fieldPath.substring(0, index);
            String remaingString = fieldPath.substring(index + 1);
            System.out.println("object [" + objectfieldPath + "], remaining [" + remaingString + "]");
            Field field = object.getClass().getDeclaredField(objectfieldPath);
            Class<?> clz = field.getType();
            System.out.println(clz.getName());
            field.setAccessible(true);
            Object childInstance = clz.newInstance();
            field.set(object, childInstance);
            populate(childInstance, remaingString, value);
        }
    }

    public static void main(String[] args) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {
        UserService userService;
        userService = new UserService(Persistence.createEntityManagerFactory("AppPU"));
        EntityManager em = null;
        try {
            em = userService.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<User> cq = cb.createQuery(User.class);

            String[] requests = new String[]{"id", "userName", "firstName", "lastName", "status",
                "birthDate", "creationDate", "email", "lang", "theme", "countryId", "address", "timezone",
                "profilePicDocumentId", "profilePicDocument.randomHash"};

            CriteriaQuery cq = cb.createQuery();
            Root e = cq.from(User.class);
            cq.multiselect(userService.convertArrToPaths(e, requests));
            Query query = em.createQuery(cq);
            List<Object[]> result5 = query.getResultList();
            for (Object[] row : result5) {
                System.out.println(Arrays.toString(row));
                User test = new User();
                for (int i = 0; i < row.length; i++) {
                    populate(test, requests[i], row[i]);
                }
                System.out.println((test));

            }
        } catch (PersistenceException e) {
            Throwable t = e;
            while (t != null) {
                System.out.println("type [" + e.getClass().getName() + "]");
                System.out.println("e [" + e.getMessage() + "]");
                t = t.getCause();
            }
        }

    }

}
