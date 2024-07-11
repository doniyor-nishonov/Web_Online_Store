<%@ page import="java.util.Objects" %>
<nav>
    <ul>
        <li><a href="/products">Products</a></li>
        <li><a href="/seller/menu">Seller</a></li>
        <li><a href="/admin/home">Admin</a></li>
        <li><a href="/profile">Profile</a></li>
        <%
            String userID = (String) session.getAttribute("userID");
            if (Objects.isNull(userID)) {
        %>
        <li><a href="/register" class="register"  style="color: white; background-color: green; padding: 10px 20px; text-decoration: none;">Register</a></li>
        <%} else {%>
        <li><a href="/logout"
               style="color: white; background-color: black; padding: 10px 20px; text-decoration: none;">Log
            out</a></li>
        <%}%>
    </ul>
</nav>