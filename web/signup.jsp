<!DOCTYPE html>
<%@ page session="false" %>
<%@page contentType="text/html" %>
<%@page errorPage="error.jsp" %>
<html>
    <head>
        <title>Signup</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="signup.css"/>
        <script src="./validateSignup.js" ></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div>
            <form onsubmit="return validate()" action="controller.jsp" name="signup" class="form">
                <h2>
                    Signup
                </h2>
                <div class="temp">
                    <p>Username: </p> <input class="form__input" type="text" name="username" placeholder="Enter username"/>
                    <p id="u_error"></p>
                </div>
                <div>
                    <p>Email: </p> <input class="form__input" type="text" name="email" placeholder="Enter email"/>
                    <p id="e_error"></p>
                </div>
                <div>
                    <p>Password:</p> <input class="form__input" type="password" name="passwd" placeholder="Enter password"/>
                    <p id="p_error"></p>
                </div>
                <div>
                    <p>Confirm Password:</p> <input class="form__input" type="password" name="c_passwd" placeholder="Enter password"/>
                    <p id="cp_error"></p>
                </div>
                <div>
                    <p>Age: </p> <input class="form__input" type="number" name="age" placeholder="Enter age"/>
                    <p id="a_error"></p>
                </div>
                <div>
                    <p>Phone no: </p> <input class="form__input" type="text" name="phone" placeholder="Enter phone"/>
                    <p id="ph_error"></p>
                </div>
                <button class="btn" name="action" value="signup">Signup</button>
                <a href="login.jsp">Already have an account?</a>
            </form>
        </div>
    </body>
</html>
