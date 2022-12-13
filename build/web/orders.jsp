<%-- 
    Document   : productsGrid
    Created on : 10-Sep-2022, 4:53:50 pm
    Author     : macbookpro
--%>

<%@page import="java.util.ArrayList"%>
<%@page session="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<jsp:useBean id="DAO" class="MyPack.StoreDao" scope="page"/>
<jsp:useBean id="order" class="MyPack.Order" scope="page"/>
<%@page import="MyPack.Order" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="productsGrid.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="list">
        <%
           HttpSession sess = request.getSession(false);
           if(sess!=null){
                int UID = (int)sess.getAttribute("uid");
                ArrayList orders = DAO.getOrders(UID);
                if(orders.size()>0){
                for(int i=0; i<orders.size(); i++) {
                     order = (Order)orders.get(i);
        %>
        <div class="items">
            <h3>
                Date: 
                <%=
                    order.getOrderDate()
                %>
            </h3>
            <h3>
                Total Amount:  
                <%=
                    order.getTotalAmount()
                %>
                 $
            </h3>
        </div>
        <%
                    }
                } else {
        %>
                <h1>No Orders Placed!!</h1>
        <%
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
        </div>
    </body>
</html>
