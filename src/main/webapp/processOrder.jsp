<%-- 
    Document   : processOrder
    Created on : 23 May 2023, 1:52:00 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Overview</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body> 
        <jsp:useBean id="myOrder" class="com.mycompany.courierdeliverysystem.model.Order" scope="session"/>

        <%
   %>
        
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
