<%-- 
    Document   : index
    Created on : 4 Apr 2023, 9:55:45 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JNT Courier</title>
        <link rel="stylesheet" href="Style/mainStyle.css">
    </head>
    <body>
        <header>
            <jsp:include page="header.html" flush="true"></jsp:include>
        </header>
        
        <div class="content">
            <h1>Track Your Parcel</h1><br/>
            
            <form action="#" method="#">
                <input type="text" name="TrackNo" id="TrackNo" placeholder="eg:MY5468279124" required /><!-- Track Number input --><br/>
                <input type="submit" value="Track" id="submitBtn" />
            </form>
        </div>
            
        <footer>
        <jsp:include page="footer.html" flush="true"></jsp:include>
        </footer>>
    </body>
</html>
