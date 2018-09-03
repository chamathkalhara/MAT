<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../includes/header1.jsp"%>
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/main.js"></script>

    <script>
        $(document).ready(function () {

            $("#form").on('submit', function (e) {

                $.ajax({
                    type: "POST",
                    url: "../UserController",
                    data: {userName: $("#username").val(), newPwd: $("#newpwd").val(), type: "change"},
                    success: function (result) {
                        if (result === 'false') {
                            alert("Password not changed");
                        } else {
                            $("html, body").animate({scrollTop: 0}, "slow");
                            alert("Password change successfully");
                        }
                    }
                });
            });

        });
    </script>

    <body>
        <%@include file="../includes/navigations/AdminNavigation.jsp"%><br><br>
        <div class="body">
            <form border="0">
                <h2><center>Profile Settings</center></h2>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="name">Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="name" id="name" disabled>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="uname">Username</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="uname" id="uname" disabled>
                        </div>
                    </div>

                    <div class="row">  
                        <div class="column_one label_input">
                            <label for="uemail">Email</label>
                        </div>
                        <div class="column_two">
                            <input type="email" name="uemail" id="uemail" disabled>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="ulevel">User Level</label>
                        </div>
                        <div class="column_two">
                            <input type="number" name="ulevel" id="ulevel" disabled>
                        </div>
                    </div>

                </div>
            </form>

            <br>
            <br>

            <span class="changePassword ChangePassword"> <i class="fa fa-pencil-square-o"></i> Change Password</span>

            <br>
            <br>
            <br>
            <br>

            <form border="0" class="changePasswordForm" id="form" onsubmit="return false" action="">
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="cpwd">Current  Password</label>
                        </div>
                        <div class="column_two">
                            <input type="password" name="cpwd" id="cpwd">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="newpwd">New Password</label>
                        </div>
                        <div class="column_two">
                            <input type="password" name="newpwd" id="newpwd">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="newpwd">Confirm Password</label>
                        </div>
                        <div class="column_two">
                            <input type="password" name="newpwd" id="newpwd">
                        </div>
                    </div><br>
                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">
                            <input type="submit" value="Save">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
