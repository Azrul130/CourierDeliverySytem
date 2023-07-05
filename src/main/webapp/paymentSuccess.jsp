<%-- 
    Document   : paymentSuccess
    Created on : 4 Jul 2023, 5:31:05 pm
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:include page="header.jsp" flush="true" />
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <h1>Payment Successful !!!!!</h1>
                    <br><!-- comment -->
                    <button><a href="order.jsp">Create New Order</a></button>
                    <button><a href="index.jsp">Back</a></button>

                </div>
            </div>
        </div>
    </body>
</html>
