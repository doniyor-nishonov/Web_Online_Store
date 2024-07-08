package com.pdp.web_online_store.service.user;

import com.pdp.web_online_store.dao.user.UsersDAO;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.BaseService;

public interface UserService extends BaseService<Users, String> {
    UsersDAO usersDAO = new UsersDAO();

    boolean login(String email, String password);

    Users findByEmail(String email);

}
