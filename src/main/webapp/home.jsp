<%--
  Created by IntelliJ IDEA.
  User: aakash-pt4604
  Date: 3/17/2022
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="csrf" th:content="${_csrf.token}"/>
    <link rel="stylesheet" href="home.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<%
//   response.setHeader("Cache-Control","no-cache,no-store,must-validate");
%>
<section class ="navbar">
    <H5>Zylker Railways</H5>
    <div class="options">
        <a class="links" href="home.jsp">home</a>
        <a class="links" href="view">View Tickets</a>
        <a class="links" href="viewAvailable">view Available</a>
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
    <div class="search_block">
        <h2>Search through the PNR Number :</h2>
        <form id="register_form" action="search" method="post">
            <input style="outline-width: 0" class="fa-2x"
                   type="tel" name="search"
                   title="PNR number must have 7 digits number" pattern="[0-9]{7}"
                   required/>
            <button class="fa-2x" type="submit" >
                search
            </button>
        </form>
    </div>
    <span id="smap"></span>
</div>
<br>
<div id="search_details" class="container">
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
                <td>${passenger.getCoach_no()}</td>
                <td>${passenger.getSeatNumber()}</td>
                <td>${passenger.getBerth_status()}</td>
                <td>${passenger.getBerthPosition()}</td>
                <td>${passenger.getPhoneNumber()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<br>
<div class="container">
    <form method="post" action="booking" id="booking_form">
            <table class="table table-bordered table-striped" id="user_table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Phone Number</th>
                    <th>Berth Preference</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody id="passenger_input">

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2" align="right">
                        &nbsp;
                    </td>
                    <td>
                        <input class="btn btn-primary" type="submit" id="Book" value="Book Ticket" />
                    </td>
                </tr>
                </tfoot>
            </table>
    </form>

</div>
<script type="text/javascript">
    $(document).ready(
        function (){
            var  count = 1;
            dynamic_field(count);
            function dynamic_field(number){
                var html = '<tr>';
                html += '<td><input type="text" name="passenger_name" ' +
                    'class="form-control" </td>';
                html += '<td><input type="number" name="passenger_age" ' +
                    'class="form-control" </td>';
                html += '<td><input type="text" name="passenger_phoneNumber" ' +
                    'class="form-control" </td>';
                html += '<td>' +
                    '<select class="form-select" id="preference" name="berth" required>'
                    +'<option value="any">any</option>'
                    +'<option value="UB">UB</option>'
                    +'<option value="MB">MB</option>'
                    +'<option value="LB">LB</option>'
                    +'<option value="SU">SU</option>'
                    +'<option value="SL">test</option>'
                    +'</select></td>'
                if (number > 1){
                    html += '<td><button type="button" name="remove"' +
                        ' id="remove" class="btn btn-danger">remove</button> </td></tr>';
                    $('#passenger_input').append(html);
                }
                else {
                    html += '<td><button type="button" name="add"' +
                        ' id="add" class="btn btn-success">add</button></td></tr>';
                    $('#passenger_input').html(html);
                }
            }
            $(document).on('click','#add',function (){
                count++;
                dynamic_field(count);
            });
            $(document).on('click','#remove',function (){
                count--;
                dynamic_field(count);
            });
        }
    )
    $(document).ready(
        function () {
            var form = $("#booking_form");
            form.on('submit',function (e) {
                e.preventDefault();
                $.ajax({
                    type:form.attr('method'),
                    url:form.attr('action'),
                    data:form.serialize(),
                    success:function (respone) {
                        if (respone === "true"){
                            var result = "Ticket has been Booked";
                            alert(result);
                        }
                        else {
                            var result = "Ticket has been Booked" ;
                            alert(result);
                        }
                    },
                    error: function (x, e) {
                        alert(x.responseText);
                    }
                })
                return false;
            });
        }
    );
    $(document).ready(
        function () {
            var form = $("#register_form");
            form.on('submit',function (e) {
                e.preventDefault();
                $.ajax({
                    type:form.attr('method'),
                    url:form.attr('action'),
                    data:form.serialize(),
                    success:function (respone) {
                        if (respone === "true"){
                            var result = "PNR Not Found";
                            $('#smap').text(result);

                        }
                        else {
                            var result = "PNR Found successfully!!!" ;
                            $('#smap').text(result);
                        }

                    },
                    error: function (x, e) {
                        $("#smap").text(x.responseText);
                        alert(x.responseText);
                    }
                })
                return false;
            });
        }
    );

</script>
</body>
</html>
