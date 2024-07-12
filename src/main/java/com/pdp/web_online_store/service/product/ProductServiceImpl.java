package com.pdp.web_online_store.service.product;

import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.utils.StringUtils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class ProductServiceImpl implements ProductService {
    @Override
    public Product save(Product product) {
        return productDAO.save(product);
    }

    @Override
    public boolean update(Product product) {
        return productDAO.update(product);
    }

    @Override
    public boolean delete(String ID) {
        return productDAO.deleteById(ID);
    }

    @Override
    public Product findById(String ID) {
        return productDAO.findById(ID);
    }

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public List<Product> getAllByCategory(String category) {
        return findAll().stream()
                .filter(product -> Objects.equals(product.getCategory().toString(), category))
                .toList();
    }

    @Override
    public List<Product> getByRandom(int count) {
        List<Product> allProducts = productDAO.findAll();
        Collections.shuffle(allProducts);
        return allProducts.subList(0, Math.min(count, allProducts.size()));
    }

    @Override
    public List<Product> getByOwnerId(String userID) {
        return findAll().stream()
                .filter(product -> Objects.equals(product.getMagazine().getUsers().getId(), userID))
                .toList();
    }

    @Override
    public List<Product> findByName(String query) {
        List<Product> products = findAll();
        return products.stream()
                .filter(product -> StringUtils.contains(product.getName(), query))
                .toList();
    }
}
