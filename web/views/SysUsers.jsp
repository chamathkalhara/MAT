<%-- 
    Document   : SysUsers
    Created on : Nov 10, 2016, 5:28:00 PM
    Author     : sashika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/jquery.dataTables.min.js"></script>
        <script src="../js/LoadContent.js"></script>

        <script>
            $(document).ready(function () {
                $("#work_space").load("SystemUsers.jsp");
            });
        </script>
    </head>
    <body>
        
        <div class="grid_container work_arena_adjustments">
            <div class="row" id="heading_sub">
            <h2>System Users</h2></div>
            <div class="row">
                <ul class="tab">
                    <li id="viewsystemusers"><a href="" class="tablinks" >View Users</a></li>
                    <li id="addsystemusers"><a href="" class="tablinks" >Add Users</a></li>

                </ul>
            </div>
            <div class="row" id="work_space">

            </div>
        </div>

    </body>
</html>
