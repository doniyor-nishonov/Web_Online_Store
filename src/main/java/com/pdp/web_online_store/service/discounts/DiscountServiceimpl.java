package com.pdp.web_online_store.service.discounts;

import com.pdp.web_online_store.entity.discount.Discount;

import java.util.List;

public class DiscountServiceimpl implements DiscountService{
    @Override
    public Discount save(Discount discount) {
        return discountDAO.save(discount);
    }

    @Override
    public boolean update(Discount discount) {
        return discountDAO.update(discount);
    }

    @Override
    public boolean delete(String s) {
        return discountDAO.deleteById(s);
    }

    @Override
    public Discount findById(String s) {
        return discountDAO.findById(s);
    }

    @Override
    public List<Discount> findAll() {
        return discountDAO.findAll();
    }
}
