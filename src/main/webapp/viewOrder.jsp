<%-- 
    Document   : viewOrder
    Created on : 20 May 2023, 7:33:20 pm
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Courier.com.Order" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Order</title>
</head>
<body>
    <h1>Order Details</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Delivery Address</th>
            <th>Status</th>
        </tr>
        
        <% /*
            // Assuming you have a list of orders retrieved from the database
            List<Order> orders = getOrderListFromDatabase();
            
            // Iterate over the list of orders and display the details in the table
            for (Order order : orders) {
        %>
        
        <tr>
            <td><%= order.getId() %></td>
            <td><%= order.getCustomerName() %></td>
            <td><%= order.getDeliveryAddress() %></td>
            <td><%= order.getStatus() %></td>
        </tr>
        <% /*
            }
        %>
    </table>
    
</body>
</html>

