package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.entity.customer.Customer;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.customer.CustomerService;
import com.pdp.web_online_store.service.customer.CustomerServiceImpl;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private final UserService userService = new UsersServiceImpl();
    private final CustomerService customerService = new CustomerServiceImpl();

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
    public Orders getOrCreate(String userID) {
        Customer customer = customerService.getOrCreate(userID);
        Users user = userService.findById(userID);
        for (Orders order : findAll()) {
            if (!order.isPaid()) {

            }
        }
        return null;
    }
}
