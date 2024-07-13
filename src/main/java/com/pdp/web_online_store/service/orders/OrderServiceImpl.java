package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.service.cart.CartService;
import com.pdp.web_online_store.service.cart.CartServiceImpl;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;

import java.util.List;
import java.util.Optional;

public class OrderServiceImpl implements OrderService {
    private final UserService userService = new UsersServiceImpl();
    private final CartService cartService = new CartServiceImpl();

    @Override
    public Orders save(Orders orders) {
        return orderDAO.save(orders);
    }

    @Override
    public boolean update(Orders orders) {
        return orderDAO.update(orders);
    }

    @Override
    public boolean delete(String ID) {
        return orderDAO.deleteById(ID);
    }


    @Override
    public Orders findById(String ID) {
        return orderDAO.findById(ID);
    }

    @Override
    public List<Orders> findAll() {
        return orderDAO.findAll();
    }

    @Override
    public List<Orders> findAllActive() {
        return orderDAO.findAllActive();
    }

    @Override
    public Orders getOrCreate(Orders order, Cart cart) {
        List<Orders> ordersList = findAll();
        Optional<Orders> existingOrder = ordersList.stream().filter(o -> o.getProduct().getId().equals(order.getProduct().getId()) &&
                        order.getCart().getId().equals(cart.getId()) && !cart.isPaid())
                .findFirst();

        if (existingOrder.isPresent()) {
            Orders foundOrder = existingOrder.get();
            foundOrder.setQuantity(foundOrder.getQuantity() + order.getQuantity());
            update(foundOrder);
            return foundOrder;
        } else {
            save(order);
            return order;
        }
    }

    @Override
    public List<Orders> findAllOrdersByCartId(String cartID) {
        List<Orders> ordersList = findAll();
        return ordersList.stream()
                .filter(order -> order.getCart().getId().equals(cartID))
                .toList();
    }
}
