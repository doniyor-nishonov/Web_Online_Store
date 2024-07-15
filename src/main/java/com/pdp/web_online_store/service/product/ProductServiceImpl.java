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
    public List<Product> findAllActive() {
        return productDAO.findAllActive();
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
                .filter(product -> Objects.equals(product.getStore().getUsers().getId(), userID))
                .toList();
    }

    @Override
    public List<Product> findByName(String query) {
        List<Product> products = findAll();
        return products.stream()
                .filter(product -> StringUtils.contains(product.getName(), query))
                .toList();
    }

    @Override
    public void deActive(Product product) {
        product.setActive(false);
        update(product);
    }

    @Override
    public List<Product> findProductByRange(int minPrice, int maxPrice) {
        return productDAO.findProductByRange(minPrice, maxPrice);
    }

    @Override
    public List<Product> findProductByRangeAndCategory(String category, int minPrice, int maxPrice) {
//        List<Product> productByRangeAndCategory = productDAO.findProductByRangeAndCategory(category, minPrice, maxPrice);
        return findAll().stream()
                .filter(p -> Objects.equals(category, p.getCategory().toString()) && (p.getPrice() >= minPrice && p.getPrice() <= maxPrice))
                .toList();
    }

    @Override
    public List<Product> getByMagazineId(String magazineID) {
        return findAll().stream()
                .filter(product -> Objects.equals(product.getStore().getId(), magazineID))
                .toList();
    }
}
