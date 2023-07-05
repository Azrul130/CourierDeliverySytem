<%-- 
    Document   : orderDetail
    Created on : 5 Jul 2023, 7:42:59 am
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <br><!-- comment -->
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <table>
                        <tr>
                            <td>Parcel ID&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getParcelId()%></td>
                        </tr>
                        <tr>
                            <td>Cutomer ID&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getCustId()%></td>
                        </tr>
                        <tr>
                            <td>Recipient Name&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getRecipientName()%></td>
                        </tr>
                        <tr>
                            <td>Recipient Address&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getRecipientAddress()%></td>
                        </tr>
                        <tr>
                            <td>Weight&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getWeight()%></td>
                        </tr>
                        <tr>
                            <td>Description&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getDescription()%></td>
                        </tr>
                        <tr>
                            <td>Parcel Type&nbsp;&nbsp;&nbsp;</td>
                            <td><%= ((Order) session.getAttribute("od")).getParcelType()%></td>
                        </tr>
                        <tr>
                            <td><h4>Price</h4>&nbsp;&nbsp;&nbsp;</td>
                            <td><h4><%= (((Order) session.getAttribute("od")).getWeight())*4 %></h4></td>
                        </tr>
                        <tr>
                            <td>
                                <button><a href="payment.jsp">Pay Now</a></button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
