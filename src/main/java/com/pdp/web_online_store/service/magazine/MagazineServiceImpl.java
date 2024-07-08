package com.pdp.web_online_store.service.magazine;

import com.pdp.web_online_store.entity.magazine.Magazine;

import java.util.List;

public class MagazineServiceImpl implements MagazineService{
    @Override
    public Magazine save(Magazine magazine) {
        return magazineDAO.save(magazine);
    }

    @Override
    public boolean update(Magazine magazine) {
        return magazineDAO.update(magazine);
    }

    @Override
    public boolean delete(String s) {
        return magazineDAO.deleteById(s);
    }

    @Override
    public Magazine findById(String s) {
        return magazineDAO.findById(s);
    }

    @Override
    public List<Magazine> findAll() {
        return magazineDAO.findAll();
    }
}
