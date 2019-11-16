package com.javatmp.mvc.jpa.repository;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class EntityManagerWrapper<E, I> {

    private Class<E> clazz;
    private EntityManager entityManager;
    private CriteriaQuery<E> query;
    private CriteriaQuery<Long> countingQuery;
    private CriteriaBuilder builder;
    private Root<E> root;
    private Root<E> countingRoot;

    public EntityManagerWrapper(Class<E> clazz, EntityManager em) {
        this.clazz = clazz;
        this.entityManager = em;
        this.query = this.entityManager.getCriteriaBuilder().createQuery(this.clazz);
        this.countingQuery = this.entityManager.getCriteriaBuilder().createQuery(Long.class);
        this.builder = this.entityManager.getCriteriaBuilder();
        this.root = this.query.from(this.clazz);
        this.countingRoot = this.countingQuery.from(this.clazz);
    }

    public E merge(E entity) {
        return this.transaction((EntityManagerWrapper<E, I> emw) -> {
            return emw.entityManager.merge(entity);
        });
    }

    public void persist(E entity) {
        this.transaction((EntityManagerWrapper<E, I> emw) -> {
            emw.entityManager.persist(entity);
        });
    }

    public Long count(Function<EntityManagerWrapper<E, I>, Expression<Boolean>> operation) {
        Expression<Boolean> expression = operation.apply((EntityManagerWrapper<E, I>) this);
        return this.count(expression);
    }

    public E find(Function<EntityManagerWrapper<E, I>, Expression<Boolean>> operation) {
        Expression<Boolean> expression = operation.apply((EntityManagerWrapper<E, I>) this);
        return this.find(expression);
    }

    public List<E> list(Function<EntityManagerWrapper<E, I>, Expression<Boolean>> operation) {
        Expression<Boolean> expression = operation.apply((EntityManagerWrapper<E, I>) this);
        return this.list(expression);
    }

    public E transaction(Function<EntityManagerWrapper<E, I>, E> operation) {
        try {
            this.entityManager.getTransaction().begin();
            E result = operation.apply(this);
            this.entityManager.getTransaction().commit();
            return result;
        } catch (Throwable t1) {
            try {
                this.entityManager.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.printStackTrace();
            }
            throw t1;
        } finally {
            this.entityManager.close();
        }
    }

    public void transaction(Consumer<EntityManagerWrapper<E, I>> operation) {
        try {
            this.entityManager.getTransaction().begin();
            operation.accept(this);
            this.entityManager.getTransaction().commit();
        } catch (Throwable t1) {
            try {
                this.entityManager.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.printStackTrace();
            }
            throw t1;
        } finally {
            this.entityManager.close();
        }
    }

    private E find(Expression<Boolean> whereClause) {
        query.select(root);
        query.where(whereClause);
        return this.entityManager.createQuery(query).setMaxResults(1).getSingleResult();
    }

    private List<E> list(Expression<Boolean> whereClause) {
        query.select(root);
        query.where(whereClause);
        return this.entityManager.createQuery(query).getResultList();
    }

    private Long count(Expression<Boolean> whereClause) {
        countingQuery.select(builder.count(countingRoot));
        countingQuery.where(whereClause);
        return this.entityManager.createQuery(countingQuery).getSingleResult();
    }
}
