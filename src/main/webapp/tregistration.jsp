<%-- 
    Document   : tregistration
    Created on : 23 May 2023, 2:50:59 pm
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.courierdeliverysystem.dao.AccountDAO" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Customer" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Employee" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="cust" class="com.mycompany.courierdeliverysystem.model.Customer" scope="request" />
        <jsp:setProperty name="cust" property="*" />
        <%
           
            int status=0;
            String url = "jdbc:mysql://localhost/courierdeliverysystem";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,"root","admin");
            
            String Query = "INSERT INTO customer (CustId, username, CustName, Password, CustPhoneNo, email) values (?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(Query);
            ps.setString(1, cust.getCustId() );
            ps.setString(2, cust.getUsername() );
            ps.setString(3, cust.getName() );
            ps.setString(4, cust.getPassword() );
            ps.setString(5, cust.getPhone() );
            ps.setString(6, cust.getEmail() );
            
            ps.executeUpdate();
            if (status > 0){
                out.println("<h1>Registration for "+cust.getName() + " is Successful</h1>");
                out.println("<a href='login.jsp' >Login Page</a>");
            }else { 
                out.println("<h1>Registration Failed</h1>");
            }
            con.close();
            
        %>
    </body>
</html>
