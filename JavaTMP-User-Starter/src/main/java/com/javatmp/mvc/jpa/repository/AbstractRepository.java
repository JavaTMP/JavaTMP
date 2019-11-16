package com.javatmp.mvc.jpa.repository;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AbstractRepository<E, I> {

    private final EntityManagerFactory emf;
    private Class<E> clazz;

    public AbstractRepository(Class<E> clazz, String persistentUnit) {
        emf = Persistence.createEntityManagerFactory(persistentUnit);
        this.clazz = clazz;
    }

    public AbstractRepository(Class<E> clazz, EntityManagerFactory emf) {
        this.emf = emf;
        this.clazz = clazz;
    }

    public EntityManagerWrapper<E, I> getNewEntityMangerWrapper() {
        EntityManagerWrapper<E, I> ret = new EntityManagerWrapper<>(clazz, emf.createEntityManager());
        return ret;
    }

    public void persist(E entity) {
        this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.persist(entity);
        });
    }

    public E update(E entity) {
        return this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            return emw.merge(entity);
        });
    }

    public E find(I id) {
        return this.getNewEntityMangerWrapper().find((EntityManagerWrapper<E, I> emw) -> {
            return emw.getBuilder().equal(emw.getRoot().get("id"), id);
        });
    }

}
