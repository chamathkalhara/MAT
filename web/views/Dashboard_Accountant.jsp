<%-- 
    Dashboard of the receptionists
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>
	<link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
	<link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
	<script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="../js/LoadContent.js"></script>
</head>
<body class="body_font">
    
    <div class="grid_container work_arena_adjustments ">
        <div class="row"><br>
            <div class="column_seven">
                    <h1 class="dashboard_heading">Receptionist Dashboard</h1></div>
        </div>
        <br><br>
        <div class="row dashboard_components">
            <div class="column_two"></div>
            <div class="column_one loan component " id="loan">
                <i class="fa fa-file-text-o" id="dashboard_icon" ></i><br> Loans
            </div>
           
            <div class="column_one attendance component " id="attendance">
			<i class="fa fa-calendar" id="dashboard_icon" ></i><br> Attendance
            </div>
      
        </div>
          
    </div>

    
</body>
</html>