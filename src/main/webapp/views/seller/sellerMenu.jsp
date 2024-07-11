<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08/07/24
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Page</title>
    <link rel="stylesheet" href="../../resources/css/sellerMenu.css">
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
    <section class="welcome">
        <h1>Welcome, Seller</h1>
        <p>Use the menu to manage your products and magazines.</p>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>

