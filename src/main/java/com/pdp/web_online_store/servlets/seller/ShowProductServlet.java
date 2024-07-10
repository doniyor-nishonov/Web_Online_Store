package com.pdp.web_online_store.servlets.seller;

import com.pdp.web_online_store.service.magazine.MagazineService;
import com.pdp.web_online_store.service.magazine.MagazineServiceImpl;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ShowProductServlet", value = "/seller/showProduct")
public class ShowProductServlet extends HttpServlet {
    private ProductService productService;
    private MagazineService magazineService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
        magazineService = new MagazineServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/seller/showProducts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}
