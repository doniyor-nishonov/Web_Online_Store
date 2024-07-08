<%--
  Created by IntelliJ IDEA.
  User: sardor
  Date: 07/07/24
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Log in</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .welcome-container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 300px;
            max-width: 100%;
        }

        .welcome-box {
            padding: 20px;
        }

        h2 {
            margin: 0 0 20px;
            text-align: center;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background: #5cb85c;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #4cae4c;
        }

        .additional-options {
            text-align: center;
            margin-top: 10px;
        }

        .additional-options a {
            color: #5cb85c;
            text-decoration: none;
            font-size: 14px;
            margin: 0 5px;
        }

        .additional-options a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="welcome-box" style="color: chartreuse">
    <h1 style="color: black">Log in</h1>
    <form method="post" action="/login">
        <input type="text" name="username" placeholder="@Username">
        <br>
        <input type="password" name="password" placeholder="#Password">
        <br>
        <button type="submit" class="btn">Log in</button>
    </form>
</div>

</body>
</html>
