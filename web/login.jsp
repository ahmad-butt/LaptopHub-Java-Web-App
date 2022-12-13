
<%@ page session="false" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="login.css"/>
        <script src="./validateLogin.js" ></script>
    </head>
    <body>
        <%
           HttpSession sess = request.getSession(false);
           if(sess==null) {
        %>
        <%@include file="header.jsp" %>
            <div>
                <form onsubmit="return validate()" action="controller.jsp" name="login" class="form" method="POST">
                    <h2>
                        Login
                    </h2>
                    <div>
                        <p>Email:</p> <input class="form__input" type="text" name="email" placeholder="Enter email"/>
                        <p id="e_error"></p>
                    </div>
                    <div>
                        <p>Password:</p> <input class="form__input" type="password" name="passwd" placeholder="Enter password"/>
                        <p id="p_error"></p>
                    </div>
                    <button class="btn" name="action" value="login">Login</button>
                    <br/>
                    <a href="signup.jsp">Create Account</a>
                </form>
            </div>
        <%
           } else {
                response.sendRedirect("home.jsp");
           }
        %>
        
    </body>
</html>
