package com.pdp.web_online_store.servlets.register;

import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");

        String password = req.getParameter("password");

        Optional<Users> users = userService.login(email, password);
        if (users.isPresent()) {
            HttpSession session = req.getSession();
            Users user = users.get();
            session.setAttribute("userID", user.getId());
            session.setAttribute("role", user.getRole().toString());
            session.setAttribute("email", user.getEmail());
            resp.sendRedirect("/");
        } else {
            req.getRequestDispatcher("views/user/loginFailed.jsp").forward(req, resp);
        }

    }

    @Override
    public void destroy() {

    }
}
