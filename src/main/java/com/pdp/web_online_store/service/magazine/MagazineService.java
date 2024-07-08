package com.pdp.web_online_store.service.magazine;

import com.pdp.web_online_store.dao.magazine.MagazineDAO;
import com.pdp.web_online_store.entity.magazine.Magazine;
import com.pdp.web_online_store.service.BaseService;

public interface MagazineService extends BaseService<Magazine, String> {
    MagazineDAO magazineDAO = new MagazineDAO();
}
