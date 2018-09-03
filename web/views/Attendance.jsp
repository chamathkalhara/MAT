<%-- 
    Document   : Attendance
    Created on : 07-Jan-2017, 11:53:04
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="../js/LoadContent.js"></script>


    </head>
    <body>

        <div class="grid_container work_arena_adjustments">

            <h2 class="sub_heading">Attendance</h2>
            <div class="row">
                <ul class="tab">

                    <li id="addreport"><a href="" class="tablinks" >Add Report</a></li>
                    <li id="overtime"><a href="" class="tablinks" >Overtime</a></li>
                    <li id="leave"><a href="" class="tablinks" >Leave</a></li>
                </ul>
            </div>
            <div class="row" id="work_space">
                <script>

                    jQuery(function () {
                        $("#work_space").load("AddAttendanceReport.jsp");
                    });
                </script>
            </div>
        </div>

    </body>
</html>

