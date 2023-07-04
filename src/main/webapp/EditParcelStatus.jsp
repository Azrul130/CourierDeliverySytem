<%-- 
    Document   : EditParcelStatus
    Created on : 4 Jul 2023, 21:32:12
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Parcel Status</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: rgb(121, 252, 252);
            }
            h1{
                text-align: center;
            }
            label{
                display: inline-block;
                font-family: comic sans ms;
                padding-left: 10px;
                width: 25%;
            }
            h1 {
                color: #333;
                font-family: comic sans ms;
            }

            .form-container {
                margin: auto;
                background-color: bisque;
                padding: 20px;
                border: 3px solid #24252a;
                width: 30%;
            }
            .form-container input[type="text"]{
                width: 60%;
                padding: 5px;
            }
            .form-container input[type="submit"]{
                margin-left: 35%;
            }
            .form-container input[type="submit"],
            .form-container input[type="button"] {

                padding: 5px 15px;
                background-color: #555;
                color: #fff;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%--<jsp:include flush="true" page="header.jsp" />--%>
        <h1>Edit Parcel Status [<%=request.getParameter("ParcelId")%>]</h1>

        <div class="form-container">
            <form method="POST" action="">
                <label for="parcelid">Parcel ID:</label>
                <input type="text" id="parcelid" name="parcelid" value="<%= request.getParameter("ParcelId")%>">
                <br><br>
                <label for="location">Current Location:</label>
                <input type="text" id="location" name="location" value="<%= request.getParameter("Location")%>">
                <br><br>
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" value="<%= request.getParameter("status")%>">
                <br><br>
                <input type="submit" value="Update Status">
                <input type="button" value="Cancel" onclick="location.href = 'updateparcel.jsp'">
            </form>
        </div>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    String parcelid = request.getParameter("parcelid");
                    String location = request.getParameter("location");
                    String status = request.getParameter("status");

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");
                    pstmt = con.prepareStatement("UPDATE status SET Location=?, status=? WHERE ParcelId=?");
                    pstmt.setString(1, location);
                    pstmt.setString(2, status);
                    pstmt.setString(3, parcelid);
                    pstmt.executeUpdate();

                    response.sendRedirect("updateparcel.jsp"); // Redirect to the previous page after updating

                } catch (Exception e) {
                    // Handle exceptions
                } finally {
                    // Close connections
                    try {
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        // Handle exceptions
                    }
                }
            }
        %>

        <%--<jsp:include flush="true" page="footer.html" />--%>
    </body>
</html>

