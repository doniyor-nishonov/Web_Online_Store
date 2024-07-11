package com.pdp.web_online_store.servlets.seller;

import com.pdp.web_online_store.entity.magazine.Magazine;
import com.pdp.web_online_store.entity.picture.Picture;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.enums.Category;
import com.pdp.web_online_store.service.magazine.MagazineService;
import com.pdp.web_online_store.service.magazine.MagazineServiceImpl;
import com.pdp.web_online_store.service.product.ProductService;
import com.pdp.web_online_store.service.product.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@MultipartConfig
@WebServlet(name = "CreateProductServlet", value = "/seller/createProduct")
public class CreateProductServlet extends HttpServlet {
    private ProductService productService;
    private MagazineService magazineService;
    private final Path rootPath = Path.of("/Users/user/Desktop/PDP_ACADEMY/pdp/ultimate/g40/projects/Web_Online_Store/src/main/webapp/resources/img");

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
        magazineService = new MagazineServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = (String) req.getSession().getAttribute("userID");
        List<Magazine> magazines = magazineService.getMagazinesBySellerId(userID);
        req.setAttribute("Category", Category.values());
        req.setAttribute("magazines", magazines);
        req.getRequestDispatcher("/views/seller/createProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String magazineID = req.getParameter("magazineID");
        Magazine magazine = magazineService.findById(magazineID);
        Category category = Category.valueOf(req.getParameter("category"));
        Part part = req.getPart("image");
        Picture picture = getPicture(part);
        Product product = Product.builder()
                .name(name)
                .description(description)
                .price(price)
                .category(category)
                .picture(picture)
                .magazine(magazine)
                .stockQuantity(quantity)
                .build();
        productService.save(product);
        req.getRequestDispatcher("/views/seller/addProductResponse.jsp").forward(req, resp);
    }

    private Picture getPicture(Part part) throws IOException {
        String originalName = part.getSubmittedFileName();
        String contentType = originalName.substring(originalName.lastIndexOf("."));
        String generatedName = UUID.randomUUID() + contentType;
        long size = part.getSize();
        String imageUrl = "../../resources/img/" + generatedName;
        System.out.println(imageUrl);
        Path path = rootPath.resolve(generatedName);
        Files.copy(part.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        return Picture.builder()
                .originalName(originalName)
                .generatedName(generatedName)
                .size(size)
                .mimeType(contentType)
                .imageUrl(imageUrl)
                .build();
    }

    @Override
    public void destroy() {

    }
}
