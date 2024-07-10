<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="../../resources/css/adminPage.css">
</head>
<body>
<header>
    <div class="logo">Online Shop - Admin</div>
    <nav>
        <ul>
            <li><a href="/admin/home">Home</a></li>
            <li><a href="/admin/createSeller">Create Seller</a></li>
            <li><a href="/admin/manageUsers">Manage Users</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="manage-users">
        <h1>Manage Users</h1>
        <form class="search-form" action="/admin/searchUsers" method="GET">
            <input type="text" name="query" placeholder="Search users by name or email...">
            <button type="submit">Search</button>
        </form>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>
                        <form action="/admin/changeUserRole" method="POST">
                            <select name="role" onchange="this.form.submit()">
                                <option value="user" <c:if test="${user.role == 'user'}">selected</c:if>>User</option>
                                <option value="admin" <c:if test="${user.role == 'admin'}">selected</c:if>>Admin</option>
                                <option value="seller" <c:if test="${user.role == 'seller'}">selected</c:if>>Seller</option>
                            </select>
                            <input type="hidden" name="userId" value="${user.id}">
                        </form>
                    </td>
                    <td>
                        <a href="/admin/blockUser?userID=${user.id}">Block</a>
                        <a href="/admin/deleteUser?userID=${user.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>
<footer>
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>