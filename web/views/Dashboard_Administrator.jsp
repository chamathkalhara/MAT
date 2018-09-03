<%-- 
    Document   : Dashboard
    Created on : 27-Oct-2016, 16:21:24
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>
	<link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
	<link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
	<script src="/MAT/js/jquery.min.js"></script>     
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="../js/LoadContent.js"></script>
</head>
<body class="body_font">
    
    <div class="grid_container work_arena_adjustments ">
        <div class="row">
            <div class="column_seven">
                    <h1 class="dashboard_heading">Administrator Dashboard</h1></div>
        </div>
        <br><br><br>
        <div class="row dashboard_components">
            <div class="column_two employee component " id="employee">
                <i class="fa fa-users" id="dashboard_icon" ></i><br> Employee
            </div>
            <!-- <div class="column_one departments component " id="department">
                <i class="fa fa-university" id="dashboard_icon" ></i><br> Departments
            </div>
            <div class="column_one cadre component " id="cadre">
                <i class="fa fa-files-o" id="dashboard_icon"></i></i><br> Cadre
            </div>
            <div class="column_one contract component " id="contract">
                <i class="fa fa-pencil" id="dashboard_icon" id="dashboard_icon"></i><br> Contract
            </div> -->
            <div class="column_two leave component " id="allowance">
			<i class="fa fa-hourglass-start" id="dashboard_icon" ></i><br> Allowance
            </div>
            <div class="column_two loan component " id="loan">
                <i class="fa fa-file-text-o" id="dashboard_icon" ></i><br> Loans
            </div>
            
        </div>
        
        <br>
        <div class="row dashboard_components">
            
            <div class="column_two attendance component " id="attendance">
			<i class="fa fa-calendar" id="dashboard_icon" ></i><br> Attendance
            </div>
            
            <div class="column_two appraisals component " id="appraisals">
			<i class="fa fa-trophy" id="dashboard_icon" ></i><br>  Appraisals
            </div>
            <!-- <div class="column_one player component " id="player">
			<i class="fa fa-male" id="dashboard_icon" ></i><br>  Players
            </div> -->
            <div class="column_two reports component " id="reports">
                <i class="fa fa-line-chart" id="dashboard_icon"></i><br> Reports
            </div>
        
            
        </div>
          
    </div>

    
</body>
</html>