<%@ page import="java.util.Objects" %>
<nav>
    <ul>
        <li><a href="/products">Products</a></li>
        <li><a href="/">About</a></li>
        <li><a href="/profile">Profile</a></li>
        <%
            String userID = (String) session.getAttribute("userID");
            if (Objects.isNull(userID)) {
        %>
        <li><a href="/register" class="register">Register</a></li>
        <%} else {%>
        <li><a href="/logOut"
               style="color: white; background-color: black; padding: 10px 20px; text-decoration: none;">Log
            out</a></li>
        <%}%>
    </ul>
</nav>