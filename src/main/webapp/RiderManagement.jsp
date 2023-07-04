<%-- 
    Document   : RiderManagement
    Created on : 5 Jul 2023, 3:41:44 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rider Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />
        <div class="container">
            <div class="card">
                
                <div class="card-body col-md-6">
                    <table class="table table-bordered">
                        <a href="addform">Add new Rider</a>
                    <thead>
                        <tr>
                            <th>Rider Id</th>
                            <th>Employee Id</th>
                            <th>Vehicle Id</th>
                            <th>Licence Expiration Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="rider" items="${listRider}">
                            <tr>
                                <td>
                                    <c:out value="${rider.riderId}"/>
                                </td>                               
                                <td>
                                    <c:out value="${rider.employeeId}"/>
                                </td>
                                <td>
                                    <c:out value="${rider.vehicleID}"/>
                                </td>
                                <td>
                                    <c:out value="${rider.licenceExp}"/>
                                </td>
                                
                                <td><a href="edit?riderId=${rider.riderId}" class="btn btn-warning">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;<!-- comment -->
                                    <a href="delete?riderId=${rider.riderId}" class="btn btn-secondary">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
        
    </body>
</html>
