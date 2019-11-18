package com.javatmp.fw.data.jpa.repository;

import java.util.List;
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

    public List<E> findAll(int start, int count) {
        EntityManagerWrapper<E, I> emw = null;
        try {
            emw = this.getNewEntityMangerWrapper();
            return emw.getEntityManager()
                    .createQuery(emw.getQuery().select(emw.getRoot()))
                    .setFirstResult(start)
                    .setMaxResults(count)
                    .getResultList();
        } finally {
            if (emw != null && emw.getEntityManager() != null) {
                emw.getEntityManager().close();
            }
        }
    }

    public Long getAllCount() {
        EntityManagerWrapper<E, I> emw = null;
        try {
            emw = this.getNewEntityMangerWrapper();
            emw.getCountingQuery().select(emw.getBuilder().count(emw.getCountingQuery().from(this.clazz)));
            return emw.getEntityManager().createQuery(emw.getCountingQuery()).getSingleResult();
        } finally {
            if (emw != null && emw.getEntityManager() != null) {
                emw.getEntityManager().close();
            }
        }
    }

}
