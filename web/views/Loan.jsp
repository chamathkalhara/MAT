<%-- 
    Document   : Loan
    Created on : 28-Oct-2016, 10:56:24
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
    </head>
    <body>
        
        <div class="grid_container work_arena_adjustments">
            <!--<div class="page_nav_heading">
                <h4 class="navigation_heading"> <a href="" class="navigation_heading_link" id="navigation_home">Home</a>  >  <a href="" class="navigation_heading_link" id="navigation_loan">Loan</a> </h4> 
            </div>
            -->
            <h2 class="sub_heading">Loans</h2>
            <div class="row">
                <ul class="tab">
                    <li id="searchloan"><a href="" id="tablinks" >Search</a></li>
                    <li id="insertloan"><a href="" id="tablinks" >Insert</a></li>
                    <li id="newloandetails"><a href="" id="tablinks" >New Loan details</a></li>
                    
                </ul>
            </div>
            <div class="row" id="work_space">
               <script>
                    $(document).ready(function () {
                        $("#work_space").load("SearchLoannew.jsp");
                    });
                </script> 
            </div>
        </div>
        
    </body>
</html>

