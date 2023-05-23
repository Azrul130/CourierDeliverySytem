<%-- 
    Document   : processLogin
    Created on : 23 May 2023, 8:24:28 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.courierdeliverysystem.model.Customer" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Employee" %>
<%@page  import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Login</title>
    </head>
    <body>
        <jsp:useBean id="customer" class="com.mycompany.courierdeliverysystem.model.Customer" scope="session" />
        <jsp:useBean id="emp" class="com.mycompany.courierdeliverysystem.model.Employee" scope="session" />
        <%
            int loginType = Integer.parseInt(request.getParameter("loginType"));
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
           
            String url = "jdbc:mysql://localhost/courierdeliverysystem";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,"root","admin");
           
            if (loginType == 2){
        %>
        
        <%
            String Query = "SELECT * FROM employee where username = ?";
            PreparedStatement ps = con.prepareStatement(Query);
            
            ps.setString(1, username );
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next() ){
                emp.setEmployeeId(rs.getString(1));
                emp.setUsername(rs.getString(2));
                emp.setPassword(rs.getString(3));
                emp.setName(rs.getString(4));
                emp.setPhone(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setOccupation(rs.getString(7));
            }
            
            if (emp != null && emp.getUsername() != null && emp.getUsername().equals(username) 
                && emp.getPassword().equals(pass) ){
                out.print("<h1>login Success</h1>");
                response.sendRedirect("AdminManagement.jsp");
            } else {
                request.setAttribute("loginStatus", false);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
                dispatcher.forward(request, response);
            }
            con.close();
        %>
        
        <% }else if { %>
        
        <% } %>
        
</html>
