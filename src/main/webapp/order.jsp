<%-- 
    Document   : order
    Created on : 9 May 2023, 11:30:58 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.courierdeliverysystem.function.CustIdGenerate" %>
<%@page import="com.mycompany.courierdeliverysystem.model.Customer" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Order</title>
        <link rel="stylesheet" type="text/css" href="Style/orderStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {
    background-color: #282c34;
    font-family: 'Montserrat', sans-serif;
    color: #333;
}

h1 {
    text-align: center;
    margin-top: 50px;
    color: white;
}

h2 {
    text-align: center;
    margin-top: 50px;
    color: black;
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

input[type="text"], input[type="email"], input[type="password"] , input[type="number"], select, option {
    padding: 10px;
    border: 1px solid lightgray;
    border-radius: 5px;
    margin-bottom: 20px;
    width: 100%;
    box-sizing: border-box;
    background-color: #f7f7f7;
    color: #333;
}

input[type="text"]::placeholder, input[type="email"]::placeholder, input[type="password"]::placeholder input[type="tel"]::placeholder {
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
input[type="reset"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease-in-out;
}

input[type="reset"]:hover {
    background-color: #3e8e41;
}

        </style>
    </head>
    <body>
        <%
            String parcelid = CustIdGenerate.generateOrderId(5);
        %>
        <jsp:include page="header.jsp" flush="true" />
        <br><!-- comment -->

        <h2>Create Order</h2>

        <form action="addorder" method="POST"><table>            

                <tr>
                    <td>
                        <label>Order ID</label>
                    </td>
                    <td>
                        <input type="text" id="ParcelId" name="ParcelId" value= "<%=parcelid%>" readonly="readonly"><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Customer ID</label>
                    </td>
                    <td>
                        <input type="text" id="CustId" name="CustId" value="<%= ((Customer) session.getAttribute("cust")).getCustId() %>" readonly="readonly"><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        Recipient Name
                    </td>
                    <td>
                        <input type="text" id="recipientName" name="recipientName" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                      Recipient Address
                    </td>
                    <td>
                        <input type="text" id="recipientAddress" name="recipientAddress" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        Package Weight
                    </td>
                    <td>
                        <input type="text" id="weight" name="weight" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                       Description
                    </td>
                    <td>
                        <input type="text" id="description" name="description" required><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Parcel Type
                    </td>
                    <td>
                        <select name="parcelType" size="1">
                            <option value="local">Local</option>
                            <option value="Oversea">Oversea</option>
                        </select>
                    </td>
                </tr>
                <br><!-- comment -->
            </table>
            <br><!-- comment -->
            <p>
                <input type="submit" value="Create Order">
                <input type="reset" value="Clear">
            </p>

        </form>
        <br><!-- comment -->
        <br><!-- comment -->
        <jsp:include page="footer.html" flush="true" />
        
    </body>
</html>
