<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/15/2022
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user login</title>
    <link rel="stylesheet" href="form.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">


    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<style>
    .label{
        color: white;
        font-weight: normal;
    }
</style>
<body>
<%
    if(session.getAttribute("username") != null) {
        response.sendRedirect("home.jsp");
    }
%>
<%
    if(session.getAttribute("adminname") != null) {
        response.sendRedirect("admin.jsp");
    }
%>
<section id="home">
    <div class="box-form">
        <div class="left">
            <div class="overlay">
                <h1>Zylker Railways</h1>
                <p>Login for online Reservation</p>
            </div>
        </div>


        <div class="right">
            <p>Don't have an account? <a href="register.jsp">Create Your Account</a> it takes less than a minute</p>
            <form action="login" method="post">
                <div class="inputs">

                    <input class="input" placeholder="User Name" name="username" type="text" required>
                    <br>
                    <input class="input" placeholder="Phone Number" name="phonenumber" type="text" required>
                    <br>
                    <input class="input" placeholder="Password" name="password" type="password" required>
                    <br>
                </div>
                <br><br>
                <input type="submit" value="Login" class="button">
            </form>

        </div>

    </div>
</section>


</body>
</html>
