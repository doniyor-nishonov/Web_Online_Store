<%@ page import="com.pdp.web_online_store.entity.product.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Info</title>
    <link rel="stylesheet" href="../../resources/css/productInfo.css">
</head>
<body>
<header>
    <div class="logo">Online Shop</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
        </ul>
    </nav>
    <form class="search-form" action="${pageContext.request.contextPath}/searchProduct" method="GET">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</header>
<main>
    <section class="product-info">
        <%
            Product product = (Product) request.getAttribute("product");
        %>
        <div class="product-details">
            <div class="product-images">
                <img src="<%=product.getPicture().getImageUrl()%>" alt="<%=product.getName()%>" class="main-image">
            </div>
            <div class="product-text">
                <h1><%=product.getName()%></h1>
                <h3>Price: $<%=product.getPrice()%></h3>
                <p><%=product.getDescription()%></p>
                <form action="${pageContext.request.contextPath}/addCart" method="POST">
                    <div class="quantity">
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1">
                    </div>
                    <input type="hidden" name="productID" value="<%=product.getId()%>">
                    <input type="hidden" name="price" value="<%=product.getPrice()%>">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
        </div>
    </section>
    <section class="payment-methods">
        <h2>Payment Methods</h2>
        <div class="payment-icons">
            <img src="https://via.placeholder.com/50x30?text=Visa" alt="Visa">
            <img src="https://via.placeholder.com/50x30?text=Mastercard" alt="Mastercard">
            <img src="https://via.placeholder.com/50x30?text=PayPal" alt="PayPal">
            <img src="https://via.placeholder.com/50x30?text=Amex" alt="American Express">
        </div>
    </section>
</main>

</body>
</html>
