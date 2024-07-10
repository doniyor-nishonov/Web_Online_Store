<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=/products"> <!-- Redirect to products page after 3 seconds -->
    <title>Add to Cart Response</title>
    <link rel="stylesheet" href="../../resources/css/addCartResponse.css"> <!-- Link to your external CSS file -->
</head>
<body>
<header>
    <div class="logo">Online Shop</div>
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/products">Products</a></li>
            <li><a href="/about">About Us</a></li>
            <li><a href="/contact">Contact</a></li>
        </ul>
    </nav>
    <form class="search-form" action="/search" method="GET">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</header>
<main class="main">
    <div class="container">
        <section class="response-message">
            <div class="message">
                <h2>Item Successfully Added to Cart</h2>
                <p>Your item has been added to the cart.</p>
                <p><a href="/products" class="continue-shopping">Continue Shopping</a></p>
            </div>
        </section>
    </div>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>
