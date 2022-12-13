<%-- 
    Document   : insertProduct.jsp
    Created on : 08-Sep-2022, 9:55:25 pm
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@page errorPage="error.jsp" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
        <link rel="stylesheet" href="login.css" />
    </head>
    <body>
        <%
           HttpSession sess = request.getSession(false);
           if(sess!=null) {
        %>
                    <%@include file="header.jsp" %>
                    <div>
                        <form class="form" action="controller.jsp">
                        <h2>
                            Search Laptop
                        </h2>
                        <div>
                            <p>Company Name: </p> <input class="form__input" type="text" name="companyName" placeholder="Enter Company Name"/>

                        </div>
                        <div >
                            <p>Model Name: </p> <input class="form__input" type="text" name="modelName" placeholder="Enter Model Name"/>

                        </div>
                        
                            <button class="btn" name="action" value="searchProduct">Submit</button>

                    </form>
                </div>
        <%      
                
           } else {
                response.sendRedirect("login.jsp");
            }
        %>
        
        
    </body>
</html>
