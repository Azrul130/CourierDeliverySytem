<%-- 
    Document   : updateparcel
    Created on : 23 May 2023, 14:09:34
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcel Status</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: rgb(121, 252, 252);
            }

            h1 {
                color: #333;
                font-family: comic sans ms;
            }

            .form-container {
                margin-left: 5%;
                background-color: bisque;
                width: 20%;
                padding: 5px;
            }

            .form-container label {
                display: inline-block;
                margin-bottom:auto;
                font-family: comic sans ms;
            }

            .form-container input[type="text"] {
                padding: 5px;
                width: 200px;
            }

            .form-container input[type="submit"] {
                padding: 5px 15px;
                background-color: #555;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            table {
                width: 90%;
                margin: auto;
                place-items: center;

            }
            thead{
                background-color: #f56e6e;
            }
            tbody{
                background-color: white;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />
        <h1>Update Parcel Status</h1>

        <div class="form-container">
            <form method="POST" action="">
                <label for="parcelidsearch">Enter Parcel ID:</label>
                <input type="text" id="parcelidsearch" name="parcelidsearch">
                <input type="submit" value="Search parcel">
            </form>
        </div><br><br>

        <table>
            <thead>
                <tr>
                    <th>Parcel ID</th>
                    <th>Current Location</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String parcelid = request.getParameter("parcelidsearch");
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");

                        if (parcelid == null || parcelid.isEmpty()) {
                            pstmt = con.prepareStatement("SELECT * FROM status");
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("ParcelId")%></td>
                    <td><%=rs.getString("Location")%></td>
                    <td><%=rs.getString("status")%></td>
                    <td>
                        <button class="update" onclick="location.href = 'EditParcelStatus.jsp?ParcelId=<%= rs.getString("ParcelId")%>'">Update</button>
                        <button class="delete" onclick="location.href = 'DeleteParcelStatus.jsp?ParcelId=<%= rs.getString("ParcelId")%>'">Delete</button>
                    </td>
                </tr>
                <%
                    }

                } else {
                    pstmt = con.prepareStatement("SELECT * FROM status where ParcelId =?");
                    pstmt.setString(1, parcelid);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("ParcelId")%></td>
                    <td><%=rs.getString("Location")%></td>
                    <td><%=rs.getString("status")%></td>
                    <td>
                        <button class="update" onclick="location.href = 'EditParcelStatus.jsp?ParcelId=<%= rs.getString("ParcelId")%>'">Update</button>
                        <button class="delete" onclick="location.href = 'DeleteParcelStatus.jsp?ParcelId=<%= rs.getString("ParcelId")%>'">Delete</button>
                    </td>
                </tr>
                <%
                            }
                        }

                    } catch (Exception e) {

                    }
                %>


            </tbody>
        </table>
        <jsp:include flush="true" page="footer.html" />
    </body>
</html>
