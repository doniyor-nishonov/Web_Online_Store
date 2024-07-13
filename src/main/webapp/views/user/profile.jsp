<%@ page import="com.pdp.web_online_store.service.user.UserService" %>
<%@ page import="com.pdp.web_online_store.service.user.UsersServiceImpl" %>
<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<%@ page import="com.pdp.web_online_store.entity.order.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.pdp.web_online_store.service.orders.OrderService" %>
<%@ page import="com.pdp.web_online_store.service.orders.OrderServiceImpl" %>
<%@ page import="com.pdp.web_online_store.entity.customer.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page - Online Shop</title>
    <link rel="stylesheet" href="../../resources/css/profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f8ff;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background: lightblue;
            padding: 20px;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        nav ul li {
            display: inline;
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #333;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile {
            text-align: center;
        }

        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 3px solid lightblue;
            animation: bounceInDown 2s;
        }

        .profile-info h3 {
            margin: 10px 0;
        }

        .profile-info p {
            margin: 5px 0;
            animation: fadeIn 2s;
        }

        .edit-profile {
            padding: 10px 20px;
            border: none;
            background: lightblue;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .edit-profile:hover {
            background: #333;
        }

        .order-history {
            margin: 20px 0;
        }

        .order-history h4 {
            margin-bottom: 10px;
            text-align: center;
            animation: fadeInUp 2s;
        }

        .order {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            animation: fadeInUp 2s;
        }

        .order-img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .order p {
            margin: 0;
        }

        .purchase-button {
            padding: 10px 20px;
            border: none;
            background: lightblue;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .purchase-button:hover {
            background: #333;
        }

        @keyframes bounceInDown {
            from, 60%, 75%, 90%, to {
                animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            }

            0% {
                opacity: 0;
                transform: translate3d(0, -3000px, 0);
            }

            60% {
                opacity: 1;
                transform: translate3d(0, 25px, 0);
            }

            75% {
                transform: translate3d(0, -10px, 0);
            }

            90% {
                transform: translate3d(0, 5px, 0);
            }

            to {
                transform: none;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translate3d(0, 100%, 0);
            }

            to {
                opacity: 1;
                transform: none;
            }
        }
    </style>
</head>

<body>
<header>
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/products">Products</a></li>
            <li><a href="/">Contact</a></li>
            <li><a href="/logout"
                   style="color: white; background-color: black; padding: 10px 20px; text-decoration: none;">Log out</a>
            </li>
        </ul>
    </nav>
</header>
<main>
    <section class="profile" data-aos="fade-up">
        <h2>User Profile</h2>
        <div class="profile-details">
            <img src="../../fragments/img/img_1.png" alt="User Image" class="profile-img">
            <div class="profile-info">
                <%
                    String userId = (String) session.getAttribute("userID");
                    UserService userService = new UsersServiceImpl();
                    Users user = userService.findById(userId);
                %>
                <h3><%= user.getFullName() %>
                </h3>
                <p>Full name: <%= user.getFullName() %>
                </p>
                <p>Email: <%= user.getEmail() %>
                </p>
                <p>Phone number: <%= user.getPhoneNumber() %>
                </p>
                <p>Address: <%= user.getAddress() %>
                </p>
                <p>Account created at: <%= user.getCreatedAt().format(DateTimeFormatter.ISO_LOCAL_DATE) %>
                </p>
                <button class="edit-profile">Edit Profile</button>
            </div>
        </div>
    </section>
    <h2 data-aos="fade-up">Order History</h2>
    <%
        OrderService orderService = new OrderServiceImpl();
        @SuppressWarnings("unchecked")
        List<Cart> carts = (List<Cart>) request.getAttribute("carts");
        if (carts != null) {
            for (Cart cart : carts) {
    %>
    <section class="order-history" data-aos="fade-up">

        <div class="order-list">
            <h4><%= cart.isPaid() ? "Archive" : "Active" %>
            </h4>
            <%
                List<Orders> ordersList = orderService.findAllOrdersByCartId(cart.getId());
                for (Orders order : ordersList) {
            %>
            <div class="order">
                <img src="<%= order.getProduct().getPicture().getImageUrl() %>"
                     alt="<%= order.getProduct().getName() %>" class="order-img">
                <p>Product Name: <%= order.getProduct().getName() %>
                </p>
                <p>Total quantity: <%= order.getQuantity() %>
                </p>
                <p>Total price: $<%= order.getTotalPrice() %>
                </p>
            </div>
            <%
                }
            %>
            <div>
                <%
                    if (!cart.isPaid()) {
                %>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <input type="hidden" name="cartID" value="<%= cart.getId() %>">
                    <button type="submit" class="purchase-button">Purchase</button>
                </form>
                <% } %>
            </div>
        </div>
    </section>
    <%
        }
    } else {
    %>
    <p>No orders found.</p>
    <% } %>
</main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init();
</script>
</body>

</html>

