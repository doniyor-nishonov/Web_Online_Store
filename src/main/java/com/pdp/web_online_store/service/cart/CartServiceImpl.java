package com.pdp.web_online_store.service.cart;

import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;

import java.util.List;
import java.util.Objects;

public class CartServiceImpl implements CartService {
    private final UserService userService = new UsersServiceImpl();

    @Override
    public Cart save(Cart cart) {
        return cartDao.save(cart);
    }

    @Override
    public boolean update(Cart cart) {
        return cartDao.update(cart);
    }

    @Override
    public boolean delete(String s) {
        return cartDao.deleteById(s);
    }

    @Override
    public Cart findById(String s) {
        return cartDao.findById(s);
    }

    @Override
    public List<Cart> findAll() {
        return cartDao.findAll();
    }

    @Override
    public List<Cart> findAllActive() {
        return cartDao.findAllActive();
    }

    @Override
    public Cart getOrCreate(String userID) {
        List<Cart> cartList = findAll();
        return cartList.stream()
                .filter(cart -> Objects.equals(cart.getUsers().getId(), userID)
                        && !cart.isPaid()
                        && !Objects.equals(cart.getOrderStatus(), Cart.OrderStatus.DELIVERED))
                .findFirst()
                .orElseGet(() -> Cart.builder()
                        .users(userService.findById(userID))
                        .orderStatus(Cart.OrderStatus.NEW)
                        .build());
    }

    @Override
    public List<Cart> findAllCartsByUserId(String userID) {
        List<Cart> cartList = findAll();
        return cartList.stream()
                .filter(cart -> Objects.equals(cart.getUsers().getId(), userID))
                .toList();
    }
}
