<%-- 
    Document   : order
    Created on : 9 May 2023, 11:30:58 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <br><!-- comment -->
        
        <h2>Create Order</h2>

        <form><table>
                <tr>
                    <td>
                        <label for="senderName">Sender Name:</label>
                    </td>
                    <td>
                        <input type="text" id="senderName" name="senderName" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="senderAddress">Sender Address:</label>
                    </td>
                    <td>
                        <input type="text" id="senderAddress" name="senderAddress" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="recipientName">Recipient Name:</label>
                    </td>
                    <td>
                        <input type="text" id="recipientName" name="recipientName" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="recipientAddress">Recipient Address:</label>
                    </td>
                    <td>
                        <input type="text" id="recipientAddress" name="recipientAddress" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="packageWeight">Package Weight:</label>
                    </td>
                    <td>
                        <input type="number" id="packageWeight" name="packageWeight" min="0" required><br/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="packageDescription">Package Description:</label>
                    </td>
                    <td>
                        <input type="text" id="packageDescription" name="packageDescription" required><br/>
                    </td>
                </tr>
            </table>

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
