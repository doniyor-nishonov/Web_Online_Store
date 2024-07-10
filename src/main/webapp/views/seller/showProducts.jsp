<%@ page import="com.pdp.web_online_store.entity.product.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08/07/24
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Products</title>
    <link rel="stylesheet" href="../../resources/css/showProducts.css">
</head>
<body>
<header>
    <div class="logo">Online Shop - Seller</div>
    <nav>
        <ul>
            <li><a href="/seller/menu">Home</a></li>
            <li><a href="/seller/createMagazine">Create Magazine</a></li>
            <li><a href="/seller/createProduct">Create Product</a></li>
            <li><a href="/seller/showProduct">Show Products</a></li>
        </ul>
    </nav>
    <form class="search-form" action="/search" method="GET">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</header>
<main>
    <section class="products-list">
        <h1>All Products</h1>
        <%
            @SuppressWarnings("unchecked")
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
        <div class="product">
            <h3><%= product.getName() %>
            </h3>
            <p><%= product.getDescription() %>
            </p>
            <p>Price: $<%= product.getPrice() %>
            </p>
            <button>Edit</button>
            <button>Delete</button>
        </div>
        <%
            }
        } else {
        %>
        <p>No products available.</p>
        <%
            }
        %>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>
