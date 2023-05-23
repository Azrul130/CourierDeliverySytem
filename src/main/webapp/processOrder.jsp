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
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Overview</title>
        <link rel="stylesheet" type="text/css" href="Style/orderStyle.css">
    </head>
    <body> 
        <jsp:useBean id="myOrder" class="Courier.com.Order" scope="request"/>
        <jsp:setProperty name="myOrder" property="*"/>
        
        <%
        int result;
        
        Class.forName("com.mysql.jdbc.Driver");
        
       
        String myURL = "jdbc:mysql://localhost:3306/courierdeliverysystem";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
        
        
        //create preparedStatement ocject
             
        //prepared sql query as a string
        String sInsertQry = "INSERT INTO order(ParcelId, weight, Description, recipientName, recipientAddress) VALUES(?, ?, ?, ?, ?)";
        //call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
        
        //Assign each value to respective colums for student's table...(C-Create)
               
        myPS.setString(1, myOrder.getParcelId());
        myPS.setString(2, myOrder.getWeight());
        myPS.setString(3, myOrder.getDescription() );
        myPS.setString(4, myOrder.getRecipientName() );
        myPS.setString(5, myOrder.getRecipientAddress() );
        
 
        result = myPS.executeUpdate();
                 
        if (result > 0){
        out.println("<h3>Order successfully created !!!</h3><br>");
        out.print("<br>");
        out.print("<fieldset>");
        out.print("<br>");
        out.print("<h2>" + "Order Overview " + "</h2>");
        out.print("<p>" + "ParcelId          : " + myOrder.getParcelId() + "</p>");
        out.print("<p>" + "Recipient Name    : " + myOrder.getRecipientName() + "</p>");
        out.print("<p>" + "Recipient Address : " + myOrder.getRecipientAddress() + "</p>");
        out.print("<p>" + "Weight            : " + myOrder.getWeight() + "</p>");  
        out.print("<p>" + "Description       : " + myOrder.getDescription() + "</p>");  
        out.print("<br>");
        out.print("</fieldset>");
            }
            
      
            
        out.println("Step5 : Close database connection...!");
        myConnection.close();
        out.println(" ");
        out.println("Database connection is closed...!");     
        %>

    </body>
</html>
