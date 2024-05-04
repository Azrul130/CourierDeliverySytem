<%-- 
    Document   : viewOrder
    Created on : 20 May 2023, 7:33:20 pm
    Author     : Azrul Hafizam
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="jakarta.servlet.ServletContext" %>

<!DOCTYPE html>
<html>
    <head>
        <title>View Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        
        <br><!-- comment -->
        <div class="row">
            <div class="container">
                 <div class="card-body col-md-6">
                <h3  class="text-center">Order Details </h3>
                    
                <br><!-- comment -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tracking Number</th>
                            <th>Customer Id</th>
                            <th>Recipient Name</th>
                            <th>Recipient Address</th>
                            <th>Weight</th>
                            <th>Description</th>
                            <th>Parcel Type</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    
                    
                 
                    <tbody>
                         <tr>
                                <td>
                                    WDRE35
                                  
                                </td>
                                <td>
                                    C10974
                                    
                                </td>
                                <td>
                                    Chong
                                  
                                </td>
                                <td>
                                    Lot 1342, Kg Bahagia 17000 Pasir Mas, Kelantan
                                 
                                </td>
                                <td>
                                    2.00
                                    
                                </td>
                                <td>
                                    Fragile
                                    
                                </td>
                                <td>
                                    local
                                   
                                </td>
                                <td>
                                    Your parcel is out for delivery
                                
                                </td>
                                <td>
                                    <button>Update</button>&nbsp;
                                    <button> Delete</button>
                                       
                                </td>
                            </tr>
                      <%--   <c:forEach var="order" items="${listOrder}">
                              <tr>
                                <td>
                                    <c:out value="${order.ParcelId}" />
                                </td>
                                <td>
                                    <c:out value="${order.CustId}" />
                                </td>
                                <td>
                                    <c:out value="${order.recipientName}" />
                                </td>
                                <td>
                                    <c:out value="${order.recipientAddress}" />
                                </td>
                                <td>
                                    <c:out value="${order.weight}" />
                                </td>
                                <td>
                                    <c:out value="${order.description}" />
                                </td>
                                <td>
                                    <c:out value="${order.parcelType}" />
                                </td>
                                <td>
                                 <c:out value="${parcel.status}" />
                                </td>
                                <td>
                                    <a href="deleteorder?ParcelId=<c:out value="${order.ParcelId}" />">Delete</a>
                                    
                                </td>
                            </tr>
                        </c:forEach>

--%>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="footer.html" flush="true" />
    </body>
</html>

