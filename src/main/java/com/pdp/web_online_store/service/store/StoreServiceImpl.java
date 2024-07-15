package com.pdp.web_online_store.service.store;

import com.pdp.web_online_store.entity.store.Store;
import com.pdp.web_online_store.utils.StringUtils;

import java.util.List;
import java.util.Objects;

public class StoreServiceImpl implements StoreService {
    @Override
    public Store save(Store store) {
        return STORE_DAO.save(store);
    }

    @Override
    public boolean update(Store store) {
        return STORE_DAO.update(store);
    }

    @Override
    public boolean delete(String s) {
        return STORE_DAO.deleteById(s);
    }

    @Override
    public Store findById(String s) {
        return STORE_DAO.findById(s);
    }

    @Override
    public List<Store> findAll() {
        return STORE_DAO.findAll();
    }

    @Override
    public List<Store> findAllActive() {
        return STORE_DAO.findAllActive();
    }

    @Override
    public List<Store> getMagazinesBySellerId(String userID) {
        return findAll().stream()
                .filter(magazine -> Objects.equals(magazine.getUsers().getId(), userID))
                .toList();
    }

    @Override
    public List<Store> findByName(String magazine) {
        return findAll().stream()
                .filter(mag -> StringUtils.contains(mag.getName(), magazine))
                .toList();
    }

    @Override
    public boolean isActiveStore(String userID, String magazineID) {
        return findAll()
                .stream()
                .filter(store -> Objects.equals(store.getUsers().getId(), userID)
                        && Objects.equals(store.getId(), magazineID))
                .anyMatch(store -> store.getStatus() == Store.Status.ACTIVE);
    }
}
