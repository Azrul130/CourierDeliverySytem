<%-- 
    Document   : AdminManagement
    Created on : 22 May 2023, 3:58:32 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.courierdeliverysystem.model.Employee" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous"><!-- Bootstrap -->
        <style>
            .container-s {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin: 10px;
                <%-- test --%>
            }
            footer{
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
            }
            .btn-c{
                width: 150px;
            }
        </style>
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />
        <div class="container">
            <div class="container container-s text-center">
                <h1>Welcome Back <span style="color: #3366ff;"><%= ((Employee) session.getAttribute("emp")).getName() %></span> !</h1>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col container-s text-center">
                        <h2>Customer Management</h2>
                        <a href="CustomerController?action=listCust" class="btn-primary btn btn-c">Go</a>
                    </div>
                    <div class="col container-s text-center">
                        <h2>Employee Management</h2>
                        <a href="emp/list" class="btn-primary btn btn-c">Go</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col container-s text-center">
                        <h2>Rider Management</h2>
                        <a href="rider/list" class="btn-primary btn btn-c">Go</a>
                    </div>
                    <div class="col container-s text-center">
                        <h2>Vehicle Management</h2>
                        <a href="vehicle/list" class="btn-primary btn btn-c">Go</a>
                    </div>
                </div>

            </div>
            <jsp:include flush="true" page="footer.html" />

            
    </body>
</html>
