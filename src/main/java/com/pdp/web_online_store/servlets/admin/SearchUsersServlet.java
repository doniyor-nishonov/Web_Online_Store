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

@WebServlet(name = "SearchUsersServlet", urlPatterns = "/admin/searchUsers")
public class SearchUsersServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");

        // Perform search logic (replace with your actual logic)
        List<Users> users = userService.findByName(query);

        // Set users as request attribute
        req.setAttribute("users", users);

        // Forward to the JSP page
        req.getRequestDispatcher("/views/admin/manageUsers.jsp").forward(req, resp);
    }
}
