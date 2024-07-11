<%@ page import="com.pdp.web_online_store.service.user.UserService" %>
<%@ page import="com.pdp.web_online_store.service.user.UsersServiceImpl" %>
<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<%@ page import="com.pdp.web_online_store.entity.order.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/products">Products</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
            <li><a href="/logout"
                   style="color: white; background-color: black; padding: 10px 20px; text-decoration: none;">Log out</a>
            </li>

        </ul>
    </nav>
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


    <section class="order-history">
        <h2>Order History</h2>
        <div class="order-list">
            <%
                @SuppressWarnings("unchecked")
                List<Orders> ordersList = (List<Orders>) request.getAttribute("orders");
                if (ordersList != null) {
                    for (Orders order : ordersList) {
            %>
            <div class="order">
                <h3>Order: <%=order.getCarts()%>
                </h3>
                <p>Date: <%=order.getOrderDate()%>
                </p>
                <p>Order item: <%=order.getOrderItems()%>
                </p>
                <p>Total quantity: <%=order.getQuantity()%>
                </p>
                <p>Delivery address: <%=order.getDeliveryAddress()%>
                </p>
                <p>Total price: $<%=order.getTotalPrice()%>
                </p>

                <button class="view-order">View Order</button>
            </div>
            <%
                }
            } else {
            %>
            <p>No orders found.</p>
            <%
                }
            %>
        </div>
    </section>


</main>
</body>
</html>
