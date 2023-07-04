<%-- 
    Document   : feedback_process
    Created on : 3 Jul 2023, 18:41:08
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>processfeedback</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            //HttpSession session = request.getSession(); // Get the session object
            String username = (String) session.getAttribute("user"); // Retrieve the attribute "username" and cast it to String

            Connection con = null;
            PreparedStatement pstmt = null;

            try {

                //Get connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courierdeliverysystem", "root", "admin");

                //retrieve data
                String rating = request.getParameter("rating");
                String comments = request.getParameter("comments");
                String recommendation = request.getParameter("recommendation");
                String expectations = request.getParameter("expectations");
                String satisfaction = request.getParameter("satisfaction");

                //prepare the statement
                String sql = "INSERT INTO feedback (userId, rating, comments, recommendation, expectations, satisfaction) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, rating);
                pstmt.setString(3, comments);
                pstmt.setString(4, recommendation);
                pstmt.setString(5, expectations);
                pstmt.setString(6, satisfaction);

                //execute the statement
                pstmt.executeUpdate();

                // Redirect to a thank you page or display a success message
                response.sendRedirect("thankyou.html");

            } catch (Exception e) {
                e.printStackTrace();

                // Redirect to an error page or display an error message
                response.sendRedirect("error.html");

            } finally {

                // Close the database resources
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }

            }
        %>
    </body>
</html>
