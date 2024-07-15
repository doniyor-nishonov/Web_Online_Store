package com.pdp.web_online_store.dao.product;

import com.pdp.web_online_store.dao.BaseDAO;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.enums.Category;

import java.util.List;

public class ProductDAO extends BaseDAO<Product, String> {
    @SuppressWarnings("unchecked")
    public List<Product> findProductByRange(int minPrice, int maxPrice) {
        begin();
        List<Product> resultList = em.createNativeQuery("SELECT * FROM product WHERE price BETWEEN ?1 AND ?2", Product.class)
                .setParameter(1, minPrice)
                .setParameter(2, maxPrice)
                .getResultList();
        commit();
        return resultList;
    }

    public List<Product> findProductByRangeAndCategory(Category category, int minPrice, int maxPrice) {
        begin();
        List<Product> resultList = em.createQuery("SELECT p FROM Product p WHERE p.price BETWEEN :min AND :max AND p.category =:category", Product.class)
                .setParameter("category", category)
                .setParameter("min", minPrice)
                .setParameter("max", maxPrice)
                .getResultList();
        commit();
        return resultList;
    }
}
