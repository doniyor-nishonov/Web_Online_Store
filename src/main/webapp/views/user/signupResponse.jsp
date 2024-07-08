<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08/07/24
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up Response</title>
    <link rel="stylesheet" href="../../resources/css/signupResponse.css">
</head>
<body>
<header>
    <div class="logo">Online Shop</div>
    <jsp:include page="../../fragments/navbar.jsp"/>
    <form class="search-form" action="/search" method="GET">
        <input type="text" name="query" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>
</header>
<main>
    <%
        boolean check = Boolean.parseBoolean(request.getParameter("check"));
        if (check) {
    %>
    <section class="response">
        <h1>Registration Successful</h1>
        <p>Thank you for registering! You can now <a href="/register">log in</a> to your account.</p>
    </section>
    <%} else {%>
    <section class="response error">
        <h1>Registration Failed</h1>
        <p>There was an error with your registration. Please try again later or <a href="/">go back</a> to the
            registration page.</p>
    </section>
    <%}%>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>

