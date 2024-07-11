package com.pdp.web_online_store.service.product;

import com.pdp.web_online_store.dao.product.ProductDAO;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.service.BaseService;

import java.util.List;

public interface ProductService extends BaseService<Product, String> {
    ProductDAO productDAO = new ProductDAO();
    List<Product> getAllByCategory(String category);

    List<Product> getByRandom(int count);

    List<Product> getByOwnerId(String userID);
}
