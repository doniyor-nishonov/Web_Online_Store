<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.web_online_store.entity.store.Store" %>
<%@ page import="com.pdp.web_online_store.entity.store.Store" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css">
    <style>
        /* General styles */
        body, h1, h2, h3, ul, li, form, input, button, table, th, td {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            animation: fadeIn 1s ease-in;
        }

        header {
            background-color: lightblue;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header .logo {
            font-size: 24px;
            font-weight: bold;
        }

        header nav ul {
            display: flex;
            list-style: none;
        }

        header nav ul li {
            margin-left: 20px;
        }

        header nav ul li a {
            text-decoration: none;
            color: #333;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #fff;
        }

        main {
            display: flex;
            flex-direction: column;
            flex: 1;
            padding: 20px;
        }

        .manage-users {
            margin-bottom: 40px;
        }

        .manage-users h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .manage-users form {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .manage-users input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
            flex: 1;
        }

        .manage-users button {
            padding: 10px 20px;
            border: none;
            background-color: lightblue;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .manage-users button:hover {
            background-color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-buttons form {
            margin: 0;
        }

        .action-buttons button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            z-index: 1; /* Ensure buttons are on top */
        }

        .activate {
            background-color: #4caf50; /* Green */
            color: #fff;
            animation: bounceIn 1s;
        }

        .deactivate {
            background-color: #ff4500; /* Fire color */
            color: #fff;
            animation: bounceIn 1s;
        }

        .delete {
            background-color: #f44336; /* Red */
            color: #fff;
            animation: bounceIn 1s;
        }

        .action-buttons button:hover {
            background-color: #333;
        }

        footer {
            padding: 20px;
            text-align: center;
            background-color: #333;
            color: #fff;
        }

        /* Add animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes bounceInLeft {
            from {
                opacity: 0;
                transform: translate3d(-3000px, 0, 0);
            }
            60% {
                opacity: 1;
                transform: translate3d(25px, 0, 0);
            }
            75% {
                transform: translate3d(-10px, 0, 0);
            }
            90% {
                transform: translate3d(5px, 0, 0);
            }
            to {
                transform: none;
            }
        }

        body {
            animation: fadeIn 1s ease-in;
        }

        .animate__fadeInDown {
            animation: fadeInDown 1s;
        }

        .animate__bounceInLeft {
            animation: bounceInLeft 1s;
        }

        .animate__bounceIn {
            animation: bounceIn 1s;
        }

        .animate__fadeInUp {
            animation: fadeInUp 1s;
        }

        .animate__fadeIn {
            animation: fadeIn 1s;
        }
    </style>
</head>
<body>
<header class="animate__animated animate__fadeInDown">
    <div class="logo">Online Shop - Admin</div>
    <nav>
        <ul class="animate__animated animate__fadeInDown">
            <li><a href="${pageContext.request.contextPath}/">Main menu</a></li>
        </ul>
    </nav>
</header>
<main>

    <section class="manage-users animate__animated animate__fadeIn">
        <h1 class="animate__animated animate__bounceInLeft">Magazine Management</h1>
        <form action="${pageContext.request.contextPath}/admin/manageMagazine" method="GET">
            <input type="text" name="store" placeholder="Search users by name or email...">
            <button type="submit" class="button-block animate__animated animate__bounceIn">Search</button>
        </form>
        <table class="animate__animated animate__fadeInUp">
            <thead>
            <tr>
                <th>N</th>
                <th>Name</th>
                <th>Owner</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    @SuppressWarnings("unchecked")
                    List<Store> stores = (List<Store>) request.getAttribute("stores");
                    int i = 1;
                    if (stores != null) {
                        for (Store store : stores) {
                            System.out.println(store.getAddress().getCity());
            %>
            <tr class="animate__animated animate__fadeIn">
                <td><%= i++ %>
                </td>
                <td><%= store.getName()%></td>
                <td><%=store.getUsers().getFullName()%></td>
                <td><%=store.getAddress().getCity()%></td>

                <td class="action-buttons">
                    <% if (store.getStatus().equals(Store.Status.INACTIVE)) { %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageMagazine">
                        <input type="hidden" name="magazineID" value="<%= store.getId() %>">
                        <input type="hidden" name="action" value="ACTIVE">
                        <button type="submit" class="activate">Activate</button>
                    </form>
                    <% } else { %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageMagazine">
                        <input type="hidden" name="magazineID" value="<%= store.getId() %>">
                        <input type="hidden" name="action" value="INACTIVE">
                        <button type="submit" class="deactivate">Deactivate</button>
                    </form>
                    <% } %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageMagazine">
                        <input type="hidden" name="magazineID" value="<%= store.getId() %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" class="delete" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>

            </tr>
            <%
                        }
                    }
                } catch (NullPointerException ignored) {
                }
            %>

            </tbody>
        </table>
    </section>

    <section class="manage-users animate__animated animate__fadeIn">
        <h1 class="animate__animated animate__bounceInLeft">User Management</h1>
        <form action="${pageContext.request.contextPath}/admin/manageUsers" method="GET">
            <input type="text" name="user" placeholder="Search users by name or email...">
            <button type="submit" class="button-block animate__animated animate__bounceIn">Search</button>
        </form>
        <table class="animate__animated animate__fadeInUp">
            <thead>
            <tr>
                <th>N</th>
                <th>Name</th>
                <th>Email</th>
                <th>Status</th>
                <th>Role</th>
                <th>Role Action</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    @SuppressWarnings("unchecked")
                    List<Users> users = (List<Users>) request.getAttribute("users");
                    int i = 1;
                    if (users != null) {
                        for (Users user : users) {
            %>
            <tr class="animate__animated animate__fadeIn">
                <td><%= i++ %>
                </td>
                <td><%= user.getFullName() %>
                </td>
                <td><%= user.getEmail() %>
                </td>
                <td><%= user.getStatus() %>
                </td>
                <td><%= user.getRole() %>
                </td>

                <td>
                    <form action="${pageContext.request.contextPath}/admin/manageUsers" method="POST">
                        <select name="role" onchange="this.form.submit()">
                            <option value="USER" <%= "user".equals(user.getRole()) ? "selected" : "" %>>User</option>
                            <option value="ADMIN" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
                            <option value="SELLER" <%= "seller".equals(user.getRole()) ? "selected" : "" %>>Seller</option>
                        </select>
                        <input type="hidden" name="userID" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="role">
                    </form>
                </td>
                <td class="action-buttons">
                    <% if (user.getStatus().equals(Users.Status.BLOCKED)) { %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageUsers">
                        <input type="hidden" name="userID" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="active">
                        <button type="submit" class="activate">Activate</button>
                    </form>
                    <% } else { %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageUsers">
                        <input type="hidden" name="userID" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="deActive">
                        <button type="submit" class="deactivate">Deactivate</button>
                    </form>
                    <% } %>
                    <form method="post" action="${pageContext.request.contextPath}/admin/manageUsers">
                        <input type="hidden" name="userID" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" class="delete" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                        }
                    }
                } catch (NullPointerException ignored) {
                }
            %>

            </tbody>
        </table>
    </section>
</main>
<footer class="animate__animated animate__fadeInUp">
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>
</body>
</html>
