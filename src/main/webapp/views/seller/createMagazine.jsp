<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Magazine</title>
    <link rel="stylesheet" href="../../resources/css/createMagazine.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<header class="animate__animated animate__fadeInDown">
    <div class="logo">Online Shop - Seller</div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Main menu</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/menu">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createMagazine">Create Magazine</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createProduct">Create Product</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/showProduct">Show Products</a></li>
        </ul>
    </nav>
</header>
<main class="animate__animated animate__fadeInUp">
    <section class="create-form">
        <h1 class="animate__animated animate__zoomIn">Create Magazine</h1>
        <form action="${pageContext.request.contextPath}/seller/createMagazine" method="POST" class="animate__animated animate__fadeIn">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit" class="animate__animated animate__pulse animate__infinite">Create Magazine</button>
        </form>
    </section>
</main>
</body>
</html>
