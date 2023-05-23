<%-- 
    Document   : header
    Created on : 19 May 2023, 4:49:46 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            main {
                flex: 1;
            }

            .custom-navbar {
                background-color: rgb(230, 0, 0);
            }

            .custom-navbar .navbar-nav .nav-link,
            .custom-navbar .navbar-nav .nav-item {
                color: white;
            }

            .custom-navbar .navbar-nav .nav-link:focus,
            .custom-navbar .navbar-nav .nav-link:hover,
            .custom-navbar .navbar-nav .nav-item:focus,
            .custom-navbar .navbar-nav .nav-item:hover {
                color: white;
            }

            footer {
                margin-top: auto;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="images/delivery-service-icon-6.jpg" alt="" width="35" height="35" class="d-inline-block ">Courier Delivery System</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="serviceDropdown"
                               role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Services</a>
                            <div class="dropdown-menu" aria-labelledby="serviceDropdown">

                                <a class="dropdown-item" href="order.jsp">Create Order</a>
                                <a class="dropdown-item" href="viewOrder.jsp">View Order</a>


                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" 
                               role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Account
                            </a>
                            <div class="dropdown-menu" aria-labelledby="accountDropdown">
                                <c:choose>
                                    <c:when test="${empty sessionScope.user}">
                                        <a class="dropdown-item" href="Login.jsp">Sign In</a>
                                        <a class="dropdown-item" href="Registration.jsp">Sign Up</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="dropdown-item" href="#">Logout</a>
                                        <a class="dropdown-item" href="#">Settings</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
        crossorigin="anonymous"></script>
    </body>
</html>
