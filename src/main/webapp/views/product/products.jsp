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
