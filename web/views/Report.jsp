<%-- 
    Document   : Report
    Created on : 28-Oct-2016, 11:33:21
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
        <script>
            jQuery(function() {
                $("#work_space_report").load("ViewEmployeesReport.jsp");
            });
        </script>

    </head>
    <body>
        <div class="grid_container work_arena_adjustments">
            <div class="row">
                <!--<div class="page_nav_heading">
                <h4 class="navigation_heading"> <a href="" class="navigation_heading_link" id="navigation_home">Home</a>  >  <a href="" class="navigation_heading_link" id="navigation_reports">Reports</a> </h4> 
            </div>
                -->
            
            <h2 class="sub_heading">Reports</h2>
                <div class="column_eight">
                    <ul class="tab">
                        <li id="viewempreports"><a href="" id="tablinks" >Employees</a></li>
                        <li id="viewperreports"><a href="" id="tablinks" >Personnel</a></li>
                        <li id="viewsdreports"><a href="" id="tablinks" >Strength Distribution</a></li>
                    </ul>
                </div>
            </div>
            <div class="row" id="work_space_report">

            </div>
        </div>
    </body>
</html>
