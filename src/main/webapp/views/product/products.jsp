<%@ page import="com.pdp.web_online_store.entity.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="../../resources/css/products.css">
    <style>
        /* Reset some default styles */
        body, h1, h2, h3, ul, li, form, input, button {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: lightblue;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header .logo {
            font-size: 24px;
            font-weight: bold;
        }

        header nav ul {
            display: flex;
            list-style: none;
        }

        header nav ul li {
            margin-left: 20px;
        }

        header nav ul li a {
            text-decoration: none;
            color: #333;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #fff;
        }

        .search-form {
            display: flex;
            align-items: center;
        }

        .search-form input[type="text"] {
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .search-form button {
            padding: 10px 20px;
            border: none;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-form button:hover {
            background-color: lightblue;
        }

        main {
            display: flex;
            flex: 1;
            padding: 20px;
        }

        .products {
            flex: 1;
        }

        .products h1 {
            margin-bottom: 20px;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px; /* Decreased the gap between products */
        }

        .product {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px; /* Decreased padding */
            text-align: center;
            width: calc(25% - 10px); /* Adjusted width to be smaller */
            transition: transform 0.3s;
        }

        .product:hover {
            transform: translateY(-10px);
        }

        .product img {
            max-width: 100%;
            border-radius: 10px;
        }

        .product h2 {
            font-size: 18px; /* Smaller font size */
            margin: 10px 0;
        }

        .product h3 {
            font-size: 16px; /* Smaller font size */
            color: #333;
            margin-bottom: 10px;
        }

        .product button {
            padding: 5px 10px; /* Decreased padding */
            border: none;
            background-color: lightblue;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .product button:hover {
            background-color: #333;
        }

        /* Sidebar for category filter */
        .sidebar {
            width: 200px;
            margin-right: 20px;
        }

        .sidebar h2 {
            margin-bottom: 10px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            transition: color 0.3s;
        }

        .sidebar ul li a:hover {
            color: lightblue;
        }

        .filter-form {
            display: flex;
            flex-direction: column;
        }

        .filter-form label {
            margin-top: 10px;
        }

        .filter-form input {
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .filter-form button {
            padding: 10px 20px;
            border: none;
            background-color: lightblue;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .filter-form button:hover {
            background-color: #333;
        }

        /* Add animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        body {
            animation: fadeIn 1s ease-in;
        }

    </style>
</head>
<body>
<header>
    <div class="logo">Online Shop</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
        </ul>
    </nav>
    <form class="search-form" action="${pageContext.request.contextPath}/searchProduct" method="GET">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</header>
<main>
    <aside class="sidebar">
        <h3>Filter Products</h3>
        <form action="${pageContext.request.contextPath}/products" method="GET" class="filter-form">
            <label>Categories:</label>

            <label for="all"><input type="radio" id="all" name="category" value="ALL"> ALL</label>
            <label><input type="checkbox" name="category" value="TECHNIQUE"> Technique</label>
            <label><input type="checkbox" name="category" value="CLOTHES"> Clothes</label>
            <label><input type="checkbox" name="category" value="FOOD"> Food</label>
            <label><input type="checkbox" name="category" value="ACCESSORIES"> Accessories</label>
            <label for="minPrice">Min Price:</label>
            <input type="number" name="minPrice" id="minPrice" min="0" step="0.01">
            <label for="maxPrice">Max Price:</label>
            <input type="number" name="maxPrice" id="maxPrice" min="0" step="0.01">
            <input type="hidden" name="action" value="1">
            <button type="submit">Filter</button>
        </form>
    </aside>
    <section class="products">
        <h1>Our Products</h1>
        <div class="product-list">
            <%
                @SuppressWarnings("unchecked")
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) {
            %>
            <div class="product">
                <form action="${pageContext.request.contextPath}/product/info">
                    <img src="<%=product.getPicture().getImageUrl()%>" alt="<%=product.getName()%>">
                    <h2><%=product.getName()%>
                    </h2>
                    <h3>Price: $<%=product.getPrice()%>
                    </h3>
                    <input type="hidden" name="productID" id="productID" value="<%=product.getId()%>">
                    <button type="submit">Info</button>
                </form>
            </div>
            <%}%>
        </div>
    </section>
</main>
</body>
</html>
