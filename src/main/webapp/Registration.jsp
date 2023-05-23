<%-- 
    Document   : Registration
    Created on : 4 Apr 2023, 11:01:03 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.Controller.CustomerController" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registration Form</title>
        <link rel="stylesheet" type="text/css" href="Style/registrationStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {
                background-color: #282c34;
                font-family: 'Montserrat', sans-serif;
                color: #333;
                padding: 50px;
            }
        </style>
    </head>
    <body>
        <h1>Registration Form</h1>


        <div id="customerForm">
            <form action="tregistration.jsp" method="post">
                <div>
                    Registration Type:
                    <input type="radio" id="cust" name="RegistrationType" value="customer" onclick="showForm(this.value)" checked>
                    <label for="cust">Customer</label>
                    <input type="radio" id="emp" name="RegistrationType" value="employee" onclick="showForm(this.value)">
                    <label for="emp">Employee</label>
                </div>
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
                
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name">

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">

                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="0121256154" pattern="[0-9]{10,11}"><!-- comment -->

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">

                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password">
                <input type="submit" value="Register"><br>
                <small>Check registration type make sure it is correct!</small>
            </form>
        </div>

        <div id="employeeForm" style="display: none;">
            <form>
                <div>
                    Registration Type:
                    <input type="radio" id="cust" name="RegistrationType" value="customer" onclick="showForm(this.value)" checked>
                    <label for="cust">Customer</label>
                    <input type="radio" id="emp" name="RegistrationType" value="employee" onclick="showForm(this.value)">
                    <label for="emp">Employee</label>
                </div>
                
                 <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
                
                <label for="name">Username</label>
                <input type="text" id="name" name="name" placeholder="Enter your name">

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">

                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="0121256154" pattern="[0-9]{10,11}"><!-- comment -->

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">

                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password">
                
                <label for="occupation">Occupation</label>
                <select id="occupation" name="occupation" class="form-select">
                    <option value="Rider">Rider</option>
                    <option value="Receptionist">Receptionist</option>
                    <option value="Manager">Manager</option>
                </select><br><br/>

                <input type="submit" value="Register"><br>
                <small>Check registration type make sure it is correct!</small>
            </form>
        </div>

        <script>
            function showForm(registrationType) {
                var customerForm = document.getElementById('customerForm');
                var employeeForm = document.getElementById('employeeForm');

                if (registrationType === 'customer') {
                    customerForm.style.display = 'block';
                    employeeForm.style.display = 'none';
                } else if (registrationType === 'employee') {
                    customerForm.style.display = 'none';
                    employeeForm.style.display = 'block';
                }
            }
        </script>
    </body>
</html>
</body>
</html>
