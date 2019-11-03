package com.javatmp.jpa.repository;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class AbstractRepository<E, I> {

    private final EntityManagerFactory emf;

    private final EntityQueryFactory.EntityQuery<E, I> query;

    public AbstractRepository(Class<E> clazz, String persistentUnit) {
        emf = Persistence.createEntityManagerFactory(persistentUnit);
        this.query = EntityQueryFactory.create(clazz, emf);
    }

    public E update(E entity) {
        return query.transaction((EntityManager em) -> em.merge(entity));
    }

    public void save(E entity) {
        query.transaction((EntityManager em) -> em.persist(entity));
    }

    public void deleteById(I id) {
        query.transaction((EntityManager em) -> em.remove(em.merge(find(id))));
    }

    public void delete(E entity) {
        query.transaction((EntityManager em) -> em.remove(em.merge(entity)));
    }

    public E find(I id) {
        return query.find((eq) -> eq.findById(id));
    }

    public E find(String column, Object item) {
        return query.find((eq) -> eq.findByColumn(column, item));
    }

    public List<E> list(String column, Object item) {
        return query.list((eq) -> eq.listByColumn(column, item));
    }

    public List<E> list(List<I> list) {
        return query.list((eq) -> eq.listByIds(list));
    }

    public List<E> list(String column, List<String> list) {
        return query.list((eq) -> eq.listByColumn(column, list));
    }

    public List<E> list() {
        return query.list((eq) -> eq.listAll());
    }

    public Long count(String column, Object item) {
        return query.count((eq) -> eq.countByColumn(column, item));
    }
}
