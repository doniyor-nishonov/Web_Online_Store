<%--
  Created by IntelliJ IDEA.
  User: sardor
  Date: 10/07/24
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Confirmation - Online Shop</title>
    <link rel="stylesheet" href="../../resources/css/logout.css">

</head>
<body>
<div class="confirmation-box">
    <h2>Do you really want to log out?</h2>
    <div class="confirmation-buttons">
        <form method="post" action="/logout">
        <button class="logout-button" type="submit">Log out</button>
        </form>
        <a href="/"><button class="cancel-button" >Cancel</button></a>
    </div>
</div>

</body>
</html>

