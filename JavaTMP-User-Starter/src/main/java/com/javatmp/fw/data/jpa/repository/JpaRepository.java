package com.javatmp.fw.data.jpa.repository;

import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;
import javax.persistence.EntityManager;
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
        this.transaction((EntityManager em) -> {
            em.persist(entity);
        });
    }

    public void merge(E entity) {
        this.transaction((EntityManager em) -> {
            em.merge(entity);
        });
    }

    public E read(I id) {
        return this.transaction((EntityManager em) -> {
            return em.find(clazz, id);
        });
    }

    public void remove(E entity) {
        this.transaction((EntityManager em) -> {
            em.remove(entity);
        });
    }

    public List<E> findAll(int start, int count) {
        EntityManagerWrapper<E, I> emw = null;
        try {
            emw = this.getNewEntityMangerWrapper();
            return emw.getEntityManager()
                    .createQuery(emw.getCriteriaQuery().select(emw.getRoot()))
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
            emw.getCountingCriteriaQuery().select(emw.getCriteriaBuilder().count(emw.getCountingCriteriaQuery().from(this.clazz)));
            return emw.getEntityManager().createQuery(emw.getCountingCriteriaQuery()).getSingleResult();
        } finally {
            if (emw != null && emw.getEntityManager() != null) {
                emw.getEntityManager().close();
            }
        }
    }

    public E get(Function<EntityManager, E> operation) {
        EntityManager em = emf.createEntityManager();
        try {
            E result = operation.apply(em);
            return result;
        } catch (Throwable t1) {
            throw t1;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public E transaction(Function<EntityManager, E> operation) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            E result = operation.apply(em);
            em.getTransaction().commit();
            return result;
        } catch (Throwable t1) {
            try {
                em.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.printStackTrace();
            }
            throw t1;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public <F> F statusTransaction(Function<EntityManager, F> operation) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            F result = operation.apply(em);
            em.getTransaction().commit();
            return result;
        } catch (Throwable t1) {
            try {
                em.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.printStackTrace();
            }
            throw t1;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void transaction(Consumer<EntityManager> operation) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            operation.accept(em);
            em.getTransaction().commit();
        } catch (Throwable t1) {
            try {
                em.getTransaction().rollback();
            } catch (Throwable t2) {
                t2.printStackTrace();
            }
            throw t1;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
}
