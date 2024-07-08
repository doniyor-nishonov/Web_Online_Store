package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.entity.order.OrderItem;

import java.util.List;

public class OrderItemServiceImpl implements OrderItemService{
    @Override
    public OrderItem save(OrderItem orderItem) {
        return orderItemDAO.save(orderItem);
    }


    @Override
    public boolean update(OrderItem orderItem) {
        return orderItemDAO.update(orderItem);
    }

    @Override
    public boolean delete(String ID) {
        return orderItemDAO.deleteById(ID);
    }

    @Override
    public OrderItem findById(String ID) {
        return orderItemDAO.findById(ID);
    }

    @Override
    public List<OrderItem> findAll() {
        return orderItemDAO.findAll();
    }
}
