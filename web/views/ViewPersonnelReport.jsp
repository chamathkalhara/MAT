<%-- 
    Document   : ViewEmployeeReport
    Created on : 29-Nov-2016, 04:50:41
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script>
            $(document).ready(function () {
                
                $("#selectENumber").on('change paste', function(e) {
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {number: $('#selectENumber').val(), type: "eno"},
                        success: function (result) {
                            if (result === 'false') {
                                $('#selectENumber').get(0).setCustomValidity('This employee number does not exist!');
                                $('#selectEName').val('');
                                //alert("Employee number not exist");
                            } else {
                                $('#selectENumber').get(0).setCustomValidity('');
                                $('#selectEName').val(result);
                                
                            }

                        }
                    });
                });
        </script>
            
    </head>
    <body>
        <form method="POST" action="../PersonnelContractControllerNew" target="_blank">
            <div class="grid_container">
                <div class="row" id="heading_sub">
                    <h2> Customize Personnel Report</h2></div>
                <div class="row">
                    <div class="column_four">
                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="emp_id">Employee Number</label>
                            </div>
                            <div class="column_four">
                                <input  type="text" name="emp_id" id="selectENumber" value="EMP">
                            </div>
                        </div>


                        <div class="row">

                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="empname">Employee Name</label>
                            </div>
                            <div class="column_four">
                                <input  type="text" name="empname" id="selectEName">
                            </div>
                        </div>

                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="reporttype">Report Type</label>
                            </div>
                            <div class="column_four">
                                <select  name="reporttype">
                                    <option>Contract Details</option>
                                    <option>Salary Details</option>
                                    <!--<option>Promotion Details</option>
                                    <option>Performance Details</option>
                                    <option>All</option>-->
                                </select>
                            </div>
                        </div><br>
                        
                        <div class="row">
                            <div class="column_three">

                            </div>
                            <div class="column_four">
                                <input type="submit" value="Get Report">
                            </div>
                            
                            <div class="column_two">

                            </div>
                        </div>
                    </div>
                    <div class="column_four"></div>
                </div>            
            </div>
        </form>

    </body>
</html>
