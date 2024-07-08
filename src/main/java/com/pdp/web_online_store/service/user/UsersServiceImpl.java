package com.pdp.web_online_store.service.user;

import com.pdp.web_online_store.entity.user.Users;

import java.util.List;

public class UsersServiceImpl implements UserService{

    @Override
    public Users save(Users users) {
        return usersDAO.save(users);
    }

    @Override
    public boolean update(Users users) {
        return usersDAO.update(users);
    }

    @Override
    public boolean delete(String s) {
        return false;
    }

    @Override
    public Users findById(String s) {
        return null;
    }

    @Override
    public List<Users> findAll() {
        return List.of();
    }

    @Override
    public boolean login(String email, String password) {
        return false;
    }

    @Override
    public Users findByEmail(String email) {
        return null;
    }
}
