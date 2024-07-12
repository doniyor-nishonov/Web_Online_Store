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
import java.util.List;
import java.util.Objects;

@WebServlet(name = "ManageUsersServlet", urlPatterns = "/admin/manageUsers")
public class ManageUsersServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");
        if (Objects.nonNull(query)) {
            List<Users> users = userService.findByName(query);
            req.setAttribute("users", users);
        }
        req.getRequestDispatcher("/views/admin/manageUsers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getServletPath());
        System.out.println(req.getContextPath());
        System.out.println(req.getRequestURI());
    }
}
