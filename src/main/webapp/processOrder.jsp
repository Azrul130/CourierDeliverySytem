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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="java.sql.*" %>

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
        <jsp:useBean id="od" class="com.mycompany.courierdeliverysystem.model.Order" scope="session"/>

        <%
            String custid = ((Customer) session.getAttribute("cust")).getCustId();
                String Query = "SELECT * FROM courierdeliverysystem.order where CustId='"+(((Customer) session.getAttribute("cust")).getCustId())+"'";
                PreparedStatement ps = con.prepareStatement(Query);

                ps.setString(1, custid );

                ResultSet rs = ps.executeQuery();

                while (rs.next() ){
                    od.setParcelId(rs.getString(1));
                    od.setCustId(rs.getString(2));
                    od.setRecipientName(rs.getString(3));
                    od.setRecipientAddress(rs.getString(4));
                    od.setWeight(rs.getDouble(5));
                    od.setDescription(rs.getString(6));
                    od.setParcelType(rs.getString(7));
            }
                    session.setAttribute("user", od);
                    response.sendRedirect("payment.jsp");
        %>

        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
