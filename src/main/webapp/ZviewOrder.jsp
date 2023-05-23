<%-- 
    Document   : ZviewOrder
    Created on : 23 May 2023, 1:47:24 pm
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order</title>
        <link rel="stylesheet" type="text/css" href="Style/vieworderStyle.css">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <br><!-- comment -->
        <br><!-- comment -->
        <h2>View Order</h2>
        <div id="table">
        <table>
            <tr style="background-color: red; ">
            <th>Tracking Number</th>
            <th>Sender Name</th>
            <th>Sender Address</th>
            <th>Recipient Name</th>
            <th>Recipient Address</th>
            <th>Package Weigth(Kg)</th>
            <th>Description</th>
            <th>Status</th>
        </tr>
        
        <tr>
            <td>NGF00001</td>
            <td>Salman</td>
            <td>Kuala Terengganu</td>
            <td>Haris</td>
            <td>Kuala Lumpur</td>
            <td>1</td>
            <td>Fragile Package</td>
            <td>sending</td>
        </tr>

         <tr>
            <td>NTC00034</td>
            <td>Alfa</td>
            <td>Kota Kinabalu</td>
            <td>Jai</td>
            <td>Segamat</td>
            <td>1.5</td>
            <td>Fragile Package</td>
            <td>Delivered</td>
        </tr>
        
    </table>
        </div>
        <br><!-- comment -->
        <br><!-- comment -->
        <jsp:include page="footer.html" flush="true" />
    </body>
</html>
