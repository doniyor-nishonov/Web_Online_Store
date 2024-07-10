package com.pdp.web_online_store.servlets.product;

import com.pdp.web_online_store.entity.customer.Customer;
import com.pdp.web_online_store.entity.order.OrderItem;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.service.orders.OrderItemService;
import com.pdp.web_online_store.service.orders.OrderItemServiceImpl;
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
import java.util.List;

@WebServlet(name = "AddCartServlet", urlPatterns = "/addCart")
public class AddCartServlet extends HttpServlet {
    private ProductService productService;
    private OrderService orderService;
    private OrderItemService orderItemService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductServiceImpl();
        this.orderService = new OrderServiceImpl();
        this.orderItemService = new OrderItemServiceImpl();
        this.userService = new UsersServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productID");
        String quantity = req.getParameter("quantity");
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("userID");
        Product product = productService.findById(productId);
        OrderItem orderItem = OrderItem.builder()
                .product(product)
                .quantity(Integer.parseInt(quantity))
                .price(product.getPrice())
                .build();
        Customer customer = Customer.builder()
                .users(userService.findById(userId))
                .orderStatus(Customer.OrderStatus.NEW)
                .build();
        Orders orders = Orders.builder()
                .orderItems(List.of(orderItem))
                .customers(List.of(customer))
                .build();
        orderService.save(orders);
        req.getRequestDispatcher("/views/product/addCartResponse.jsp").forward(req, resp);
    }
}
