package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.entity.order.Orders;

import java.util.List;

public class OrderServiceImpl implements OrderService {
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
}
