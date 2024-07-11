package com.pdp.web_online_store.servlets.seller;

import com.pdp.web_online_store.entity.magazine.Magazine;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.service.magazine.MagazineService;
import com.pdp.web_online_store.service.magazine.MagazineServiceImpl;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CreateMagazineServlet", value = "/seller/createMagazine")
public class CreateMagazineServlet extends HttpServlet {
    private MagazineService magazineService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        magazineService = new MagazineServiceImpl();
        userService = new UsersServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/createMagazine.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = (String) req.getSession().getAttribute("userID");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        Users users = userService.findById(userID);
        Magazine magazine = magazineMapping(name, description, users);
        magazineService.save(magazine);
        resp.sendRedirect("/seller/showProduct");
    }

    private static Magazine magazineMapping(String name, String description, Users users) {
        return Magazine.builder()
                .name(name)
                .description(description)
                .users(users)
                .build();
    }

    @Override
    public void destroy() {

    }
}
