<%@ page import="java.util.Objects" %>
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
    <jsp:include page="../fragments/navbar.jsp"/>
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
                <img src="../fragments/img/computer-img.png" alt="Product 1">
                <h3>Computer Asus Tuf Gaming</h3>
                <p>$1200.00</p>
                <button>Add to Cart</button>
            </div>
            <div class="product">
                <img src="../fragments/img/laptop-img.png" alt="Product 2">
                <h3>Laptop </h3>
                <p>$700.00</p>
                <button>Add to Cart</button>
            </div>
            <div class="product">
                <img src="../fragments/img/tshirt-img.png" alt="Product 3">
                <h3>Yellow Shirt</h3>
                <p>$50.00</p>
                <button>Add to Cart</button>
            </div>
        </div>
    </section>
</main>

</body>
</html>
