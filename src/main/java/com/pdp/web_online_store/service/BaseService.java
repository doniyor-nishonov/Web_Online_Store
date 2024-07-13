package com.pdp.web_online_store.service;

import com.pdp.web_online_store.entity.Auditable;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T extends Auditable, ID extends Serializable> {
    T save(T entity);

    boolean update(T entity);

    boolean delete(ID id);

    T findById(ID id);

    List<T> findAll();

    List<T> findAllActive();
}
