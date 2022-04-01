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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        <a class="links" href="home.jsp">home</a>
        <a class="links" href="viewAvailable">View Available</a>
        <div style="display: flex;align-items: center;flex-direction: column" class="user">
            <h3>${username}</h3>
            <form action="logout" method="post">
                <input type="submit" value="logout" class="button">
            </form>
        </div>

    </div>
</section>
<c:forEach var="ticket" items="${ticketList}">
    <br>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#serial No</th>
                <th scope="col">PNR Number</th>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Coach No</th>
                <th scope="col">Seat No</th>
                <th scope="col">Berth Status</th>
                <th scope="col">Berth Position</th>
                <th scope="col">Phone Number</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="passenger" items="${ticket}">
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
                    <td>
                        <form id="cancelForm" action="cancel" method="post" >
                            <input type="text" name="CNL_serialNo" value="${passenger.getSerialNumber()}" style="display: none">
                            <button type="submit" class="btn btn-danger">cancel</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
<%--            <tfoot>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <form id="cancelForm1" action="cancel" method="post" >--%>
<%--                        <input type="text" name="CNL_pnrNo" value="${passenger.getPnr_no()}" disabled style="display: none">--%>
<%--                        <button type="submit" class="btn-danger">cancel</button>--%>
<%--                    </form>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tfoot>--%>
        </table>
    </div>
</c:forEach>
</body>
</html>
