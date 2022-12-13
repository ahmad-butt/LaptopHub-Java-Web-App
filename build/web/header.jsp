<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<%@page session="false" %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="header.css" />
    </head>
    <body>

        <div class="header">
            <a href="home.jsp"><h1>LaptopHub</h1></a>
            <%
               HttpSession ses = request.getSession(false);
               if(ses!=null){
               String name = (String) ses.getAttribute("username");
            %>
            <p>Welcome, <%= name %></p>
            <%
                    Boolean type = (Boolean)ses.getAttribute("userType");
                    if(type) {
            %>
                <a href="insertProduct.jsp"><button>Insert</button></a>
            <%   
                    }
            %>
                <a href="searchProduct.jsp"><button>Search</button></a>
                <a href="cart.jsp"><button>Cart</button></a>
                <a href="orders.jsp"><button>Orders</button></a>
                <a href="logout.jsp"><button name="action" value="logout">Logout</button></a>
            <%
                }
            %>  
        </div>
    </body>
</html>
