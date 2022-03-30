<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/23/2022
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view Available</title>
    <link rel="stylesheet" href="home.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section class ="navbar">
    <H5>Zylker Railways</H5>
    <div class="options">
        <a class="links" href="/home.jsp">home</a>
        <a class="links" href="view">View Tickets</a>
        <div style="display: flex;align-items: center;flex-direction: column" class="user">
            <h3>${username}</h3>
            <form action="logout" method="post">
                <input type="submit" value="logout" class="button">
            </form>
        </div>

    </div>
</section>
<br>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#Coach No</th>
                <th scope="col">#Seat No</th>
                <th scope="col">Seat Status</th>
                <th scope="col">Berth Position</th>
                <th scope="col">IsAvailable</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="seat" items="${available}">
                <tr id="row">
                    <th scope="row">${seat.getCoachNo()}</th>
                    <th scope="row">${seat.getSeatNo()}</th>
                    <td>${seat.getStatus()}</td>
                    <td>${seat.getBerthPostion()}</td>
                    <td>${seat.isBerthStatus()}</td>
<%--                    <script type="text/javascript">--%>
<%--                        $(document).ready(function (){--%>
<%--                            if (${seat.isBerthStatus()}){--%>
<%--                                $('#row').css('background-color', 'green');--%>
<%--                            }--%>
<%--                            else {--%>
<%--                                $('#row').css('background-color', 'red');--%>
<%--                            }--%>
<%--                        })--%>

<%--                    </script>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
