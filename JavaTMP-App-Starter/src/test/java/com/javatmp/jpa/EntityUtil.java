package com.javatmp.jpa;

import com.javatmp.module.user.entity.User;
import org.assertj.core.util.Lists;

import java.lang.reflect.Field;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EntityUtil {
    public static Collection<Field> getFields(Class<?> clazz) {
//    if (log.isDebugEnabled()) {
        //    log.debug("getFields(Class<?>) - start");
        //}

        Map<String, Field> fields = new HashMap<String, Field>();
        while (clazz != null) {
            for (Field field : clazz.getDeclaredFields()) {
                if (!fields.containsKey(field.getName())) {
                    fields.put(field.getName(), field);
                }
            }

            clazz = clazz.getSuperclass();
        }

        Collection<Field> returnCollection = fields.values();
        //  if (log.isDebugEnabled()) {
        //  log.debug("getFields(Class<?>) - end");
        //  }
        return returnCollection;
    }

    public static Iterable<Field> getFieldsUpTo(Class<?> startClass, Class<?> exclusiveParent) {

        List<Field> currentClassFields = Lists.newArrayList(startClass.getDeclaredFields());
        Class<?> parentClass = startClass.getSuperclass();

        if (parentClass != null &&
                (exclusiveParent == null || !(parentClass.equals(exclusiveParent)))) {
            List<Field> parentClassFields =
                    (List<Field>) getFieldsUpTo(parentClass, exclusiveParent);
            currentClassFields.addAll(parentClassFields);
        }

        return currentClassFields;
    }

    public static void main(String[] args) {
        EntityUtil.getFields(User.class).forEach(field -> {
            System.out.println(field.getName() + " " + field.getType().getSimpleName());
        });
        System.out.println("***** start ******");
        EntityUtil.getFieldsUpTo(User.class, null).forEach(field -> {
            System.out.println(field.getName() + " " + field.getType().getSimpleName());
        });

    }

}
