package com.javatmp.jpa;

import javax.persistence.*;
import javax.persistence.metamodel.Attribute;
import javax.persistence.metamodel.PluralAttribute;
import javax.persistence.metamodel.SingularAttribute;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MetamodelUtil {

    private static MetamodelUtil instance;

    public static MetamodelUtil getInstance() {
        return instance;
    }

    private Map<Class<?>, Class<?>> metamodelCache = new HashMap<>();

    public MetamodelUtil() {
        instance = this;
    }

    public SingularAttribute<?, ?> toAttribute(String property,
            Class<?> from) {
        try {
            Class<?> metamodelClass = getCachedClass(from);
            Field field = metamodelClass.getField(property);
            return (SingularAttribute<?, ?>) field.get(null);
        } catch (Exception e) {
            throw new IllegalArgumentException(e);
        }
    }

    public List<Attribute<?, ?>> toAttributes(String path, Class<?> from) {
        try {
            List<Attribute<?, ?>> attributes = new ArrayList<>();
            Class<?> current = from;
            for (String pathItem : path.split(".")) {
                Class<?> metamodelClass = getCachedClass(current);
                Field field = metamodelClass.getField(pathItem);
                Attribute<?, ?> attribute = (Attribute<?, ?>) field
                        .get(null);
                attributes.add(attribute);
                if (attribute instanceof PluralAttribute) {
                    current = ((PluralAttribute<?, ?, ?>) attribute)
                            .getElementType().getJavaType();
                } else {
                    current = attribute.getJavaType();
                }
            }
            return attributes;
        } catch (Exception e) {
            throw new IllegalArgumentException(e);
        }
    }

    public String toPath(List<Attribute<?, ?>> attributes) {
        StringBuilder path = new StringBuilder();
        for (Attribute<?, ?> attribute : attributes) {
            if (path.length() > 0) {
                path.append(".");
            }
            path.append(attribute.getName());
        }
        return path.toString();
    }

    private Class<?> getCachedClass(Class<?> current)
            throws ClassNotFoundException {
        if (metamodelCache.containsKey(current)) {
            return metamodelCache.get(current);
        }
        Class<?> metamodelClass = Class.forName(current.getName() + "_");
        metamodelCache.put(current, metamodelClass);
        return metamodelClass;
    }

    /**
     * Retrieves cascade from metamodel attribute
     *
     * @param attribute given pluaral attribute
     * @return an empty collection if no jpa relation annotation can be found.
     */
    public Collection<CascadeType> getCascades(
            PluralAttribute<?, ?, ?> attribute) {
        if (attribute.getJavaMember() instanceof AccessibleObject) {
            AccessibleObject accessibleObject = (AccessibleObject) attribute
                    .getJavaMember();
            OneToMany oneToMany = accessibleObject
                    .getAnnotation(OneToMany.class);
            if (oneToMany != null) {
                return new ArrayList(Arrays.asList(oneToMany.cascade()));
            }
            ManyToMany manyToMany = accessibleObject
                    .getAnnotation(ManyToMany.class);
            if (manyToMany != null) {
                return new ArrayList(Arrays.asList(manyToMany.cascade()));
            }
        }
        return new ArrayList();
    }

    /**
     * Retrieves cascade from metamodel attribute on a xToMany relation.
     *
     * @param attribute given singular attribute
     * @return an empty collection if no jpa relation annotation can be found.
     */
    public Collection<CascadeType> getCascades(
            SingularAttribute<?, ?> attribute) {
        if (attribute.getJavaMember() instanceof AccessibleObject) {
            AccessibleObject accessibleObject = (AccessibleObject) attribute
                    .getJavaMember();
            OneToOne oneToOne = accessibleObject
                    .getAnnotation(OneToOne.class);
            if (oneToOne != null) {
                return new ArrayList(Arrays.asList(oneToOne.cascade()));
            }
            ManyToOne manyToOne = accessibleObject
                    .getAnnotation(ManyToOne.class);
            if (manyToOne != null) {
                return new ArrayList(Arrays.asList(manyToOne.cascade()));
            }
        }
        return new ArrayList();
    }

    public boolean isOrphanRemoval(PluralAttribute<?, ?, ?> attribute) {
        if (attribute.getJavaMember() instanceof AccessibleObject) {
            AccessibleObject accessibleObject = (AccessibleObject) attribute
                    .getJavaMember();
            OneToMany oneToMany = accessibleObject
                    .getAnnotation(OneToMany.class);
            if (oneToMany != null) {
                return oneToMany.orphanRemoval();
            }
        }
        return true;
    }
}
