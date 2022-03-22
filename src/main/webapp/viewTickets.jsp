<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/21/2022
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Tickets</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<section class ="navbar">
    <H5>Zylker Railways</H5>
    <div class="options">
        <a class="links" href="#">home</a>
        <a class="links" href="#">View Tickets</a>
        <div style="display: flex;align-items: center;flex-direction: column" class="user">
            <h3>${username}</h3>
            <form action="logout" method="post">
                <input type="submit" value="logout" class="button">
            </form>
        </div>

    </div>
</section>
</body>
</html>
