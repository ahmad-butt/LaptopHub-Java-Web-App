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
        <link rel="stylesheet" href="insertProduct.css" />
        
    </head>
    <body>
        <%
           HttpSession sess = request.getSession(false);
           if(sess!=null) {
                Boolean userType = (Boolean)sess.getAttribute("userType");
                if(userType) {
        %>
                    <%@include file="header.jsp" %>
                    <div>
                      <form class="form" action="controller.jsp" method="POST" enctype="multipart/form-data">
                        <h2>
                            Insert Laptop
                        </h2>
                        <div >
                            <p>Model Name: </p> <input required="true" class="form__input" type="text" name="modelName" placeholder="Enter Model Name"/>
                        </div>
                        <div>
                            <p>Company Name: </p> <input required="true" class="form__input" type="text" name="companyName" placeholder="Enter Company Name"/>

                        </div>
                        <div>
                            <p>Model Year</p> <input required="true" class="form__input" type="number" name="modelYear" placeholder="Enter Model Year"/>

                        </div>
                        <div>
                            <p>Ram: </p> <input required="true" class="form__input" type="number" name="ram" placeholder="Enter Ram"/>

                        </div>
                        <div>
                            <p>Memory: </p> <input required="true" class="form__input" type="number" name="memory" placeholder="Enter Memory"/>

                        </div>
                        <div>
                            <p>Memory Type: </p> <input required="true" class="form__input" type="text" name="memoryType" placeholder="Enter Memory Type"/>

                        </div>
                        <div>
                            <p>Processor: </p> <input required="true" class="form__input" type="text" name="processor" placeholder="Enter Processor"/>

                        </div>
                        <div>
                            <p>GPU: </p> <input required="true" class="form__input" type="text" name="gpu" placeholder="Enter Gpu"/>

                        </div>
                        <div>
                            <p>Display: </p> <input required="true" class="form__input" type="text" name="display" placeholder="Enter Display Type"/>

                        </div>
                        <div>
                            <p>Price: </p> <input required="true" class="form__input" type="number" name="price" placeholder="Enter Price"/>

                        </div>
                        <div>
                        <p>Image: </p> <input required="true" class="form__input" type="file" name="image" placeholder="Enter Image "/>

                        </div>
                        <button class="btn" name="action" value="insertProduct">Submit</button>

                    </form>
                </div>
        <%      
                } else {
                    response.sendRedirect("home.jsp");
                }
           } else {
                response.sendRedirect("login.jsp");
            }
        %>
        
        
    </body>
</html>
