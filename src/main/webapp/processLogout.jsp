<%-- 
    Document   : processLogout
    Created on : 2 Jul 2023, 9:08:50 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogOut</title>
    </head>
    <body>
        <%
            session.setAttribute("user", null);
            response.sendRedirect("http://localhost:8080/courierdeliverysystem/");
        %>
    </body>
</html>
