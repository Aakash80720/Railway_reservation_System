<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/17/2022
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="form.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<%
if(session.getAttribute("adminname") != null){
    response.sendRedirect("admin.jsp");
}
%>
</head>
<body>
<section id="home">
    <div class="box-form">
        <div class="left">
            <div class="overlay">
                <h1>Zylker Railways</h1>
                <p>Admin Login</p>
            </div>
        </div>


        <div class="right">
            <p>Admin Access which should have the valid Admin Code please ensure that was correct !</p>
            <form action="admin" method="post">
                <div class="inputs">

                    <input class="input" placeholder="Admin Name" name="username" type="text" required>
                    <br>
                    <input class="input" placeholder="Phone Number" name="phonenumber" type="text" required>
                    <br>
                    <input class="input" placeholder="Password" name="password" type="password" required>
                    <br>
                    <input class="input" placeholder="Admin Code" name="admin_code" type="password">
                </div>
                <br><br>
                <input type="submit" value="Login" class="button">
            </form>

        </div>
    </div>
</section>
</body>
</html>
