<%-- 
    Document   : RiderEdit
    Created on : 5 Jul 2023, 7:09:49 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Rider Form</title>
        <!-- Add any necessary CSS styles or external libraries -->
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- Page Content -->
        <div class="page-content">
            <h3>Rider Information</h3>
            <hr>
            <div class="container my-4">
                <div class="card my-4">
                    <div class="card-body">
                        <h3 class="card-title">Rider Form</h3>
                        <form action="update" method="post">
                            <input type="hidden" name="id" value="${rider.riderId}" />
                            <label for="employeeId" class="form-label">Employee ID</label>
                            <input type="text" class="form-control" value="${rider.employeeId}" readonly />
                            <select id="employeeId" class="form-select" name="employeeId" required>

                                <c:forEach items="${employeeList}" var="employee">
                                    <option value="${employee.employeeId}">${employee.employeeId}</option>
                                </c:forEach>
                            </select>
                            <div class="form-group">
                                <label for="vehicleId" class="form-label">Vehicle ID</label>
                                <input type="text" class="form-control" value="${rider.vehicleID}" readonly />
                                <select id="vehicleId" class="form-select" name="vehicleId" required>

                                    <c:forEach items="${vehicleList}" var="vehicle">
                                        <option value="${vehicle.vehicleId}">${vehicle.vehicleId}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="licenceExp" class="form-label">Licence Expiry Date</label>
                                <input type="text" class="form-control" value="${rider.licenceExp}" readonly />
                                <input type="text" id="licenceExp" class="form-control" name="licenceExp" pattern="\d{2}/\d{2}/\d{2}" required>
                                <small>Format: DD/MM/YY</small>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add any necessary JavaScript scripts or external libraries -->
    </body>
</html>
