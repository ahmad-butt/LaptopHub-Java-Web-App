<%-- 
    Document   : logout
    Created on : 06-Sep-2022, 11:48:28 pm
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       HttpSession sess = request.getSession(false);
       if(sess!=null) {
            sess.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
       }
    %>
</html>
