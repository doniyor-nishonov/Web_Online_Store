package com.pdp.web_online_store.servlets.admin;

import com.pdp.web_online_store.entity.store.Store;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.store.StoreService;
import com.pdp.web_online_store.service.store.StoreServiceImpl;
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

@WebServlet(name = "ManageServlet", urlPatterns = {"/admin/manage", "/admin/manageUsers", "/admin/manageMagazine"})
public class ManageServlet extends HttpServlet {
    private UserService userService;
    private StoreService storeService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
        storeService = new StoreServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String magazine = req.getParameter("store");
        String user = req.getParameter("user");
        if (Objects.nonNull(user)) {
            List<Users> users = userService.findByName(user);
            req.setAttribute("users", users);
        }
        if (Objects.nonNull(magazine)) {
            List<Store> stores = storeService.findByName(magazine);
            req.setAttribute("stores", stores);
        }
        req.getRequestDispatcher("/views/admin/manageUsers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        String magazineID = req.getParameter("magazineID");
        if (path.equals("/admin/manageMagazine")) {
            changeMagazine(magazineID, req);
        }
        String action = req.getParameter("action");
        String userID = req.getParameter("userID");
        Users user = null;
        if (userID != null) {
            user = userService.findById(userID);
        }
        String paramRole = req.getParameter("role");
        Users.Role role = null;
        if (Objects.nonNull(paramRole)) {
            role = Users.Role.valueOf(paramRole);
        }
        if (user != null && path.equals("/admin/manageUsers")) {
            switch (action) {
                case "active" -> user.setStatus(Users.Status.ACTIVE);
                case "deActive" -> user.setStatus(Users.Status.BLOCKED);
                case "delete" -> userService.delete(userID);
                case "role" -> user.setRole(role);
            }
            userService.update(user);
        }
        req.getRequestDispatcher("/views/admin/manageUsers.jsp").forward(req, resp);
    }

    private void changeMagazine(String magazineID, HttpServletRequest req) {
        String action = req.getParameter("action");
        Store store = storeService.findById(magazineID);
        if (action.equals("delete")) {
            storeService.delete(magazineID);
        } else {
            store.setStatus(Store.Status.valueOf(action));
            storeService.update(store);
        }

    }
}
