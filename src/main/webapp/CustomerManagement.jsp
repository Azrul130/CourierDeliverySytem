<%-- 
    Document   : CustomerManagement
    Created on : 22 May 2023, 4:38:46 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            .container-s {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin: 10px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />

        <div class="container container-s text-center">
            <h1><strong>Customer Management</strong></h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Customer Id</th>
                        <th scope="col">Username</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone No</th>
                        <th scope="col">Email</th>

                    </tr>
                </thead>
                <tbody>
                    <% int count = 1; %>
                    <c:forEach items="${cust}" var="cust">
                        <tr>
                            <th scope="row"><%=count%></th>
                                <% count++; %>
                            <td><c:out value="${cust.custId}"/></td>
                            <td><c:out value="${cust.username}"/></td>
                            <td><c:out value="${cust.name}"/></td>
                            <td><c:out value="${cust.phone}"/></td>
                            <td><c:out value="${cust.email}"/></td>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <a href="http://localhost:8080/courierdeliverysystem/AdminManagement.jsp" class="btn btn-primary">DashBoard</a>
        </div>

        <jsp:include flush="true" page="footer.html" />
    </body>
</html>
