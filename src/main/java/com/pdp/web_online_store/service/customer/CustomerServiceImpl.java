package com.pdp.web_online_store.service.customer;

import com.pdp.web_online_store.entity.customer.Customer;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class CustomerServiceImpl implements CustomerService {
    private final UserService userService = new UsersServiceImpl();

    @Override
    public Customer save(Customer customer) {
        return customerDAO.save(customer);
    }

    @Override
    public boolean update(Customer customer) {
        return customerDAO.update(customer);
    }

    @Override
    public boolean delete(String s) {
        return customerDAO.deleteById(s);
    }

    @Override
    public Customer findById(String s) {
        return customerDAO.findById(s);
    }

    @Override
    public List<Customer> findAll() {
        return customerDAO.findAll();
    }

    @Override
    public Customer getOrCreate(String userID) {
        return findAll().stream()
                .filter(customer -> Objects.equals(customer.getUsers().getId(), userID)
                        && !Objects.equals(customer.getOrderStatus(), Customer.OrderStatus.DELIVERED))
                .findFirst()
                .orElseGet(() -> Customer.builder()
                        .users(userService.findById(userID))
                        .orderStatus(Customer.OrderStatus.NEW)
                        .build());
    }
}
