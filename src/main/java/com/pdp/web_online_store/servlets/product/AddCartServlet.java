package com.pdp.web_online_store.servlets.product;

import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.service.cart.CartService;
import com.pdp.web_online_store.service.cart.CartServiceImpl;
import com.pdp.web_online_store.service.orders.OrderService;
import com.pdp.web_online_store.service.orders.OrderServiceImpl;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import com.pdp.web_online_store.service.user.UserService;
import com.pdp.web_online_store.service.user.UsersServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AddCartServlet", urlPatterns = "/addCart")
public class AddCartServlet extends HttpServlet {
    private ProductService productService;
    private OrderService orderService;
    private UserService userService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductServiceImpl();
        this.orderService = new OrderServiceImpl();
        this.userService = new UsersServiceImpl();
        this.cartService = new CartServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productID");
        String quantity = req.getParameter("quantity");
        double price = Double.parseDouble(req.getParameter("price"));
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userID");
        Product product = productService.findById(productId);
        Cart cart = cartService.getOrCreate(userId);
        Orders orders = Orders.builder()
                .product(product)
                .quantity(Integer.parseInt(quantity))
                .cart(cart)
                .totalPrice(price * Integer.parseInt(quantity))
                .build();
        cartService.save(cart);
        orderService.getOrCreate(orders, cart);
        req.getRequestDispatcher("/views/product/addCartResponse.jsp").forward(req, resp);
    }
}
