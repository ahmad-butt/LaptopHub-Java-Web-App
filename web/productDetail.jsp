<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<jsp:useBean id="DAO" class="MyPack.StoreDao" scope="page"/>
<jsp:useBean id="product" class="MyPack.Product" scope="page"/>
<%@page errorPage="error.jsp" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link rel="stylesheet" href="productDetail.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <%
           HttpSession sess = request.getSession(false);
           if(sess!=null){
           int id = Integer.parseInt(request.getParameter("id"));
           product = DAO.getProduct(id);
        %>
        <div class="container">
            <img src=ViewImage?id=<%=id%> alt="image not found"/>
            <div class="details">
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
                <p>
                    Rating: ⭐️⭐️⭐️⭐️⭐️
                </p>
                <a href="controller.jsp?action=addToCart&id=<%= id %>"><button>Add to Cart</button></a>
            </div>
        </div>
        <%
//           HttpSession sess = request.getSession(false);
           Boolean userType = (Boolean)sess.getAttribute("userType");
           if(userType) {
        %>
                <div class="operations">
                    <a href="controller.jsp?action=deleteProduct&id=<%= id %>"><button class="delete_btn">Delete</button></a>
                    <a href="controller.jsp?action=viewUpdateProduct&id=<%= id %>"><button class="update_btn">Update</button></a>
                </div>
        <%
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        %>

    </body>
</html>
