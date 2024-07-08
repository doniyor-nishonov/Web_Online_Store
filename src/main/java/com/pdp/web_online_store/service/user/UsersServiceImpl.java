package com.pdp.web_online_store.service.user;

import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.utils.PasswordUtils;

import java.util.List;
import java.util.Objects;

public class UsersServiceImpl implements UserService {

    @Override
    public Users save(Users users) {
        String password = users.getPassword();
        users.setPassword(PasswordUtils.encode(password));
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
        return findAll().stream()
                .anyMatch(users -> Objects.equals(email, users.getEmail())
                        && PasswordUtils.check(password, users.getPassword()));
    }

    @Override
    public Users findByEmail(String email) {
        return findAll().stream()
                .filter(users -> users.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    @Override
    public boolean checkByEmail(String email) {
        return findAll().stream()
                .anyMatch(users -> users.getEmail().equals(email));
    }
}
