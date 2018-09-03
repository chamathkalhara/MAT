
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/main.js"></script>
    </head>
    <body>
        <form border="0">

            <div class="grid_container">
                <div class="row">
                    <div class="column_one label_input">
                        <label for="empid">Employee ID</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="empid" id="empid" disabled>
                    </div>
                    <div class="column_one"></div>
                    <div class="column_one label_input">
                        <label for="userid">Username</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="userid" id="userid" disabled>
                    </div>
                </div>
                <div>
                    <div class="column_one label_input">
                        <label for="Fname">First Name</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="Fname" id="Fname" disabled>
                    </div>
                    <div class="column_one"></div>
                    <div class="column_one label_input">
                        <label for="Lname">Last Name</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="Lname" id="Lname" disabled>
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
    </body>
</html>
