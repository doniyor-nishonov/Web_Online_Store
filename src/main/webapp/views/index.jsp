<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Uzum Market</title>

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
<div class="welcome-container">
    <div class="welcome-box">
        <h2>Welcome to Uzum Market</h2>
        <p>Explore our marketplace by logging in or create an account to get started.</p>
        <a href="/login" class="btn">Login</a>
        <a href="/signup" class="btn">Create an account</a>
        <div class="additional-options">

            <a href="/forgot-password">Forgot password?</a>
        </div>
    </div>
</div>
</body>
</html>
