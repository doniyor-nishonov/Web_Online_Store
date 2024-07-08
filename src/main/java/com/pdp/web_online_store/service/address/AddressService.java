package com.pdp.web_online_store.service.address;

import com.pdp.web_online_store.dao.address.AddressDAO;
import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.service.BaseService;

public interface AddressService extends BaseService<Address, String> {
    AddressDAO addressDAO = new AddressDAO();
}
