<%@ page import="com.pdp.web_online_store.service.user.UserService" %>
<%@ page import="com.pdp.web_online_store.service.user.UsersServiceImpl" %>
<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<%@ page import="com.pdp.web_online_store.entity.order.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.pdp.web_online_store.service.orders.OrderService" %>
<%@ page import="com.pdp.web_online_store.service.orders.OrderServiceImpl" %>
<%@ page import="com.pdp.web_online_store.entity.customer.Cart" %><%--
  Created by IntelliJ IDEA.
  User: sardor
  Date: 10/07/24
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page - Online Shop</title>
    <link rel="stylesheet" href="../../resources/css/profile.css">
</head>
<body>
<header>
    <h1 class="logo">Online Shop</h1>
    <form class="search-form" action="/search" method="GET">
        <input type="text" name="query" class="search-input" placeholder="Search...">
        <button type="submit" class="search-button">Search</button>
    </form>
    <jsp:include page="../../fragments/navbar.jsp"/>
</header>
<main>
    <section class="profile">
        <h2>User Profile</h2>
        <div class="profile-details">
            <img src="../../fragments/img/img_1.png" alt="User Image" class="profile-img">
            <div class="profile-info">
                <%
                    String userId = (String) session.getAttribute("userID");

                    UserService userService = new UsersServiceImpl();

                    Users user = userService.findById(userId);
                %>

                <h3><%= user.getFullName()%>
                </h3>
                <p>Full name:   <%=user.getFullName() %>
                </p>
                <p>Email:   <%= user.getEmail()%>
                </p>
                <p>Phone number:   <%=user.getPhoneNumber()%>
                </p>
                <p>Address: <%= user.getAddress()%>
                </p>
                <p>Account created at: <%=user.getCreatedAt().format(DateTimeFormatter.ISO_LOCAL_DATE)%>
                </p>
                <button class="edit-profile">Edit Profile</button>
            </div>
        </div>
    </section>

    <%
        OrderService orderService = new OrderServiceImpl();
        @SuppressWarnings("unchecked")
        List<Cart> carts = (List<Cart>) request.getAttribute("carts");
        if (carts != null) {
            for (Cart cart : carts) {
    %>
    <section class="order-history">
        <h2>Order History</h2>
        <div class="order-list">
            <%
                List<Orders> ordersList = orderService.findAllOrdersByCartId(cart.getId());
                for (Orders order : ordersList) {
            %>
            <div class="order">
                <h4><%=order.getCart().isPaid() ? "Archive" : "Active"%>
                </h4>
                <img src="<%=order.getProduct().getPicture().getImageUrl()%>" alt="<%=order.getProduct().getName()%>">
                <p>Product Name: <%=order.getProduct().getName()%>
                </p>
                <p>Total quantity: <%=order.getQuantity()%>
                </p>
                <p>Total price: $<%=order.getTotalPrice()%>
                </p>
            </div>
            <div>
                <%
                    if (!cart.isPaid()) {
                %>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <input type="hidden" name="cartID" value="<%=cart.getId()%>">
                    <button type="submit">Purchase</button>
                </form>
                <%}%>
            </div>
            <%
                }
            %>
        </div>
    </section>
    <%
        }
    } else {
    %>
    <p>No orders found.</p>
    <%}%>

</main>
</body>
</html>
