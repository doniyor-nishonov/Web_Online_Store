package com.pdp.web_online_store.service.customer;

import com.pdp.web_online_store.dao.customer.CartDAO;
import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.service.BaseService;

public interface CartService extends BaseService<Cart, String> {
    CartDAO CART_DAO = new CartDAO();

    Cart getOrCreate(String userID);
}
