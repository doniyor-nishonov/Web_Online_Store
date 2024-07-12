<%@ page import="com.pdp.web_online_store.entity.user.Users" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="../../resources/css/adminPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #3e4bd5, #338ccc);
            overflow: hidden;
        }

        canvas {
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .button-block, .button-delete {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .button-block {
            background-color: #ffcc00;
            color: #333;
        }

        .button-delete {
            background-color: #ff4444;
            color: #fff;
        }

        .button-block:hover {
            background-color: #ffdd33;
            transform: scale(1.05);
        }

        .button-delete:hover {
            background-color: #ff6666;
            transform: scale(1.05);
        }

        .button-block:focus, .button-delete:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body>
<header class="animate__animated animate__fadeInDown">
    <div class="logo">Online Shop - Admin</div>
    <nav>
        <ul class="animate__animated animate__fadeInDown">
            <li><a href="${pageContext.request.contextPath}/">Main menu</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/createSeller">Create Seller</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/manageUsers">Manage Users</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="manage-users animate__animated animate__fadeIn">
        <h1 class="animate__animated animate__bounceInLeft">Manage Users</h1>
        <form class="search-form animate__animated animate__slideInRight"
              action="${pageContext.request.contextPath}/admin/manageUsers" method="GET">
            <input type="text" name="query" placeholder="Search users by name or email...">
            <button type="submit">Search</button>
        </form>
        <table class="animate__animated animate__fadeInUp">
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
            <%
                try {
                    @SuppressWarnings("unchecked")
                    List<Users> users = (List<Users>) request.getAttribute("users");
                    int i = 1;
                    if (users != null) {
                        for (Users user : users) {
            %>
            <tr class="animate__animated animate__fadeIn">
                <td><%= i++ %></td>
                <td><%= user.getFullName() %></td>
                <td><%= user.getEmail() %></td>
                <td>
                    <form action="${pageContext.request.contextPath}/admin/changeUserRole" method="POST">
                        <select name="role" onchange="this.form.submit()">
                            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>User</option>
                            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
                            <option value="seller" <%= "seller".equals(user.getRole()) ? "selected" : "" %>>Seller</option>
                        </select>
                        <input type="hidden" name="userId" value="<%= user.getId() %>">
                    </form>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/activate?userID=<%= user.getId() %>" class="button-block animate__animated animate__bounceIn">Active</a>
                    <a href="${pageContext.request.contextPath}/admin/deleteUser?userID=<%= user.getId() %>" class="button-delete animate__animated animate__bounceIn" onclick="return confirm('Are you sure?')">Delete</a>
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

<!-- Particles.js library -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>
<script>
    particlesJS("particles-js", {
        "particles": {
            "number": {
                "value": 80,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 3,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 40,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#ffffff",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 6,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "repulse"
                },
                "onclick": {
                    "enable": true,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 400,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 400,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 200,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    });
</script>

</body>
</html>
