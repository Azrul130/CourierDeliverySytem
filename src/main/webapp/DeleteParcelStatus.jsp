<%-- 
    Document   : DeleteParcelStatus
    Created on : 4 Jul 2023, 16:28:02
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Parcel</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

            body {
                background-color:aliceblue;
            }

            h2,p{
                text-align: center;
                font-family: comic sans ms;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-sizing: border-box;
                padding: auto;
                height: 65px;
                background-color: #24252a;
            }

            .popup-content {
                background-color: #fefefe;
                margin: 8% auto;
                padding: 20px;
                border: 3px solid #24252a;
                width: 40%;
            }

            .popup-content label {
                display: inline-block;
                width: 250px;
            }

            table {
                display: flex;
                justify-content: center;
                font-family: comic sans ms;
            }

            form{
                display: flex;
                justify-content: center;
            }

            input{
                display: flex;
                justify-content: center;
                width: 80px;
                height: 25px;
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #24252a;
                background-color: crimson;
                cursor: pointer;
                margin: 20px;

            }
        </style>
    </head>
    <body>

        <%
            String ParcelId = request.getParameter("ParcelId");

            if (ParcelId != null && !ParcelId.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");
                    PreparedStatement retrieve = con.prepareStatement("SELECT * FROM status WHERE ParcelId = ?");
                    retrieve.setString(1, ParcelId);
                    ResultSet rs = retrieve.executeQuery();

                    //display product details
                    if (rs.next()) {
        %>

        <div class="popup-content">
            <h2>Delete Parcel <%=rs.getString("ParcelId")%> ?</h2>
            <p><b>Are you sure you want to delete the following product?</b></p>
            <table>
                <tr>
                    <td>Parcel ID :</td>
                    <td><%= ParcelId%></td>
                </tr>
                <tr>
                    <td>Parcel Status :</td>
                    <td><%= rs.getString("status")%></td>
                </tr>
                <tr>
                    <td>Parcel Location:</td>
                    <td><%= rs.getString("Location")%></td>
                </tr>
            </table>
            <form action="DeleteParcelStatus.jsp" method="post">
                <input type="hidden" name="id" value="<%= ParcelId%>">
                <input type="submit" name="action" value="Delete">
                <input type="submit" name="action" value="Cancel">
            </form>


            <%
                        } else {
                            out.print("Parcel not found");
                        }
                    } catch (Exception e) {
                        // Handle any exceptions and send an error response
                        e.printStackTrace();
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    }
                } else {
                    out.println("Invalid ID");
                }
            %>

            <%
                //retrieve from the form value
                String action = request.getParameter("action");
                ParcelId = request.getParameter("id");

                //make statement for delete from database
                if (action != null && action.equals("Delete")) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");
                        PreparedStatement deleteStatement = con.prepareStatement("DELETE FROM status WHERE ParcelId = ?");
                        deleteStatement.setString(1, ParcelId);
                        int delrs = deleteStatement.executeUpdate();

                        if (delrs > 0) {
                            out.println("Parcel deleted successfully.");
                            response.sendRedirect("updateparcel.jsp");
                        } else {
                            out.println(ParcelId);
                            out.println("Product not found or couldn't be deleted.");
                        }

                        con.close();
                    } catch (Exception e) {
                        out.println("Error: " + e);
                    }
                } else if (action != null && action.equals("Cancel")) {
                    // Redirect back to the previous page
                    response.sendRedirect("updateparcel.jsp");
                }
            %>
    </body>
</html>
