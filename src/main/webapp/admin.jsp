<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/23/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="home.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<%--<%--%>
<%--    if(session.getAttribute("adminname") == null){--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>
<body>
<section class ="navbar">
    <H5>Zylker Railways <br> Admin</H5>
    <div class="options">
        <a class="links" href="passengers">View Passengers</a>
        <div style="display: flex;align-items: center;flex-direction: column" class="user">
            <h3>${adminname}</h3>
            <form action="logout" method="post">
                <input type="submit" value="logout" class="button">
            </form>
        </div>

    </div>
</section>
<div class="container">
    <form id="addForm" method="post" action="add">
        <label class="card-title">Enter Number of coach to insert :</label>
        <input type="number" class="input-group" name="coach_count">
        <label class="card-title">Enter Number of cabin to insert :</label>
        <input type="number" class="input-group" name="cabin_count">
        <input type="submit" value="Add" class="btn btn-success">
    </form>
    <table>
        <tr>
            <form id="refresh" method="post" action="refresh">
                <td>Refresh the Booking</td>
                <td><input type="submit" class="btn btn-success"></td>
            </form>

        </tr>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function (){
        var form = $('#refresh');
        form.on('submit',function (e){
            e.preventDefault();
            $.ajax({
                type:form.attr('method'),
                url:form.attr('action'),
                data:form.serialize(),
                success:function (res){
                    alert(res);
                },
                error:function (res){
                    alert(res);
                }
            })
        })
    })
<%--    $(document).ready(function (){--%>
<%--        var form = ('#addForm');--%>
<%--        form.on('submit',function (e) {--%>
<%--            e.preventDefault();--%>
<%--            $.ajax({--%>
<%--                type:form.attr('method'),--%>
<%--                url:form.attr('action'),--%>
<%--                data:form.serialize(),--%>
<%--                success:function (respone){--%>
<%--                    alert(respone);--%>
<%--                },--%>
<%--                error: function (res){--%>
<%--                    alert(res)--%>
<%--                }--%>
<%--            })--%>
<%--        })--%>
<%--    })--%>
</script>
</body>
</html>
