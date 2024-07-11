<%@ page import="java.util.Objects" %>
<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<nav>
    <ul>
        <li><a href="/products">Products</a></li>
        <%
            String role = (String) session.getAttribute("role");
            if (Objects.equals("SELLER", role)) {%>
        <li><a href="/seller/menu">Seller</a></li>
        <%
            }
            if (Objects.equals("ADMIN", role))
            {
        %>
        <li><a href="/admin/home">Admin</a></li>
        <%}%>
        <li><a href="/profile">Profile</a></li>
        <%
            String userID = (String) session.getAttribute("userID");
            if (Objects.isNull(userID)) {
        %>
        <li><a href="/register" class="register"
               style="color: white; background-color: green; padding: 10px 20px; text-decoration: none;">Register</a>
        </li>
        <%} else {%>
        <li><a href="/logout"
               style="color: white; background-color: black; padding: 10px 20px; text-decoration: none;">Log
            out</a></li>
        <%}%>
    </ul>
</nav>