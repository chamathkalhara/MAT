<%-- 
    Document   : SystemSettings
    Created on : Nov 14, 2016, 12:59:41 PM
    Author     : sashika
--%>

<%--This jsp loads the content which is related to System Settings button
 #password changing window: UserAuthentication.jsp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="../js/LoadContent.js"></script>

        <script>
            $(document).ready(function () {
                $("#work_space").load("UserAuthentication.jsp");
            });
        </script>
    </head>
    <body>
        
        <div class="grid_container work_arena_adjustments">
            <div class="row" id="heading_sub">
            <h2>System Settings</h2></div>
            <div class="row">
                <ul class="tab">
                    <li id="user_authentication"><a href="" class="tablinks" >User Authentication</a></li>

                </ul>
            </div>
            <div class="row" id="work_space">

            </div>
        </div>

    </body>
</html>
