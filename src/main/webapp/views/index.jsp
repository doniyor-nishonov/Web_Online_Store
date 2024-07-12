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
    <title>Online Shop</title>
    <link rel="stylesheet" href="../resources/css/styles.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            overflow-x: hidden;
        }

        /* Navbar styles */
        nav {
            background-color: #000;
            padding: 15px 0;
        }

        .navbar {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar li {
            margin: 0 15px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .navbar a:hover {
            background-color: #555;
            transform: translateY(-3px);
        }

        .register {
            background-color: green;
            color: white;
        }

        .logout {
            background-color: black;
            color: white;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <h1 class="logo">Online Shop</h1>
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
                <li><a href="${pageContext.request.contextPath}/logout" class="logout">Log out</a></li>
                <%}%>
            </ul>
        </nav>
    </div>
</header>
<main>
    <section class="hero">
        <div class="container">
            <h1>Welcome to Our Online Shop</h1>
            <p>Find the best products at unbeatable prices!</p>
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
                    <img src="<%=product.getPicture().getImageUrl()%>" alt="Product">
                    <h3><%=product.getName()%></h3>
                    <p>$<%=product.getPrice()%></p>
                    <form action="${pageContext.request.contextPath}/product/info" method="GET" style="display: none;">
                        <input type="hidden" name="productID" value="<%=product.getId()%>">
                        <button type="submit">View Details</button>
                    </form>
                </div>
                <%}%>
            </div>
        </div>
    </section>
    <section class="contact">
        <div class="container">
            <h2>Contact Us</h2>
            <div class="contact-content">
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.9999481930735!2d2.292292315674767!3d48.85884407928744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66f9e1f7a9f1b%3A0x40b82c3688b86118!2sEiffel%20Tower!5e0!3m2!1sen!2sfr!4v1618333386634!5m2!1sen!2sfr"
                            width="600" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
                <div class="contact-form">
                    <form action="" method="post">
                        <input type="text" placeholder="Name" required>
                        <input type="email" placeholder="Email" required>
                        <input type="tel" placeholder="Phone" required>
                        <textarea placeholder="Message" required></textarea>
                        <button type="submit">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>
<footer>
    <div class="container footer-content">
        <div class="about-us">
            <h3>About Us</h3>
            <p>Welcome to our shop! We are dedicated to providing the best quality products and exceptional customer
                service. Our journey started with a passion for excellence and a commitment to our customers. Thank you
                for choosing us!</p>
        </div>
        <div class="need-help">
            <h3>Need Help</h3>
            <p>If you have any questions or need assistance, feel free to reach out to our support team. We are here to
                help you with your purchases, returns, and any other inquiries you may have. Your satisfaction is our
                priority.</p>
        </div>
        <div class="contact-us">
            <h3>Contact Us</h3>
            <p>123 Main Street, London, UK</p>
            <p>+01 12345678901</p>
            <p>support@ourshop.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2024 All Rights Reserved by Our Shop</p>
    </div>
</footer>
<script>
    document.querySelectorAll('.product').forEach(product => {
        product.addEventListener('click', () => {
            product.querySelector('form').submit();
        });
    });
</script>
</body>
</html>
