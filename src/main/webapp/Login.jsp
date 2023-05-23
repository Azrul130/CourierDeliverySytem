<%-- 
    Document   : Login
    Created on : 4 Apr 2023, 10:07:24 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="Style/loginStyle.css">
</head>
<body>
	<h1>Login Page</h1>
        <form action="processLogin.jsp" method="post">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" required>
                
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required>
                <div>
                    Login Type 
                    <input type="radio" id="cust" name="loginType" value="1">
                    <label for="cust">Customer</label>
                    <input type="radio" id="emp" name="loginType" value="2">
                    <label for="emp">Employee</label> <br> <br> 
                </div>
                
                
		<input type="submit" value="Submit">
                
	</form>
</body>
</html>

