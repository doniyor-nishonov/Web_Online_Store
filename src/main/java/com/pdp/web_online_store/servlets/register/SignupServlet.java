package com.pdp.web_online_store.servlets.register;

import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "signup", urlPatterns = "/signup")
public class SignupServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean check = userService.checkByEmail(email);
        if (!check) {
            Users users = Users.builder()
                    .fullName(fullName)
                    .email(email)
                    .password(password)
                    .role(Users.Role.USER)
                    .status(Users.Status.ACTIVE)
                    .build();
            userService.save(users);
        }
        req.setAttribute("check", check);
        req.getRequestDispatcher("/views/user/signupResponse.jsp").forward(req, resp);
    }
}
