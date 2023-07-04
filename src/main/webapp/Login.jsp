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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {

                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            body {
                background-color: #282c34;
                font-family: 'Montserrat', sans-serif;
                color: #333;
            }

            h1 {
                text-align: center;
                margin-top: 50px;
                color: white; /* added color property */
            }

            form {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
                width: 500px;
                margin: 0 auto;
                margin-top: 50px;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            label {
                display: block;
                margin-bottom: 10px;
                color: #666;
            }
            div label{
                display: inline-block;
                margin-bottom: 10px;
                color: #666;
            }

            input[type="text"], input[type="password"] {
                padding: 10px;
                border: none;
                border-radius: 5px;
                margin-bottom: 20px;
                width: 100%;
                box-sizing: border-box;
                background-color: #f7f7f7;
                color: #333;
            }

            input[type="text"]::placeholder, input[type="password"]::placeholder {
                color: #999;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease-in-out;
            }

            input[type="submit"]:hover {
                background-color: #3e8e41;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1>Login Page</h1>
                    <% if (request.getAttribute("loginStatus") != null && (boolean)request.getAttribute("loginStatus") == false) { %>
                    <div class="alert alert-danger" role="alert">
                        Login Unsuccessful
                    </div>
                    <% } %>
                    <form action="processLogin.jsp" method="post">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>

                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                        <div>
                            Login Type 
                            <input type="radio" id="cust" name="loginType" value="1">
                            <label for="cust">Customer</label>
                            <input type="radio" id="emp" name="loginType" value="2" checked>
                            <label for="emp">Employee</label> <br> <br> 
                        </div>
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
    </body>
</html>

