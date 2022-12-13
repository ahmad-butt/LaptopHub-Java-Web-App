<%-- 
    Document   : home
    Created on : 10-Sep-2022, 2:58:18 pm
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@page errorPage="error.jsp" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            HttpSession sess = request.getSession(false);
            
            if(sess!=null) {
        %>
        <jsp:include page="productsGrid.jsp" />
        <%
            } else {
                response.sendRedirect("login.jsp");
           }
        %>
    </body>
</html>
