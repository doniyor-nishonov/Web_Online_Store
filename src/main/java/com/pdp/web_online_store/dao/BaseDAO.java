package com.pdp.web_online_store.dao;

import com.pdp.web_online_store.entity.Auditable;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.NonNull;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class BaseDAO<T extends Auditable, ID extends Serializable> {
    protected static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("shopping");
    protected static final EntityManager em = emf.createEntityManager();

    private final Class<T> persistenceClass;

    @SuppressWarnings("unchecked")
    protected BaseDAO() {
        this.persistenceClass = (Class<T>) (((ParameterizedType) getClass().getGenericSuperclass())
                .getActualTypeArguments()[0]);
    }


    public T save(T entity) {
        begin();
        em.persist(entity);
        commit();
        return entity;
    }

    public boolean update(T entity) {
        begin();
        em.merge(entity);
        commit();
        return true;
    }

    public T findById(@NonNull ID id) {
        begin();
        T entity = em.find(persistenceClass, id);
        commit();
        return entity;
    }

    public List<T> findAll() {
        begin();
        List<T> entities = em.createQuery("from " + persistenceClass.getSimpleName(), persistenceClass).getResultList();
        commit();
        return entities;
    }

    public List<T> findAllActive() {
        begin();
        List<T> entities = em.createQuery("from " + persistenceClass.getSimpleName() + " where isactive not false", persistenceClass).getResultList();
        commit();
        return entities;
    }

    public boolean deleteById(@NonNull ID id) {
        begin();
        em.createQuery(" from " + persistenceClass.getSimpleName() + " t where t.id = :id")
                .setParameter("id", id)
                .executeUpdate();
        commit();
        return true;
    }


    protected void begin() {
        em.getTransaction().begin();
    }

    protected void commit() {
        em.getTransaction().commit();
    }

    protected void rollBack() {
        em.getTransaction().rollback();
    }
}
