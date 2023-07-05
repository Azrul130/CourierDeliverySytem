<%-- 
    Document        : index
    Created on      : 4 Apr 2023, 11:01:03 am
    Author          : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
    Last Updated on : 16 May 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Courier Delivery System</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous"/>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body>

        <jsp:include page="header.jsp" flush="true" />


        <main class="flex-shrink-0">
            <header class="bg-light text-center py-5">
                <h1>Welcome to the Courier Delivery System</h1>
                <p class="lead">Efficient and reliable delivery services at your doorstep</p>
                <a class="btn btn-primary btn-lg" href="Registration.jsp" role="button">Get Started</a>
            </header>

            <section class="container my-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <h2 id="about">Our Services</h2>
                            <p>We Provide fast, efficient, and most importantly Secured courier service throughout Malaysia.</p>
                            <a class="btn btn-info " style="width: 200px;" href="contact" role="button">Learn More</a>
                        </div>
                        <br/>
                        <div class="row">
                            <h2 id="About">About</h2>
                            <p>The best fastest Courier delivery. We offer the most efficient and secured Delivery.</p>
                        </div>
                        <div class="row">
                            <h2 id="Contact">Contact</h2>
                            <p><span id="contact" class="material-symbols-outlined" style="font-size: 12px;">
                                    Call 011-4032-1539 - Muhammad Fauzul Azim Bin Imran Hayat<br><br><br><!-- comment -->
                                    Whatsapp : <img src="images/pngtree-whatsapp-mobile-software-icon-png-image_6315991.png" width="15px">
                                                    <a href="https://wa.link/0uf5bc/">011-4032 1539</a>
                                </span></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img src="images/img-who-we-are.jpg" alt="Delivery" class="img-fluid">
                    </div>
                </div>
            </section>

        </main>

        <jsp:include page="footer.html" flush="true" />

        
    </body>
</html>