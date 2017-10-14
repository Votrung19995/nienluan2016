<%-- 
    Document   : logout
    Created on : Aug 26, 2016, 4:17:18 PM
    Author     : Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng xuất</title>
    </head>
    <body>
        <script>
            alert("Đã đăng xuất !");
            window.location.href="<%= request.getContextPath() %>";
        </script>
    </body>
</html>
