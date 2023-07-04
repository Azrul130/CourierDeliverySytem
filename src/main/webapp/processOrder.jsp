<%-- 
    Document   : processOrder
    Created on : 23 May 2023, 1:52:00 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Overview</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body> 
        <jsp:useBean id="myOrder" class="com.mycompany.courierdeliverysystem.model.Order" scope="request"/>
        <jsp:setProperty name="myOrder" property="*"/>

        <%
        int result;
        
        Class.forName("com.mysql.jdbc.Driver");
        
       
        String myURL = "jdbc:mysql://localhost:3306/courierdeliverysystem";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
        
        
        //create preparedStatement ocject
             
        //prepared sql query as a string
        String sInsertQry = "INSERT INTO order(orderId, custId, recipientName, recipientAddress, description, weight, parcelType) values (?,?,?,?,?,?,?)";
        //call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
        
        //Assign each value to respective colums for student's table...(C-Create)
               
        myPS.setString(1, myOrder.getOrderId());
        myPS.setString(2, myOrder.getCustId());
        myPS.setString(3, myOrder.getRecipientName() );
        myPS.setString(4, myOrder.getRecipientAddress() );
        myPS.setDouble(5, myOrder.getWeight() );
        myPS.setString(6, myOrder.getDescription() );
        myPS.setString(7, myOrder.getParcelType() );
        
        result = myPS.executeUpdate();
                 
        if (result > 0){
       String orderid = myOrder.getOrderId();
       String custid = myOrder.getCustId(); 
       String Rname = myOrder.getRecipientName();
       String Raddress = myOrder.getRecipientAddress();
       double weigth = myOrder.getWeight();
       double price = myOrder.getWeight() * 4;
       String desc = myOrder.getDescription(); 
       String Ptype = myOrder.getParcelType(); 
            }
            
            }catch(SQLException e){
            e.printStackTrace();
            }
            
        out.println("Step5 : Close database connection...!");
        myConnection.close();
        out.println(" ");
        out.println("Database connection is closed...!");     
        %>

        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <p1>Order Detail</p1>
                    <br><!-- comment -->
                    <form action="proceedPayment.jsp" method="post">
                        <table>
                            <tr>
                                <td>Order ID&nbsp;&nbsp;&nbsp;</td>
                                <td><%=orderid%></td>
                            </tr>
                            <tr>
                                <td>Customer ID&nbsp;&nbsp;&nbsp;</td>
                                <td><%=custid%></td>
                            </tr>
                            <tr>
                                <td>Recipient Name&nbsp;&nbsp;&nbsp;</td>
                                <td><%=Rname%></td>
                            </tr>
                            <tr>
                                <td>Recipient Address&nbsp;&nbsp;&nbsp;</td>
                                <td><%=Raddress%></td>
                            </tr>
                            <tr>
                                <td>Weight&nbsp;&nbsp;&nbsp;</td>
                                <td><%=weight%></td>
                            </tr>
                            <tr>
                                <td>Description&nbsp;&nbsp;&nbsp;</td>
                                <td><%=desc%></td>
                            </tr>
                            <tr>
                                <td>Parcel Type&nbsp;&nbsp;&nbsp;</td>
                                <td><%=Ptype%></td>
                            </tr>
                            <tr>
                                <td><h3>Price&nbsp;&nbsp;&nbsp;</h3></td>
                                <td><h3><%=price%></h3></td>
                            </tr>
                            <tr>
                                <td><button><a href="payment.jsp">Pay</a></button></td>
                                <td><button><a href="order.jsp">Cancel</a></button></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <br><!-- comment -->
        <br><!-- comment -->  
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
