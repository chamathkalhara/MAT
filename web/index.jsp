<%-- 
    Document   : index
    Created on : Aug 11, 2016, 6:20:53 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LogIn</title>
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="js/main.js"></script>

        <%
            HttpSession session1 = request.getSession();
            Object msg = session1.getAttribute("msg");
            String msg2 = "";
            if (msg != null) {
                msg2 = String.valueOf(msg);
                out.print("<script>");
                out.print("alert('" + msg2 + "')");
                out.print("</script");

            }
            session1.removeAttribute("msg");
            session1.removeAttribute("employee");
            session1.removeAttribute("employeeL");
            session1.removeAttribute("user");
            session1.removeAttribute("profile");
            session1.removeAttribute("sType");

        %>

        <script>

            $(document).ready(function () {

                $("#form").on('submit', function (e) {
                    $.ajax({
                        type: "POST",
                        url: "UserController",
                        data: {name: $("#password").val(), type: "password", username: $("#username").val()},
                        success: function (result) {
                            if (result === 'false') {
                                $('#password').get(0).setCustomValidity('Username or password is incorect');
                            } else {
                                $('#password').get(0).setCustomValidity('');
                                $.ajax({
                                    type: "POST",
                                    url: "UserController",
                                    data: {password: $("#password").val(), type: "login", username: $("#username").val()},
                                    success: function (result) {
                                        window.location = result;
                                    }
                                });
                            }
                        }
                    });
                });
                
                $("#form").on('change', function (e) {
                    $.ajax({
                        type: "POST",
                        url: "UserController",
                        data: {name: $("#password").val(), type: "password", username: $("#username").val()},
                        success: function (result) {
                            if (result === 'false') {
                                $('#password').get(0).setCustomValidity('Username or password is incorect');
                            } else {
                                $('#password').get(0).setCustomValidity('');
                                
                            }
                        }
                    });
                });
                
                
                $("#password").on('keyup paste', function (e) {
                    $('#password').get(0).setCustomValidity('');
                });
                $("#username").on('keyup paste', function (e) {
                    $('#password').get(0).setCustomValidity('');
                });
            });


        </script>
    </head>
    <body>


        <div class="grid_container">
            <div class="row" id="login_header">

            </div>

            <div class="login-page">
                <div class="form">

                    <form class="login-form" id="form" onsubmit="return false">
                        <input type="hidden" name="type" value="login">
                        <input type="text" required  name="username" class="linedesign login_linedesign" id="username" placeholder="username"/>
                        <input required type="password" name="password" class="linedesign login_linedesign" id="password" placeholder="password"/>
                        <input type="submit" value="Login" id="login_btn">

                    </form>
                </div>
            </div>



        </div>
    </body>
</html>