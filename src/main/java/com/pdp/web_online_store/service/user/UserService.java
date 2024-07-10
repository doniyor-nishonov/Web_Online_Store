package com.pdp.web_online_store.service.user;

import com.pdp.web_online_store.dao.user.UsersDAO;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.BaseService;

import java.util.List;
import java.util.Optional;

public interface UserService extends BaseService<Users, String> {
    UsersDAO usersDAO = new UsersDAO();

    Optional<Users> login(String email, String password);

    Optional<Users> findByEmail(String email);

    boolean checkByEmail(String email);

    List<Users> findByName(String query);
}
