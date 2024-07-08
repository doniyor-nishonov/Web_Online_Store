package com.pdp.web_online_store.service.address;

import com.pdp.web_online_store.entity.address.Address;

import java.util.List;

public class AddressServiceImpl implements AddressService {
    @Override
    public Address save(Address address) {
        return addressDAO.save(address);
    }

    @Override
    public boolean update(Address address) {
        return addressDAO.update(address);
    }

    @Override
    public boolean delete(String id) {
        return addressDAO.deleteById(id);
    }

    @Override
    public Address findById(String s) {
        return addressDAO.findById(s);
    }

    @Override
    public List<Address> findAll() {
        return addressDAO.findAll();
    }
}
