<%-- 
    Document   : Contract
    Created on : 07-Jan-2017, 10:20:10
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
            jQuery(function () {
                $("#work_space").load("ContractRenewal.jsp");
            });
        </script>
    </head>
    <body>

        <div class="grid_container work_arena_adjustments">
            <!--<div class="page_nav_heading">
                <h4 class="navigation_heading"> <a href="" class="navigation_heading_link" id="navigation_home">Home</a>  >  <a href="" class="navigation_heading_link" id="navigation_contract">Contract</a> </h4> 
            </div>
            -->

            <h2 class="sub_heading">Contract</h2>
            <div class="row">
                <ul class="tab">
                    <li id="contractrenewal"><a href="" id="tablinks" >Contract Renewal</a></li>
                    <li id="searchcontract"><a href="" id="tablinks" <%--onclick="openTab(event, 'User_Set')"--%> >Search</a></li>
                    <li id="insertcontract"><a href="" id="tablinks" >Insert</a></li>
                    <li id="contractevaluation"><a href="" id="tablinks" >Contract Evaluation</a></li>

                </ul>
            </div>
            <div class="row" id="work_space">

            </div>
        </div>

    </body>
</html>
