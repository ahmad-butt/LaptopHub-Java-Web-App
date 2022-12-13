

<%@page import="MyPack.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="cart.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
           HttpSession sess = request.getSession(false);
           if(sess!=null){
                ArrayList cartItems = (ArrayList)sess.getAttribute("cartItems");
                int totalPrice = 0;
                if(cartItems.size()!=0) {
        %>
        <div class="citems">
        <%
                    for(int i=0; i<cartItems.size(); i++) {
                        Product p = (Product)cartItems.get(i);
                        totalPrice+=p.getPrice();
        %>
                <div class="citem">
                    <h3>Product: <%= p.getCompanyName()%> <%= p.getModelName() %> <%= p.getModelYear()%></h3>
                    <p>Price: <%= p.getPrice()%> $</p>
                    <br/>
                    <a href="controller.jsp?action=removeFromCart&index=<%= i %>"><button>Remove</button></a>
                </div>
        <%
                    }
        %>
        </div>
        <h1 class="price">Total Price: <%= totalPrice %> $</h1>
        <a href="controller.jsp?action=checkout"><button class="checkout">Checkout</button></a>
        <%
                } else {
        %>
                <h1>Your Cart is Empty!!</h1>
        <% 
                }
                
           } else {
                response.sendRedirect("login.jsp");
           }
           
        %>
    </body>
</html>
