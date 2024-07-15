package com.pdp.web_online_store.servlets.product;

import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.enums.Category;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "ProductsServlet", urlPatterns = "/products")
public class ProductsServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lowPriceParam = req.getParameter("minPrice");
        String maxPriceParam = req.getParameter("maxPrice");
        String categoryParam = req.getParameter("category");

        int lowPrice = lowPriceParam != null && !lowPriceParam.isEmpty() ? Integer.parseInt(lowPriceParam) : 0;
        int maxPrice = maxPriceParam != null && !maxPriceParam.isEmpty() ? Integer.parseInt(maxPriceParam) : Integer.MAX_VALUE;

        System.out.println("Low Price: " + lowPrice);
        System.out.println("Max Price: " + maxPrice);
        System.out.println("Category: " + categoryParam);

        List<Product> filteredProducts;
        if (categoryParam == null || "ALL".equals(categoryParam)) {
            filteredProducts = productService.findProductByRange(lowPrice, maxPrice);
        } else {
            filteredProducts = productService.findProductByRangeAndCategory(categoryParam, lowPrice, maxPrice);
        }
        System.out.println(filteredProducts);
        req.setAttribute("products", filteredProducts);
        req.getRequestDispatcher("/views/product/products.jsp").forward(req, resp);
    }


    /*
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        String action = req.getParameter("action");
        List<Product> products;
        if (Objects.nonNull(category)) {
            products = productService.getAllByCategory(category);
        } else if (Objects.nonNull(action)) {
            int minPrice = Integer.parseInt(req.getParameter("minPrice"));
            int maxPrice = Integer.parseInt(req.getParameter("maxPrice"));
            products = productService.findProductByRange(minPrice,maxPrice);
        } else {
            products = productService.findAll();
        }
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/product/products.jsp").forward(req, resp);
    }*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
