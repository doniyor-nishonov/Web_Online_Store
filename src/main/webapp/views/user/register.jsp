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
    <style>
        *,
        *:before,
        *:after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Nunito', sans-serif;
        }

        body {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: -webkit-linear-gradient(left, #7579ff, #b224ef);
        }

        input,
        button {
            border: none;
            outline: none;
            background: none;
        }

        .cont {
            overflow: hidden;
            position: relative;
            width: 900px;
            height: 550px;
            background: #fff;
            box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
        }

        .form {
            position: relative;
            width: 640px;
            height: 100%;
            padding: 50px 30px;
            transition: transform 1.2s ease-in-out;
        }

        h2 {
            width: 100%;
            font-size: 30px;
            text-align: center;
        }

        label {
            display: block;
            width: 260px;
            margin: 25px auto 0;
            text-align: center;
        }

        label span {
            font-size: 14px;
            font-weight: 600;
            color: #505f75;
            text-transform: uppercase;
        }

        input {
            display: block;
            width: 100%;
            margin-top: 5px;
            font-size: 16px;
            padding-bottom: 5px;
            border-bottom: 1px solid rgba(109, 93, 93, 0.4);
            text-align: center;
        }

        button {
            display: block;
            margin: 0 auto;
            width: 260px;
            height: 36px;
            border-radius: 30px;
            color: #fff;
            font-size: 15px;
            cursor: pointer;
        }

        .submit {
            margin-top: 40px;
            margin-bottom: 30px;
            text-transform: uppercase;
            font-weight: 600;
            background: -webkit-linear-gradient(left, #7579ff, #b224ef);
        }

        .submit:hover {
            background: -webkit-linear-gradient(left, #b224ef, #7579ff);
        }

        .forgot-pass {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
            font-weight: 600;
            color: #0c0101;
            cursor: pointer;
        }

        .forgot-pass:hover {
            color: red;
        }

        .social-media {
            width: 100%;
            text-align: center;
            margin-top: 20px;
        }

        .social-media ul {
            list-style: none;
        }

        .social-media ul li {
            display: inline-block;
            cursor: pointer;
            margin: 25px 15px;
        }

        .social-media img {
            width: 40px;
            height: 40px;
        }

        .sub-cont {
            overflow: hidden;
            position: absolute;
            left: 640px;
            top: 0;
            width: 900px;
            height: 100%;
            padding-left: 260px;
            background: #fff;
            transition: transform 1.2s ease-in-out;
        }

        .cont.s-signup .sub-cont {
            transform: translate3d(-640px, 0, 0);
        }

        .img {
            overflow: hidden;
            z-index: 2;
            position: absolute;
            left: 0;
            top: 0;
            width: 260px;
            height: 100%;
            padding-top: 360px;
        }

        .img:before {
            content: '';
            position: absolute;
            right: 0;
            top: 0;
            width: 900px;
            height: 100%;
            background-image: url(https://raw.githubusercontent.com/abo-elnoUr/public-assets/master/bg_login.jpg);
            background-size: cover;
            transition: transform 1.2s ease-in-out;
        }

        .img:after {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
        }

        .cont.s-signup .img:before {
            transform: translate3d(640px, 0, 0);
        }

        .img-text {
            z-index: 2;
            position: absolute;
            left: 0;
            top: 50px;
            width: 100%;
            padding: 0 20px;
            text-align: center;
            color: #fff;
            transition: transform 1.2s ease-in-out;
        }

        .img-text h2 {
            margin-bottom: 10px;
            font-weight: normal;
        }

        .img-text p {
            font-size: 14px;
            line-height: 1.5;
        }

        .cont.s-signup .img-text.m-up {
            transform: translateX(520px);
        }

        .img-text.m-in {
            transform: translateX(-520px);
        }

        .cont.s-signup .img-text.m-in {
            transform: translateX(0);
        }

        .sign-in {
            padding-top: 65px;
            transition-timing-function: ease-out;
        }

        .cont.s-signup .sign-in {
            transition-timing-function: ease-in-out;
            transition-duration: 1.2s;
            transform: translate3d(640px, 0, 0);
        }

        .img-btn {
            overflow: hidden;
            z-index: 2;
            position: relative;
            width: 100px;
            height: 36px;
            margin: 0 auto;
            background: transparent;
            color: #fff;
            text-transform: uppercase;
            font-size: 15px;
            cursor: pointer;
        }

        .img-btn:after {
            content: '';
            z-index: 2;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border: 2px solid #fff;
            border-radius: 30px;
        }

        .img-btn span {
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            transition: transform 1.2s;
        }

        .img-btn span.m-in {
            transform: translateY(-72px);
        }

        .cont.s-signup .img-btn span.m-in {
            transform: translateY(0);
        }

        .cont.s-signup .img-btn span.m-up {
            transform: translateY(72px);
        }

        .sign-up {
            transform: translate3d(-900px, 0, 0);
        }

        .cont.s-signup .sign-up {
            transform: translate3d(0, 0, 0);
        }
    </style>
</head>
<body>
<div class="cont">
    <div class="form sign-in">
        <h2>Sign In</h2>
        <form action="/loginPage" method="post">
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
            <form action="/signUpPage" method="post">
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
