package com.pdp.web_online_store.servlets.register;

import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.service.customer.CartService;
import com.pdp.web_online_store.service.customer.CartServiceImpl;
import com.pdp.web_online_store.service.orders.OrderService;
import com.pdp.web_online_store.service.orders.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "profile", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = (String) req.getSession().getAttribute("userID");
        List<Cart> carts = cartService.findAllCartsByUserId(userID);
        req.setAttribute("carts", carts);
        req.getRequestDispatcher("views/user/profile.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cartID = req.getParameter("cartID");
        Cart cart = cartService.findById(cartID);
        cart.setPaid(true);
        cartService.update(cart);
        resp.sendRedirect("/");
    }

}