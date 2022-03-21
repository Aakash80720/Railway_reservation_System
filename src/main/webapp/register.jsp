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
    <title>Registration</title>
    <link rel="stylesheet" href="form.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<section id="home">
    <div class="box-form">
        <div class="left">
            <div class="overlay">
                <h1>Zylker Railways</h1>
                <p>New User Registration for online Reservation</p>
            </div>
        </div>


        <div class="right">
            <p>if you Already have a User account. Use <a href="login.jsp">Login</a> and book tickets</p>
            <form name="register" method="post" action="registration">
                <div class="inputs">

                    <input name="username" placeholder="User Name" type="text" title="special character and Number not Allowed" required pattern="^[a-zA-z]*$" >
                    <br>
                    <input placeholder="Age" name="age" type="text" required>
                    <br>
                    <input placeholder="Phone Number" name="phonenumber" pattern="[789][0-9]{9}" type="tel" required>
                    <br>
                    <input id="password" name="password" placeholder="Password" title="password Not acceptable" type="text" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&_]).{8,16}$">
                    <br>
                    <input id="confirm_password" placeholder="Confirm Password"  name="confirm_password" type="text" required>
                    <span id='message'></span>
                </div>
                <br>
                <input type="submit" value="Register" class="button">
            </form>

        </div>

    </div>
</section>
<%--<h1 style="text-align: center">Registration</h1>--%>
<%--<div class="form">--%>
<%--    <form name="register" method="post" action="registration">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>UserName : </td>--%>
<%--                <td><input name="username" type="text" title="special character and Number not Allowed" required pattern="^[a-zA-z]*$" ></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Age : </td>--%>
<%--                <td><input name="age" type="text" required></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Phone Number : </td>--%>
<%--                <td><input name="phonenumber" pattern="[789][0-9]{9}" type="tel" required></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>password : </td>--%>
<%--                <td><input id="password" name="password" title="password Not acceptable" type="text" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&_]).{8,16}$"></td>--%>
<%--                <td><p id="smap"></p></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Confirm password : </td>--%>
<%--                <td><input id="confirm_password"  name="confirm_password" type="text" required></td>--%>
<%--                <td></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><input type="submit" class="button" ></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>
<script type="text/javascript">
    const input = document.querySelector('input[name="password"]');

    input.addEventListener('invalid', function (event) {
        if (event.target.validity.valueMissing) {
            event.target.setCustomValidity('It aleast have 1 capital,1 small,1 special charector,1 number');
        }
    });
    $('#password,#confirm_password').on('keyup', function () {
        if (($('#password').val() === $('#confirm_password').val())) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });

</script>
</body>
</html>
