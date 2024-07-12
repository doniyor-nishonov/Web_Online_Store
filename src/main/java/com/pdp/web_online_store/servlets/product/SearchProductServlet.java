package com.pdp.web_online_store.servlets.product;

import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchProduct", urlPatterns = "/searchProduct")
public class SearchProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");
        List<Product> products = productService.findByName(query);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/product/products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
