<%--
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
    <link rel="stylesheet" href="../resources/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            position: relative;
        }

        header .logo {
            font-size: 36px;
            color: #6a0dad;
            margin-right: 20px;
        }

        header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        header nav ul li {
            margin-left: 20px;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 3px;
            transition: background-color 0.3s ease;
        }

        header nav ul li a:hover {
            background-color: #555;
        }

        header nav ul li a.register {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        header nav ul li a.register:hover {
            background-color: #0056b3;
        }

        header .search-form {
            display: flex;
            align-items: center;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .search-input {
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            outline: none;
            width: 200px;
            transition: all 0.4s ease-in-out;
            opacity: 0;
            transform: translateX(-20px);
            visibility: hidden;
        }

        .search-input:focus {
            width: 250px;
        }

        .search-button {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 3px;
            transition: background-color 0.3s ease, transform 0.4s ease-in-out;
            transform: translateX(0);
        }

        .search-button:hover {
            background-color: #0056b3;
        }

        .search-form:hover .search-input {
            opacity: 1;
            visibility: visible;
            transform: translateX(0);
        }

        .search-form:hover .search-button {
            transform: translateX(-20px);
        }

        .profile {
            padding: 20px;
            background-color: #fff;
        }

        .profile h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-details {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            padding: 20px;
        }

        .profile-img {
            max-width: 150px;
            border-radius: 50%;
            margin-right: 20px;
        }

        .profile-info {
            text-align: left;
        }

        .profile-info h3 {
            margin: 10px 0;
        }

        .profile-info p {
            color: #888;
            margin: 5px 0;
        }

        .edit-profile {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-profile:hover {
            background-color: #555;
        }

        .order-history {
            padding: 20px;
            background-color: #fff;
        }

        .order-history h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .order-list {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .order {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 10px;
            text-align: center;
            width: 100%;
            max-width: 600px;
        }

        .order h3 {
            margin: 10px 0;
        }

        .order p {
            color: #888;
        }

        .view-order {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .view-order:hover {
            background-color: #555;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 20px;
            position: relative;
            width: 100%;
            bottom: 0;
        }
    </style>
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
            <li><a href="/profile" class="profile">Profile</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="profile">
        <h2>User Profile</h2>
        <div class="profile-details">
            <img src="../fragments/img/img_1.png" alt="User Image" class="profile-img">
            <div class="profile-info">
                <h3>John Doe</h3>
                <p>Full name: John Snow</p>
                <p>Email: john.doe@example.com</p>
                <p>Phone number: 123456</p>
                <p>Address: 123 Main St, Anytown, USA</p>
                <p>Accaunt created at</p>
                <button class="edit-profile">Edit Profile</button>
            </div>
        </div>
    </section>
    <section class="order-history">
        <h2>Order History</h2>
        <div class="order-list">
            <div class="order">
                <h3>Order #12345</h3>
                <p>Date: June 15, 2024</p>
                <p>Total: $1200.00</p>
                <button class="view-order">View Order</button>
            </div>
            <div class="order">
                <h3>Order #12346</h3>
                <p>Date: July 1, 2024</p>
                <p>Total: $750.00</p>
                <button class="view-order">View Order</button>
            </div>
        </div>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>
