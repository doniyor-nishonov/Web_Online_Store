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

@WebServlet(name = "ProductInfoServlet", urlPatterns = "/product/info")
/**
 * This servlet is responsible for handling the product information page.
 */
public class ProductInfoServlet extends HttpServlet {
    private ProductService productService;
    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productID = req.getParameter("productID");
        Product product = productService.findById(productID);
        System.out.println(product.getPicture());
        req.setAttribute("product", product);
        req.getRequestDispatcher("/views/product/info.jsp").forward(req, resp);
    }
}
