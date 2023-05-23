<%-- 
    Document   : ZprocessOrder
    Created on : 23 May 2023, 1:23:36 pm
    Author     : Azrul Hafizam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Overview</title>
        <link rel="stylesheet" type="text/css" href="Style/orderStyle.css">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <%
        String name = request.getParameter("recipientName");
        String address = request.getParameter("recipientAddress");
        String W = request.getParameter("weight");
        String desc = request.getParameter("Description");
        %>
        <br><!-- comment -->
        <br><!-- comment -->
        <fieldset>
        <h2>Order Overview</h2>       
        <p>Recipient Name    : <%=name%></p>
        <p>Recipient Address : <%=address%></p>
        <p>Package Weight    : <%=W%></p>
        <p>Description       : <%=desc%></p>
        </fieldset>
        <br><!-- comment -->
        <br><!-- comment -->
        <jsp:include page="footer.html" flush="true" />
    </body>
</html>
