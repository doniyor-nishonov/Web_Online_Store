package com.pdp.web_online_store.service.user;

import com.pdp.web_online_store.entity.user.Users;

import java.util.List;

public class UsersServiceImpl implements UserService {

    @Override
    public Users save(Users users) {
        return usersDAO.save(users);
    }

    @Override
    public boolean update(Users users) {
        return usersDAO.update(users);
    }

    @Override
    public boolean delete(String ID) {
        return usersDAO.deleteById(ID);
    }

    @Override
    public Users findById(String ID) {
        return usersDAO.findById(ID);
    }

    @Override
    public List<Users> findAll() {
        return usersDAO.findAll();
    }

    @Override
    public boolean login(String email, String password) {
        return false;
    }

    @Override
    public Users findByEmail(String email) {
        return findAll().stream()
                .filter(users -> users.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }
}
