<%-- 
    Document   : searchResults
    Created on : 13-Sep-2022, 1:54:52 pm
    Author     : macbookpro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="product" class="MyPack.Product" scope="page"/>
<%@page import="MyPack.Product" %>
<%@page errorPage="error.jsp" %>

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
           ArrayList products = (ArrayList)request.getAttribute("searchResults");
           if(products!=null) {
                if(products.size() > 0) {
                    for(int i=0; i<products.size(); i++) {
                         product = (Product)products.get(i);
        %>
        <a href="productDetail.jsp?id=<%= product.getId() %>">
        <div class="items">
            <h3>
                Company: 
                <%=
                    product.getCompanyName()
                %>
            </h3>
            <h3>
                Model:  
                <%=
                    product.getModelName()
                %>
            </h3>
            <p>
                Model Year:  
                <%=
                    product.getModelYear()
                %>
            </p>
            <p>
                Ram: 
                <%=
                    product.getRam()
                %>
                GB
            </p>
            <p>
                Memory: 
                <%=
                    product.getMemory()
                %>
                GB
            </p>
            <p>
                Memory-Type: 
                <%=
                    product.getMemoryType()
                %>
            </p>
            <p>
                Processor: 
                <%=
                    product.getProcessor()
                %>
            </p>
            <p>
                GPU: 
                <%=
                    product.getGpu()
                %>
            </p>
            <p>
                Price: 
                <%=
                    product.getPrice()
                %>
                $
            </p>
            </p>
            <p>
                Rating: ⭐️⭐️⭐️⭐️⭐️
            </p>
        </div>
        </a>
        <%
           }
        } else {
        %>
        <h1>No Laptop Found!!</h1>
        <%
           } 
        } else {
            response.sendRedirect("searchProduct.jsp");
        }
        %>
        </div>
        
    </body>
</html>
