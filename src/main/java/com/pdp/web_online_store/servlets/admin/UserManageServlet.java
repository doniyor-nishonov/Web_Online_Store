package com.pdp.web_online_store.servlets.admin;

import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UserManageServlet", urlPatterns = {"/admin/changeRole", "/admin/blockUser", "/admin/deleteUser"})
public class UserManageServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        String userID = req.getParameter("userID");
        switch (path){
            case "/admin/blockUser" -> blockUser(userID);
            case "/admin/deleteUser" -> deleteUser(userID);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        String path = req.getServletPath();
        if (path.equals("/admin/changeRole")) {
            changeRole(userID, req);
        }
        resp.sendRedirect("/admin/manageUsers");
    }

    private void changeRole(String userID, HttpServletRequest req) {
        Users user = userService.findById(userID);
        String role = req.getParameter("role");
        user.setRole(Users.Role.valueOf(role));
        userService.update(user);
    }

    private void blockUser(String userID) {
        Users user = userService.findById(userID);
        user.setStatus(Users.Status.BLOCKED);
        userService.update(user);
    }

    private void deleteUser(String userID) {
        userService.delete(userID);
    }
}
