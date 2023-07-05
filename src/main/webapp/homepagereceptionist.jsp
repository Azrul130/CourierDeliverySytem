<%-- 
    Document   : homepagereceptionist
    Created on : 5 Jul 2023, 00:42:46
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="emp" class="com.mycompany.courierdeliverysystem.model.Employee" scope="request"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page Receptionist</title>
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
        <%
            //get values
            String username = (String) session.getAttribute("user");

            ResultSet rs = null;
            PreparedStatement st = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");

            st = con.prepareStatement("SELECT * FROM employee where EmployeeId=?");
            st.setString(1, username);
            rs = st.executeQuery();
        %>
        <h1>Welcome <%=username%></h1>
        <div class="container">
            <div class="card">
                <div class="card-body col-md-6">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Employee Id</th>
                                <th>Name</th>
                                <th>Phone No</th>
                                <th>Email</th>
                                <th>Occupation</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <%while (rs.next()) {%>

                                <td><%=rs.getString("EmployeeId")%></td>
                                <td><%=rs.getString("Name")%></td>
                                <td><%=rs.getString("phoneNo")%></td>
                                <td><%=rs.getString("email")%></td>
                                <td><%=rs.getString("Occupation")%></td>
                                <td>
                                    <a href="edit?empId=${emp.employeeId}" class="btn btn-warning">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="assignparcel.jsp" class="btn btn-warning">Assign Parcel</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>

