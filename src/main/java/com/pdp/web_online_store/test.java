package com.pdp.web_online_store;

import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.service.address.AddressService;
import com.pdp.web_online_store.service.address.AddressServiceImpl;

public class test {
    public static void main(String[] args) {
        AddressService addressService = new AddressServiceImpl();
        Address build = Address.builder().city("Tashkent Mirobod").build();
        addressService.save(build);
    }
}
