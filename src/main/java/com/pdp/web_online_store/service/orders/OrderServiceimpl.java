package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.entity.order.Order;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    @Override
    public Order save(Order order) {
        return orderDAO.save(order);
    }

    @Override
    public boolean update(Order order) {
        return orderDAO.update(order);
    }

    @Override
    public boolean delete(String ID) {
        return orderDAO.deleteById(ID);
    }


    @Override
    public Order findById(String ID) {
        return orderDAO.findById(ID);
    }

    @Override
    public List<Order> findAll() {
        return orderDAO.findAll();
    }
}
