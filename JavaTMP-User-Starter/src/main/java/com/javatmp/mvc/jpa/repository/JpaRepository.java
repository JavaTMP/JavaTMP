package com.javatmp.mvc.jpa.repository;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaRepository<E, I> {

    private final EntityManagerFactory emf;
    private Class<E> clazz;

    public JpaRepository(Class<E> clazz, String persistentUnit) {
        emf = Persistence.createEntityManagerFactory(persistentUnit);
        this.clazz = clazz;
    }

    public JpaRepository(Class<E> clazz, EntityManagerFactory emf) {
        this.emf = emf;
        this.clazz = clazz;
    }

    public EntityManagerWrapper<E, I> getNewEntityMangerWrapper() {
        EntityManagerWrapper<E, I> ret = new EntityManagerWrapper<>(clazz, emf.createEntityManager());
        return ret;
    }

    public void persist(E entity) {
        this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.getEntityManager().persist(entity);
        });
    }

    public void merge(E entity) {
        this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.getEntityManager().merge(entity);
        });
    }

    public E read(I id) {
        return this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            return emw.getEntityManager().find(emw.getClazz(), id);
        });
    }

    public void remove(E entity) {
        this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.getEntityManager().remove(entity);
        });
    }

}
