package com.pdp.web_online_store.service.customer;

import com.pdp.web_online_store.entity.customer.Customer;

import java.util.List;

public class CustomerServiceImpl implements CustomerService{
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
}
