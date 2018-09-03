<%-- 
    Document   : Appraisals
    Created on : 28-Oct-2016, 11:07:48
    Author     : Asus
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
            jQuery(function () {
                $("#work_space").load("PerformanceAppraisal.jsp");
            });
        </script>
    </head>
    <body>
        
        <div class="grid_container work_arena_adjustments">
            <!--<div class="page_nav_heading">
                <h4 class="navigation_heading"> <a href="" class="navigation_heading_link" id="navigation_home">Home</a>  >  <a href="" class="navigation_heading_link" id="navigation_appraisals">Appraisals</a> </h4> 
            </div>-->
            <h2 class="sub_heading">Appraisals</h2>
            <div class="row">
                <ul class="tab">
                    <li id="conductappraisal"><a href="" class="tablinks" >Conduct Appraisals</a></li>
                    <li id="appraisalsummary"><a href="" class="tablinks" >Overall Appraisal</a></li>
                    <li id="searchappraisal"><a href="" class="tablinks" >Search</a></li>
                    <li id="insertkpi"><a href="" class="tablinks" >KPI</a></li>
                    <li id="appraisalanalysis"><a href="" class="tablinks" >Analysis</a></li>
                </ul>
            </div>
            <div class="row" id="work_space">
                
            </div>
        </div>
        
    </body>
</html>

