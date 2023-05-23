<%-- 
    Document   : updateparcel
    Created on : 23 May 2023, 14:09:34
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
    }

    h1 {
      color: #333;
      font-family: comic sans ms;
    }

    p {
      margin-top: 10px;
      font-family: comic sans ms;
    }

    .status {
      font-weight: bold;
      margin-top: 20px;

    }

    .status span {
      color: #555;
    }

    .tracking-number {
      margin-top: 40px;
    }

    .form-container {
      margin-top: 40px;
      background-color: bisque;
      margin-left: 3%;
      margin-right: auto;
      width: 20%;
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
  <h1>Parcel Status</h1>
  
  <div class="form-container">
    <label for="tracking-number-input">Enter Tracking Number:</label>
    <input type="text" id="tracking-number-input">
    <input type="submit" value="Check Status" onclick="checkStatus()">
  </div>

  <div id="status-container">
    <p class="status">Status: <span id="status-text">-</span></p>
    <p class="tracking-number">Tracking Number: <span id="tracking-number-text">-</span></p>
  </div>

  <script>
    function checkStatus() {
      var trackingNumber = document.getElementById('tracking-number-input').value;
      // Perform an API call or any other logic to check the status using the trackingNumber
      // For demonstration purposes, let's assume the status is fetched and displayed here
      var status = "In Transit";
      document.getElementById('status-text').textContent = status;
      document.getElementById('tracking-number-text').textContent = trackingNumber;
    }
  </script>
</body>
</html>
