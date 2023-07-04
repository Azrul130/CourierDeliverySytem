<%-- 
    Document   : payment
    Created on : 4 Jul 2023, 4:28:13 pm
    Author     : Azrul Hafizam
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Gateway</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body>

        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <h3>Payment</h3>
                    <br><!-- comment -->
                    <h4>Card Detail</h4>
                    <form action="processPayment" method="post">
                        <table>
                            <tr>
                                <td>Cardholder Name&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" name="cardholderName" placeholder="Mazlan Bin Zul" required></td>
                            </tr>
                            <tr>
                                <td>Card Number&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" name="cardNumber" placeholder="0000 0000 0000 0000" required></td>
                            </tr>
                            <tr>
                                <td>Expiration Date&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" name="expirationDate" placeholder="00/00" required></td>
                            </tr>
                            <tr>
                                <td>CVV&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="number" name="cvv" placeholder="000" required></td>
                            </tr>
                            <tr>
                                <td><button type="submit">Submit Payment</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

