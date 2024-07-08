<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28/06/24
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
    <link href="../../resources/css/register.css" rel="stylesheet">
</head>
<body>
<div class="cont">
    <div class="form sign-in">
        <h2>Sign In</h2>
        <form action="/login" method="post">
            <label>
                <span>Email Address</span>
                <input type="email" name="email">
            </label>
            <label>
                <span>Password</span>
                <input type="password" name="password">
            </label>
            <button class="submit" type="submit">Sign In</button>
        </form>
        <p class="forgot-pass">Forgot Password ?</p>
        <div class="social-media">
            <ul>
                <li><img src="https://raw.githubusercontent.com/abo-elnoUr/public-assets/master/facebook.png">
                </li>
                <li><img src="https://raw.githubusercontent.com/abo-elnoUr/public-assets/master/twitter.png">
                </li>
                <li><img src="https://raw.githubusercontent.com/abo-elnoUr/public-assets/master/linkedin.png">
                </li>
                <li><img src="https://raw.githubusercontent.com/abo-elnoUr/public-assets/master/instagram.png">
                </li>
            </ul>
        </div>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img-text m-up">
                <h2>Welcome to Your TODO App</h2>
                <p>Manage your tasks efficiently and stay organized. Start by signing in to access your to-do list.</p>
            </div>
            <div class="img-text m-in">
                <h2>Create an Account</h2>
                <p>Join our community and start tracking your tasks effortlessly. Sign up to get started with your to-do
                    list today.</p>
            </div>

            <div class="img-btn">
                <span class="m-up">Sign In</span>
                <span class="m-in">Sign Up</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>Sign Up</h2>
            <form action="/signup" method="post">
                <label>
                    <span>Fullname</span>
                    <input type="text" name="fullname" required>
                </label>
                <label>
                    <span>Email</span>
                    <input type="email" name="email" required>
                </label>
                <label>
                    <span>Password</span>
                    <input type="password" name="password" required>
                </label>
                <button type="submit" class="submit">Sign Up Now</button>
            </form>
        </div>
    </div>
</div>

<script>
    document.querySelector('.img-btn').addEventListener('click', function () {
        document.querySelector('.cont').classList.toggle('s-signup');
    });
</script>
</body>

</html>
