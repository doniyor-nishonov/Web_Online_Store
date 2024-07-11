<%@ page import="java.util.List" %>
<%@ page import="com.pdp.web_online_store.entity.magazine.Magazine" %><%--
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
    <title>Create Product</title>
    <link rel="stylesheet" href="../../resources/css/createProduct.css">
</head>
<body>
<header>
    <div class="logo">Online Shop - Seller</div>
    <nav>
        <ul>
            <li><a href="/">Main menu</a></li>
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
    <section class="create-form">
        <h1>Create Product</h1>
        <form action="/seller/createProduct" method="POST" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>

            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <% for (com.pdp.web_online_store.enums.Category cat : com.pdp.web_online_store.enums.Category.values()) { %>
                <option value="<%= cat %>"><%= cat %>
                </option>
                <% } %>
            </select>

            <label for="magazine">Magazine:</label>
            <select id="magazine" name="magazine" required>
                <%
                    @SuppressWarnings("unchecked")
                    List<Magazine> magazines = (List<Magazine>) request.getAttribute("magazines");
                    for (Magazine magazine : magazines) {
                %>
                <option value="<%= magazine.getName() %>"><%= magazine.getName() %>
                </option>
                <input type="hidden" name="magazineID" value="<%=magazine.getId()%>">
                <% } %>
            </select>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" required>

            <button type="submit">Create Product</button>
        </form>
    </section>
</main>

</body>
</html>
