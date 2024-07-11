<%--
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
    <title>Create Seller</title>
    <link rel="stylesheet" href="../../resources/css/adminPage.css">
</head>
<body>
<header>
    <div class="logo">Online Shop - Admin</div>
    <nav>
        <ul>
            <li><a href="/">Main menu</a></li>
            <li><a href="/admin/home">Home</a></li>
            <li><a href="/admin/createSeller">Create Seller</a></li>
            <li><a href="/admin/manageUsers">Manage Users</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="create-seller">
        <h1>Create Seller</h1>
        <form action="/admin/createSeller" method="POST">
            <label for="sellerName">Seller Name:</label>
            <input type="text" id="sellerName" name="sellerName" required>

            <label for="sellerEmail">Seller Email:</label>
            <input type="email" id="sellerEmail" name="sellerEmail" required>

            <button type="submit">Create Seller</button>
        </form>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>

