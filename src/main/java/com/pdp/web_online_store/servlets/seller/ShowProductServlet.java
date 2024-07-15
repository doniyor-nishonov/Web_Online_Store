package com.pdp.web_online_store.servlets.seller;

import com.pdp.web_online_store.entity.store.Store;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.service.store.StoreService;
import com.pdp.web_online_store.service.store.StoreServiceImpl;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "ShowProductServlet", value = "/seller/showProduct")
public class ShowProductServlet extends HttpServlet {
    private ProductService productService;
    private StoreService storeService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
        storeService = new StoreServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = (String) req.getSession().getAttribute("userID");
        String magazineID = req.getParameter("magazineID");
        List<Product> products;
        if (Objects.nonNull(magazineID)) {
            products = productService.getByMagazineId(magazineID);
        } else {
            products = productService.findAll();
        }
        List<Store> storeList = storeService.getMagazinesBySellerId(userID);
        req.setAttribute("products", products);
        req.setAttribute("stores", storeList);
        req.getRequestDispatcher("/views/seller/showProducts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}
