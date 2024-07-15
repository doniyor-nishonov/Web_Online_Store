package com.pdp.web_online_store.service.store;

import com.pdp.web_online_store.dao.store.StoreDAO;
import com.pdp.web_online_store.entity.store.Store;
import com.pdp.web_online_store.service.BaseService;

import java.util.List;

public interface StoreService extends BaseService<Store, String> {
    StoreDAO STORE_DAO = new StoreDAO();

    List<Store> getMagazinesBySellerId(String userID);

    List<Store> findByName(String magazine);

    boolean isActiveStore(String userID,String magazineID);

}
