<%-- 
    Document   : CustMain
    Created on : 23 May 2023, 12:48:08 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.courierdeliverysystem.model.Customer" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Employee" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />

        <main class="flex-shrink-0">
            <header class="bg-light text-center py-5">
                <h1>Welcome to the Courier Delivery System <%= ((Customer) session.getAttribute("cust")).getName() %></h1>
                <p class="lead">Efficient and reliable delivery services at your doorstep</p>
                <a class="btn btn-primary btn-lg" href="#" role="button">Get Started</a>
            </header>

            <section class="container my-5">
                <div class="row">
                    <div class="col-md-6">
                        <h2>Our Services</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet faucibus l
                            uctus. Curabitur volutpat metus non tellus luctus dapibus.</p>
                        <a class="btn btn-secondary" href="#" role="button">Learn More</a>
                    </div>
                    <div class="col-md-6">
                        <img src="delivery.jpg" alt="Delivery" class="img-fluid">
                    </div>
                </div>
            </section>

        </main>

        <jsp:include flush="true" page="footer.html" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
        integrity="sha384-"></script>
    </body>
</html>
