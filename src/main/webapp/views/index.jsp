<%@ page import="java.util.Objects" %>
<%@ page import="com.pdp.web_online_store.service.product.ProductService" %>
<%@ page import="com.pdp.web_online_store.service.product.ProductServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.web_online_store.entity.product.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Sneaker Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<header>
    <div class="container">
        <h1 class="logo">Online Sneaker Shop</h1>
        <form class="search-form" action="${pageContext.request.contextPath}/searchProduct" method="GET">
            <input type="text" name="query" class="search-input" placeholder="Search...">
            <button type="submit" class="search-button">Search</button>
        </form>
        <nav>
            <ul class="navbar">
                <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                <%
                    String role = (String) session.getAttribute("role");
                    if (Objects.equals("SELLER", role)) {
                %>
                <li><a href="${pageContext.request.contextPath}/seller/menu">Seller</a></li>
                <%
                    }
                    if (Objects.equals("ADMIN", role)) {
                %>
                <li><a href="${pageContext.request.contextPath}/admin/home">Admin</a></li>
                <%
                    }
                    String userID = (String) session.getAttribute("userID");
                    if (Objects.nonNull(userID)) {
                %>
                <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
                <%
                    }
                    if (Objects.isNull(userID)) {
                %>
                <li><a href="${pageContext.request.contextPath}/register" class="register">Register</a></li>
                <%} else {%>
                <li><a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h1>Welcome to Our Sneaker Shop</h1>
        <p>Find the best sneakers at the most affordable prices</p>
        <a href="${pageContext.request.contextPath}/products" class="cta-button">Shop Now</a>
    </div>
</section>

<section class="products">
    <div class="container">
        <h2>Featured Products</h2>
        <div class="product-list">
            <%
                ProductService productService = new ProductServiceImpl();
                List<Product> products = productService.findAll();
                for (Product product : products) {
            %>
            <div class="product">
                <form action="${pageContext.request.contextPath}/product/info" method="GET">
                    <input type="hidden" name="productID" value="<%= product.getId() %>">
                    <button type="submit" class="product-button">
                        <img src="<%= product.getPicture().getImageUrl() %>" alt="Sneaker Image">
                    </button>
                </form>
                <h3><%= product.getName() %></h3>
                <p><%= product.getPrice() %> $</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<section class="contact">
    <div class="container">
        <h2>Contact Us</h2>
        <div class="contact-content">
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.6846892987535!2d106.68562427473483!3d10.762622060915134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529292f133edb%3A0xeeb5a2a2a2bdee4!2sBen%20Thanh%20Market!5e0!3m2!1sen!2s!4v1625146581905!5m2!1sen!2s"
                        width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
            <div class="contact-form">
                <form action="${pageContext.request.contextPath}/contact" method="POST">
                    <input type="text" name="name" placeholder="Your Name" required>
                    <input type="email" name="email" placeholder="Your Email" required>
                    <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                    <button type="submit">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="footer-content">
            <div>
                <h3>About Us</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed
                    cursus ante dapibus diam.</p>
            </div>
            <div>
                <h3>Follow Us</h3>
                <p>Follow us on social media</p>
                <div>
                    <a href="/">Facebook</a>
                    <a href="/">Twitter</a>
                    <a href="/">Instagram</a>
                </div>
            </div>
            <div>
                <h3>Subscribe</h3>
                <p>Get the latest news and offers</p>
                <form action="${pageContext.request.contextPath}/subscribe" method="POST">
                    <input type="email" name="email" placeholder="Your Email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Online Sneaker Shop. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>
