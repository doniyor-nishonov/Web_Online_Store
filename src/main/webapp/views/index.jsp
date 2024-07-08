<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shop</title>
    <link rel="stylesheet" href="../resources/css/styles.css">
</head>
<body>
<header>
    <h1 class="logo">Online Shop</h1>
    <form class="search-form" action="/search" method="GET">
        <input type="text" name="query" class="search-input" placeholder="Search...">
        <button type="submit" class="search-button">Search</button>
    </form>
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="/register" class="register">Register</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="hero">
        <h1>Welcome to Our Online Shop</h1>
        <p>Find the best products at unbeatable prices!</p>
    </section>
    <section class="products">
        <h2>Featured Products</h2>
        <div class="product-list">
            <div class="product">
                <img src="product1.jpg" alt="Product 1">
                <h3>Product 1</h3>
                <p>$10.00</p>
                <button>Add to Cart</button>
            </div>
            <div class="product">
                <img src="product2.jpg" alt="Product 2">
                <h3>Product 2</h3>
                <p>$15.00</p>
                <button>Add to Cart</button>
            </div>
            <div class="product">
                <img src="product3.jpg" alt="Product 3">
                <h3>Product 3</h3>
                <p>$20.00</p>
                <button>Add to Cart</button>
            </div>
        </div>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>
