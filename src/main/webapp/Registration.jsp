<%-- 
    Document   : Registration
    Created on : 4 Apr 2023, 11:01:03 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registration Form</title>
        <link rel="stylesheet" type="text/css" href="Style/registrationStyle.css">
</head>
<body>
	<h1>Registration Form</h1>
	<form>
		<label for="username">Username</label>
		<input type="text" id="username" name="username" placeholder="Enter your username">

		<label for="email">Email</label>
		<input type="email" id="email" name="email" placeholder="Enter your email">

                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="0121256154" pattern="[0-9]{10,11}"><!-- comment -->
                
		<label for="password">Password</label>
		<input type="password" id="password" name="password" placeholder="Enter your password">

		<label for="confirm-password">Confirm Password</label>
		<input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password">

                <div>
                    Registration Type 
                    <input type="radio" id="cust" name="RegistationType" value="1">
                    <label for="cust">Customer</label>
                    <input type="radio" id="emp" name="RegistrationType" value="2">
                    <label for="emp">Employee</label> <br> <br> 
                </div>
                
		<input type="submit" value="Register">
	</form>
</body>
</html>
