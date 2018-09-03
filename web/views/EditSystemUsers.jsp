

<%@page import="dto.UserDTO"%>
<%@page import="dto.UserProfileInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.UserService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/main.js"></script>
    <script src="../js/validation.js"></script>
    <body>
        <div class="body">
            <form action="../UserController" class="newUserForm" method="POST" border="0">
                <div class="row" id="heading_sub">
                    <h2>Add New User</h2></div>
                <input type="hidden" name="type" value="add">
                <div class="grid_container">
                    <div class="row">
                        <div class ="column_two">
                            <h4>User Details</h4></div>
                        <div class ="column_two">
                        </div>
                        <div class ="column_two">
                            <h4>Employee Details</h4></div>
                        <div class ="column_two">
                        </div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="empno">Employee Number<span class="asterix">*</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="empno" id="empno" value="EMP" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="empname">Employee Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="empname" id="empname" >
                        </div>
                        <div class="column_one"></div>

                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="uname">Username<span class="asterix">*</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="uname" id="uname" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="dept">Department</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="dept" id="dept" >
                        </div>
                        <div class="column_one">  
                        </div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ulevel">User Level<span class="asterix">*</label>
                        </div>
                        <div class="column_two">
                            <select name="ulevel" id="ulevel" required>
                                <option>Administrator</option>
                                <option>Director</option>
                                <option>Accountant</option>
                            </select>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="crd">Cadre</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="crd" id="crd">
                        </div>
                        <div class="column_one"></div>

                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="pwd">Password<span class="asterix">*</label>
                        </div>
                        <div class="column_two">
                            <input type="password" name="pwd" id="pwd" required pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" title="Enter minimum of 8 characters with atleast one letter,one number and a special character.">
                        </div>
                        <div class="column_one"></div>


                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="confpwd">Confirmation Password<span class="asterix">*</label>
                        </div>
                        <div class="column_two">
                            <input type="password" name="confpwd" id="confpwd" required><span id="passwordMessage"></span>
                        </div>
                        <div class="column_one">
                            <span id="passwordMessage"></span>
                        </div>

                        <script>

                            $('#confpwd').on('keyup', function () {
                                if ($(this).val() === $('#pwd').val()) {

                                    //$('#confpwd').setCustomValidity('Password Match');
                                    //document.getElementById("confpwd").setCustomValidity("This email is already used");
                                    $('#passwordMessage').html('matching').css('color', 'green');
                                } else {
                                    $('#passwordMessage').html('not matching').css('color', 'red');
                                }
                            });
                        </script>



                    </div>

                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">
                            <input type="submit" value="Add" ><br>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>
