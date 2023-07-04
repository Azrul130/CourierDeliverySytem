<%-- 
    Document   : VehicleManagement
    Created on : 5 Jul 2023, 3:41:58 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Management</title>
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
                    <thead>
                        <tr>
                            <th>Vehicle Id</th>
                            <th>Vehicle Type</th>
                            <th>Road Tax Expiry Date</th>
                            <th>Picture</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="veh" items="${listVeh}">
                            <tr>
                                <td>
                                    <c:out value="${veh.VehicleId}"/>
                                </td>                               
                                <td>
                                    <c:out value="${veh.vehicletype}"/>
                                </td>
                                <td>
                                    <c:out value="${veh.roadtaxexp}"/>
                                </td>
                                <td>
                                    <c:set var="base64Picture" value="${veh.getBase64Picture()}"/>
                                    <c:if test="${not empty base64Picture}">
                                        <img src="data:image/png;base64,${base64Picture}" width="100" height="100" />
                                    </c:if>
                                </td>
                                <td><a href="edit?vehId=${veh.vehicleID}" class="btn btn-warning">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;<!-- comment -->
                                    <a href="delete?vehId=${veh.vehicleID}" class="btn btn-secondary">Delete</a>
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
