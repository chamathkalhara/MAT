<%-- 
    Document   : AddEmployee
    Created on : 23-Aug-2016, 10:53:05
    Author     : Asus
--%>

<%@page import="dto.UserDTO"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="dto.UserProfileInfoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/main.js"></script>
        <%
            HttpSession session1 = request.getSession();
            UserProfileInfoDTO userProfileInfoDTO = (UserProfileInfoDTO) session1.getAttribute("profile");
            String name_user = userProfileInfoDTO.getName();
            String email = userProfileInfoDTO.getEmail();
            UserDTO userDTO = (UserDTO) session1.getAttribute("user");
            String user_name = userDTO.getUserID();
            String level_user = userDTO.getUser_Level();


        %>
        <script>
            $(document).ready(function () {
                $("#cpwd").on('keyup', function (e) {
                    $.ajax({
                        type: "POST",
                        url: "../UserController",
                        data: {name: $("#cpwd").val(), type: "password", username: $("#userName").val()},
                        success: function (result) {
                            if (result === 'false') {
                                $('#cpwd').get(0).setCustomValidity('Wrong password');
                            } else {
                                $('#cpwd').get(0).setCustomValidity('');
                            }
                        }
                    });
                });

                $("#form").on('submit', function (e) {

                    $.ajax({
                        type: "POST",
                        url: "../UserController",
                        data: {userName: $("#uname").val(), newPwd: $("#newpwd").val(), type: "change"},
                        success: function (result) {
                            if (result === 'false') {
                                alert("Password not changed");
                            } else {
                                $('#form')[0].reset();
                                $("html, body").animate({scrollTop: 0}, "slow");
                                alert("Password change successfully");
                            }
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <form action="../UserController" method="POST">
            <div class="body">
                
                <input type="hidden" name="type" value="change">
                <div class="grid_container">
                    <div class="row" id="heading_sub">
                    <h2><center>Profile Settings</center></h2></div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="name">Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="name" id="name" readonly value='<%=name_user%>'>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="uname">Username</label>
                        </div>
                        <div class="column_two">
                            <input type="hidden" name="userName" id="userName" value='<%=user_name%>'>
                            <input type="text" name="uname" id="uname" readonly value='<%=user_name%>'>
                        </div>
                    </div>

                    <div class="row">  
                        <div class="column_one label_input">
                            <label for="uemail">Email</label>
                        </div>
                        <div class="column_two">
                            <input type="email" name="uemail" id="uemail" readonly value='<%=email%>' >
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="ulevel">User Level</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ulevel" id="ulevel" readonly value='<%= level_user%>'>
                        </div>
                    </div>

                </div>
            </div>
        </form>

        <br>
        <br>

        <span class="changePassword ChangePassword dropdown"> <i class="fa fa-pencil-square-o"></i> Change Password</span>

        <br>
        <br>
        <br>
        <br>

        <form border="0" class="changePasswordForm" id="form" onsubmit="return false">
            <div class="grid_container">
                <div class="row">
                    <div class="column_two label_input">
                        <label for="cpwd">Current  Password</label>
                    </div>
                    <div class="column_two">
                        <input type="password" name="cpwd" id="cpwd">
                    </div>
                </div>
                <div class="row">
                    <div class="column_two label_input">
                        <label for="newpwd">New Password</label>
                    </div>
                    <div class="column_two">
                        <input type="password" name="newpwd" id="newpwd" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" onchange = variable.validate(this.value) title="Enter minimum of 8 characters with atleast one letter,one number and a special character.">
                    </div>
                </div>
                <div class="row">
                    <div class="column_two label_input">
                        <label for="newpwdconfirm">Confirm Password</label>
                    </div>
                    <div class="column_two">
                        <input type="password" name="newpwdconfirm" id="confnewpwd">
                    </div>
                    <div class="column_three"><span id="newpasswordMessage"></span></div>
                </div><br>
                <script>

                    $('#confnewpwd').on('keyup', function () {
                        if ($(this).val() === $('#newpwd').val()) {

                            //$('#confpwd').setCustomValidity('Password Match');
                            //document.getElementById("confpwd").setCustomValidity("This email is already used");
                            $('#newpasswordMessage').html('matching').css('color', 'green');
                        } else {
                            $('#newpasswordMessage').html('not matching').css('color', 'red');
                        }
                    });
                </script>
                <div class="row">
                    <div class="column_two"></div>
                    <div class="column_two">
                        <input type="submit" value="Save">
                    </div>
                </div>
            </div>
        </form>
    </form>
</body>

</html>
