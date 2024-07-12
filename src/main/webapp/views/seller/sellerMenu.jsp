<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="../../resources/css/sellerMenu.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js">
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        .particles-background {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: -1;
            top: 0;
            left: 0;
        }
    </style>
</head>
<body>
<div id="particles-js" class="particles-background"></div>

<header class="animate__animated animate__fadeInDown">
    <div class="logo">Online Shop - Seller</div>
    <nav>
        <ul class="animate__animated animate__fadeInDown">
            <li><a href="${pageContext.request.contextPath}/">Main menu</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/menu">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createMagazine">Create Magazine</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/createProduct">Create Product</a></li>
            <li><a href="${pageContext.request.contextPath}/seller/showProduct">Show Products</a></li>
        </ul>
    </nav>
</header>

<main>
    <section class="welcome animate__animated animate__fadeInUp">
        <h1>Welcome, Seller</h1>
        <p>Use the menu to manage your products and magazines.</p>
    </section>
</main>

<footer class="animate__animated animate__fadeInUp">
    <p>&copy; 2024 Online Shop. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
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
