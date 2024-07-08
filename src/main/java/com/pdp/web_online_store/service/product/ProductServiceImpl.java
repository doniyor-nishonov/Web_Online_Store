package com.pdp.web_online_store.service.product;

import com.pdp.web_online_store.entity.product.Product;

import java.util.List;

public class ProductServiceImpl implements ProductService{
    @Override
    public Product save(Product entity) {
        return null;
    }

    @Override
    public boolean update(Product entity) {
        return false;
    }

    @Override
    public boolean delete(String s) {
        return false;
    }

    @Override
    public Product findById(String s) {
        return null;
    }

    @Override
    public List<Product> findAll() {
        return List.of();
    }

    @Override
    public List<Product> getAllByCategory(String category) {
        return List.of();
    }
}
