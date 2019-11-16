package com.javatmp.jpa.repository;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AbstractRepository<E, I> {

    private final EntityManagerFactory emf;
    private Class<E> clazz;

    public AbstractRepository(Class<E> clazz, String persistentUnit) {
        emf = Persistence.createEntityManagerFactory(persistentUnit);
        this.clazz = clazz;
        System.out.println("emf [" + emf + "]");
    }

    public AbstractRepository(Class<E> clazz, EntityManagerFactory emf) {
        this.emf = emf;
        this.clazz = clazz;
    }

    public EntityManagerWrapper<E, I> getNewEntityMangerWrapper() {
        System.out.println("crate EntityManagerWrapper");
        EntityManagerWrapper<E, I> ret = new EntityManagerWrapper<>(clazz, emf.createEntityManager());
        System.out.println("return EntityManagerWrapper");
        return ret;
    }

    public E update(E entity) {
        return this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            return emw.merge(entity);
        });
    }

    public void save(E entity) {
        this.getNewEntityMangerWrapper().transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.persist(entity);
        });
    }

    public E find(I id) {
        return this.getNewEntityMangerWrapper().find((EntityManagerWrapper<E, I> emw) -> {
            return emw.findById(id);
        });
    }

    public List<E> list(String column, Object item) {
        return this.getNewEntityMangerWrapper().list((EntityManagerWrapper<E, I> emw) -> emw.listByColumn(column, item));
    }

    public List<E> list(List<I> list) {
        return this.getNewEntityMangerWrapper().list((EntityManagerWrapper<E, I> emw) -> emw.listByIds(list));
    }

    public List<E> list(String column, List<String> list) {
        return this.getNewEntityMangerWrapper().list((EntityManagerWrapper<E, I> emw) -> emw.listByColumn(column, list));
    }

    public List<E> list() {
        return this.getNewEntityMangerWrapper().list((EntityManagerWrapper<E, I> emw) -> emw.listAll());
    }

    public Long count(String column, Object item) {
        return this.getNewEntityMangerWrapper().count((EntityManagerWrapper<E, I> emw) -> emw.countByColumn(column, item));
    }
}
