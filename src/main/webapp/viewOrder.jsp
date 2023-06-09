<%-- 
    Document   : viewOrder
    Created on : 20 May 2023, 7:33:20 pm
    Author     : Azrul Hafizam
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
        <div class="row">
            <div class="container">
                <h3  class="text-center">Order Details</h3>
                <br><!-- comment -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Recipient Name</th>
                            <th>Recipient Address</th>
                            <th>Weight</th>
                            <th>Parcel Type</th>
                            <th>Tracking Number</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${listOrder}">
                            <tr>
                                <td>
                                    <c:out value="${order.orderid}" />
                                </td>
                                <td>
                                    <c:out value="${order.recipientname}" />
                                </td>
                                <td>
                                    <c:out value="${order.recipientaddress}" />
                                </td>
                                <td>
                                    <c:out value="${order.weight}" />
                                </td>
                                <td>
                                    <c:out value="${order.parceltype}" />
                                </td>

                            </c:forEach>

                            <c:forEach var="parcel" items="${listOrder}">
                                <td>
                                    <c:out value="${parcel.trackingnumber}" />
                                </td>
                                <td>
                                    <c:out value="${parcel.status}" />
                                </td>
                            </c:forEach>

                            <c:forEach var="order" items="${listOrder}">
                                <td>
                                    <a href="edit?carid=<c:out value="${carpricelist.carid}" />">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete?carid=<c:out value="${carpricelist.carid}" />">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>

                <jsp:include page="footer.html" flush="true" />
    </body>
</html>

