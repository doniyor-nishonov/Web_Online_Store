package com.pdp.web_online_store.servlets.seller;

import com.pdp.web_online_store.entity.address.Address;
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

@WebServlet(name = "CreateMagazineServlet", value = "/seller/createMagazine")
public class CreateMagazineServlet extends HttpServlet {
    private StoreService storeService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        storeService = new StoreServiceImpl();
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
        String address = req.getParameter("address");

        Users users = userService.findById(userID);
        Store store = magazineMapping(name, description, address, users);
        storeService.save(store);
        resp.sendRedirect("/seller/showProduct");
    }

    private static Store magazineMapping(String name, String description, String city, Users users) {
        Address address = Address.builder().city(city).build();
        return Store.builder()
                .name(name)
                .description(description)
                .address(address)
                .users(users)
                .build();
    }

    @Override
    public void destroy() {

    }
}
