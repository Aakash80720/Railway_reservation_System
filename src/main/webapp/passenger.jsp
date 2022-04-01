<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/24/2022
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="home.css">
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section class ="navbar">
    <H5>Zylker Railways <br> Admin</H5>
    <div class="options">
        <a class="links" href="admin">home</a>
        <div style="display: flex;align-items: center;flex-direction: column" class="user">
            <h3>${adminname}</h3>
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
                <th scope="col">#serial No</th>
                <th scope="col">PNR Number</th>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">coach No</th>
                <th scope="col">Seat No</th>
                <th scope="col">Berth Status</th>
                <th scope="col">Berth Position</th>
                <th scope="col">Phone Number</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="passenger" items="${passengers}">
                <tr>
                    <th scope="row">${passenger.getSerialNumber()}</th>
                    <td>${passenger.getPnr_no()}</td>
                    <td>${passenger.getName()}</td>
                    <td>${passenger.getAge()}</td>
                    <td>${passenger.getSeatNumber() == 0 ? '---' : passenger.getCoach_no()}</td>
                    <td>${passenger.getSeatNumber() == 0 ? '---' : passenger.getSeatNumber()}</td>
                    <td>${passenger.getBerth_status()}</td>
                    <td>${passenger.getBerthPosition()}</td>
                    <td>${passenger.getPhoneNumber()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
