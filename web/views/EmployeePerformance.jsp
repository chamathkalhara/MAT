<%-- 
    Document   : EmployeePerformance
    Created on : 07-Dec-2016, 22:26:25
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            $(document).ready(function () {
                
                $("#selectNumber").on('change', function(e) {
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {number: $('#selectNumber').val(), type: "eno"},
                        success: function (result) {
                            if (result === 'false') {
                                $('#selectNumber').get(0).setCustomValidity('This employee number not exist');
                                $('#selectName').val('');
                                //alert("Employee number not exist");
                            } else {
                                $('#selectNumber').get(0).setCustomValidity('');
                                $('#selectName').val(result);
                                
                            }

                        }
                    });
                });
                
                $('#form').on('submit', function (e) {

                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {number: $('#selectNumber').val(), type: "eno"},
                        success: function (result) {
                            if (result === 'false') {
                                $('#selectNumber').get(0).setCustomValidity('This employee number not exist');
                            } else {
                                $('#selectName').val(result);
                                $('.img').attr('src', '../EmployeePerformanceController?type=' + $('#selectNumber').val() + " " + $('#selectYear').val() + '&?' + new Date().getTime());
                            }

                        }
                    });

                });
            });
        </script>

    </head>
    <body>
        
        <form id="form" onsubmit="return false">
            <div class="grid-container">
                <div class="row" id="heading_sub">
                    <h2>Employee Performance Analysis</h2></div>
                <div class="row">
                    <div class="column_three">
                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="employeenumber" >Employee Number</label>
                            </div>
                            <div class="column_four">
                                <input type="text" id="selectNumber" name="employeenumber" value="EMP" required>

                            </div>
                        </div>

                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="employeename" >Employee Name</label>
                            </div>
                            <div class="column_four">
                                <input type="text" id="selectName" name="employeename">

                            </div>
                        </div>

                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="year" >Year</label>
                            </div>
                            <div class="column_four">
                                <input type="text" id="selectYear" name="year" required>

                            </div>
                        </div>

                        <div class="row">
                            <div class="column_four">

                            </div>
                            <div class="column_three label_input">
                                <input type="submit" value="Analyze" id="analyzePerformance" class="analyze">
                            </div>
                            <div class="column_four">

                            </div>
                        </div>
                    </div>

                    <div class="column_five" id="content">

                        <img id="img" class="img playerchart" style="display: block; margin: 0 auto;">
                    </div>
                </div>
            </div>
    </form>


</body>
</html>

