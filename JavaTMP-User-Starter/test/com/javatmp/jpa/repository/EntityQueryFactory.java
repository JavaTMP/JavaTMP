package com.javatmp.jpa.repository;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

public interface EntityQueryFactory {

    public static <E, I> EntityQuery<E, I> create(Class<E> clazz, EntityManagerFactory emf) {
        return new EntityQuery<E, I>(clazz, emf);
    }

    public static class EntityQuery<E, I> {

        //private Class<E> clazz;
        private EntityManager entityManager;
        private CriteriaQuery<E> query;
        private CriteriaQuery<Long> countingQuery;
        private CriteriaBuilder builder;
        private Root<E> root;
        private Root<E> countingRoot;

        private EntityQuery(Class<E> clazz, EntityManagerFactory emf) {
            //this.clazz = clazz;
            this.entityManager = emf.createEntityManager();
            this.query = entityManager.getCriteriaBuilder().createQuery(clazz);
            this.countingQuery = entityManager.getCriteriaBuilder().createQuery(Long.class);
            this.builder = entityManager.getCriteriaBuilder();
            this.root = this.query.from(clazz);
            this.countingRoot = this.countingQuery.from(clazz);
        }

        public Long count(Function<EntityQuery<E, I>, Expression<Boolean>> operation) {
            Expression<Boolean> expression = operation.apply((EntityQuery<E, I>) this);
            return this.count(expression);
        }

        public E find(Function<EntityQuery<E, I>, Expression<Boolean>> operation) {
            Expression<Boolean> expression = operation.apply((EntityQuery<E, I>) this);
            return this.find(expression);
        }

        public List<E> list(Function<EntityQuery<E, I>, Expression<Boolean>> operation) {
            Expression<Boolean> expression = operation.apply((EntityQuery<E, I>) this);
            return this.list(expression);
        }

        public E transaction(Function<EntityManager, E> operation) {
            try {
                entityManager.getTransaction().begin();
                E result = operation.apply(entityManager);
                entityManager.getTransaction().commit();
                return result;
            } catch (Throwable t1) {
                try {
                    entityManager.getTransaction().rollback();
                } catch (Throwable t2) {
                    t2.printStackTrace();
                }
                throw t1;
            } finally {
                entityManager.close();
            }
        }

        public void transaction(Consumer<EntityManager> operation) {
            try {
                entityManager.getTransaction().begin();
                operation.accept(entityManager);
                entityManager.getTransaction().commit();
            } catch (Throwable t1) {
                try {
                    entityManager.getTransaction().rollback();
                } catch (Throwable t2) {
                    t2.printStackTrace();
                }
                throw t1;
            } finally {
                entityManager.close();
            }
        }

        public Expression<Boolean> findByColumn(String column, Object item) {
            return builder.equal(root.get(column), item);
        }

        public Expression<Boolean> findById(I id) {
            return builder.equal(root.get("id"), id);
        }

        public Expression<Boolean> listByColumn(String column, Object item) {
            return builder.equal(root.get(column), item);
        }

        public Expression<Boolean> listByColumn(String column, List<String> list) {
            return root.get(column).in(list);
        }

        public Expression<Boolean> listByIds(List<I> list) {
            return root.get("id").in(list);
        }

        /**
         * Workaround for JPA holding on to stale data Both Eclipselink and
         * Hibernate exhibit the same behavior
         */
        public Expression<Boolean> listAll() {
            return builder.notEqual(root.get("id"), 0l);
        }

        public Expression<Boolean> countByColumn(String column, Object item) {
            return builder.equal(countingRoot.get(column), item);
        }

        private E find(Expression<Boolean> whereClause) {
            query.select(root);
            query.where(whereClause);
            return entityManager.createQuery(query).setMaxResults(1).getSingleResult();
        }

        /**
         * This version should return all but instead retains stale data.
         * <pre>
         * public List<E> list() {
         *	query.select(root);
         *	return entityManager.createQuery(query).getResultList();
         * }
         * </pre> See list ::listAll
         */
        private List<E> list(Expression<Boolean> whereClause) {
            query.select(root);
            query.where(whereClause);
            return entityManager.createQuery(query).getResultList();
        }

        private Long count(Expression<Boolean> whereClause) {
            countingQuery.select(builder.count(countingRoot));
            countingQuery.where(whereClause);
            return entityManager.createQuery(countingQuery).getSingleResult();
        }
    }
}
