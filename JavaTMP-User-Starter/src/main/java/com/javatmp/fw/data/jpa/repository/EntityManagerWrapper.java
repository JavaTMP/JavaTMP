package com.javatmp.fw.data.jpa.repository;

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
    private CriteriaQuery<E> criteriaQuery;
    private CriteriaQuery<Long> countingCriteriaQuery;
    private CriteriaBuilder criteriaBuilder;
    private Root<E> root;
    private Root<E> countingRoot;

    public EntityManagerWrapper(Class<E> clazz, EntityManager em) {
        this.clazz = clazz;
        this.entityManager = em;
        this.criteriaQuery = this.entityManager.getCriteriaBuilder().createQuery(this.clazz);
        this.countingCriteriaQuery = this.entityManager.getCriteriaBuilder().createQuery(Long.class);
        this.criteriaBuilder = this.entityManager.getCriteriaBuilder();
        this.root = this.criteriaQuery.from(this.clazz);
        this.countingRoot = this.countingCriteriaQuery.from(this.clazz);
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
        criteriaQuery.select(root);
        criteriaQuery.where(whereClause);
        return this.entityManager.createQuery(criteriaQuery).setMaxResults(1).getSingleResult();
    }

    private List<E> list(Expression<Boolean> whereClause) {
        criteriaQuery.select(root);
        criteriaQuery.where(whereClause);
        return this.entityManager.createQuery(criteriaQuery).getResultList();
    }

    private Long count(Expression<Boolean> whereClause) {
        countingCriteriaQuery.select(criteriaBuilder.count(countingRoot));
        countingCriteriaQuery.where(whereClause);
        return this.entityManager.createQuery(countingCriteriaQuery).getSingleResult();
    }
}
