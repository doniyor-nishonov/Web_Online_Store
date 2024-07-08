package com.pdp.web_online_store.service.customer;

import com.pdp.web_online_store.dao.customer.CustomerDAO;
import com.pdp.web_online_store.entity.customer.Customer;
import com.pdp.web_online_store.service.BaseService;

public interface CustomerService extends BaseService<Customer, String> {
    CustomerDAO customerDAO = new CustomerDAO();

}
