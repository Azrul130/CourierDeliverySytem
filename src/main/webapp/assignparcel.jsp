<%-- 
    Document   : assignparcel
    Created on : 23 May 2023, 14:08:39
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Parcel</title>
        <style>
            body {
                background-color: rgb(121, 252, 252);
            }
            h1{
                text-align: center;
                font-family: comic sans ms;
            }
            #form{
                text-align: center;
                background-color: rgb(253, 101, 101);
                margin: auto;
                width: 30%;
                padding: 5px;
            }
            label{
                display: inline-block;
                width:20%;
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
        <%--<jsp:include page="header.jsp" flush="true" />--%>

        <h1>Assign parcel to the driver</h1>
        <div id="form">
            <form method="post" action="assignparcel.jsp">
                <label for="parcelId">Parcel ID:</label>
                <input type="text" name="parcelId" id="parcelId" required><br><br>

                <label for="driverId">Driver ID:</label>
                <input type="text" name="driverId" id="driverId" required><br><br>

                <label for="destination">Destination:</label>
                <input type="text" name="Destination" id="Destination" required><br><br>

                <input type="submit" value="Assign Parcel">
            </form>
        </div>
        <br><br>
        <%
            try {

                String ParcelId = request.getParameter("parcelId");
                String driverId = request.getParameter("driverID");
                String Destination = request.getParameter("Destination");

                if (ParcelId != null || !ParcelId.isEmpty()) {

                    ResultSet rs = null;
                    PreparedStatement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");

                    st = con.prepareStatement("INSERT INTO delivery (RiderId,parcelId,Destination) values (?,?,?)");
                    st.setString(1, driverId);
                    st.setString(2, ParcelId);
                    st.setString(3, Destination);
                    rs = st.executeQuery();

                }
            } catch (Exception e) {

            }
        %>

        <div>
            <table>
                <thead>
                    <tr>
                        <th>Parcel ID</th>
                        <th>Destination</th>
                        <th>Rider ID</th>
                        <th>Tracking Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {

                            //prepare the connection
                            ResultSet rs;
                            PreparedStatement st;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");

                            //prepare the statement
                            st = con.prepareStatement("SELECT * FROM delivery");
                            rs = st.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>

                        <td><%=rs.getString("ParcelId")%></td>
                        <td><%=rs.getString("Destination")%></td>
                        <td><%=rs.getString("RiderId")%></td>
                        <td><%=rs.getString("TrackingNo")%></td>

                        <%
                                }

                            } catch (Exception e) {

                            }
                        %>
                </tbody>
            </table>
        </div>
        <%--<jsp:include page="footer.html" flush="true" />--%>
    </body>
</html>
