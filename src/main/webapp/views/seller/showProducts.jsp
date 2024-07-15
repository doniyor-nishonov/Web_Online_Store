<%@ page import="com.pdp.web_online_store.entity.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.web_online_store.entity.store.Store" %>
<%@ page import="com.pdp.web_online_store.entity.store.Store" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="../../resources/css/showProducts.css">
</head>
<body>
<header class="animate__animated animate__fadeInDown">
    <div class="logo">Online Shop - Seller</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Main menu</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createMagazine">Create Magazine</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createProduct">Create Product</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/showProduct">Show Products</a></li>
        </ul>
    </nav>
</header>
<main>
    <aside class="filter animate__animated animate__fadeInLeft">
        <h2>Filter Products</h2>
        <%
            @SuppressWarnings("unchecked")
            List<Store> stores = (List<Store>) request.getAttribute("stores");
            for (Store store : stores) {
        %>
        <div><a href="/seller/showProduct?magazineID=<%=store.getId()%>"><%=store.getName()%>
        </a></div>
        <%}%>
    </aside>
    <section class="products-list animate__animated animate__fadeInUp">
        <h1>All Products</h1>
        <%
            @SuppressWarnings("unchecked")
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
        <div class="product animate__animated animate__zoomIn">
            <img src="<%=product.getPicture().getImageUrl()%>" alt="<%=product.getName()%>">
            <h3><%= product.getName() %>
            </h3>
            <p><%= product.getDescription() %>
            </p>
            <p>Price: $<%= product.getPrice() %>
            </p>
            <form action="${pageContext.request.contextPath}/product/delete" method="post">
                <input type="hidden" name="productID" value="<%=product.getId()%>">
                <button class="animate__animated animate__pulse" type="submit">Delete</button>
            </form>
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
</body>
</html>
