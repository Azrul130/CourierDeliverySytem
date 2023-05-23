<%-- 
    Document   : updateparcelstaff
    Created on : 23 May 2023, 14:10:29
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcel Status</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: rgb(121, 252, 252);
            }

            h1 {
                color: #333;
                font-family: comic sans ms;
            }

            p {
                margin-top: 5px;
                font-family: comic sans ms;
            }

            .status {
                font-weight: bold;
                margin-top: 10px;


            }
            #status-container {
                background-color: rgb(247, 99, 99);
                margin-left: 3%;
                margin-right: auto;
                width: 50%;
                padding: 0.02%;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }
            .status span {
                color: #555;
            }

            .tracking-number {
                margin-top: 10px;
            }

            .form-container {
                margin-top: 40px;
                background-color: bisque;
                margin-left: 3%;
                margin-right: auto;
                width: 20%;
                padding: 1%;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .form-container label {
                display: block;
                margin-bottom: 10px;
            }

            .form-container input[type="text"] {
                padding: 5px;
                width: 200px;
            }

            .form-container input[type="submit"] {
                padding: 5px 15px;
                background-color: #555;
                color: #fff;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <h1>Parcel Status Staff</h1>

        <div class="form-container">
            <label for="tracking-number-input">Enter Tracking Number:</label>
            <input type="text" id="tracking-number-input"><br><br>

            <label for="loaction-input">Enter Location:</label>
            <input type="text" id="location-input"><br><br>

            <input type="submit" value="Check Status" onclick="updateStatus()">
        </div>
        <br><br>
        <div id="status-container">
            <p class="tracking-number">Tracking Number: <span id="tracking-number-text">-</span></p>
            <p class="status">Status: <span id="status-text">-</span></p>
        </div>

        <script>
            function updateStatus() {
                var trackingNumber = document.getElementById('tracking-number-input').value;

            }
        </script>
    </body>
</html>
