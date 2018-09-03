<%-- 
    This form is used to feed the attendance report to the system
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/MAT/css/jAlert.css" />
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/main.js"></script>
        <script src="/MAT/js/validation.js"></script>

        <script>
            $(document).ready(function() {

                $('#dor').on('click change', function(e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../AttendanceController",
                        data: {date: $("#dor").val(), type: "dateCheck"},
                        success: function(result) {
                            if (result === 'true') {
                                $('#dor').get(0).setCustomValidity("This date is already added");
                            } else {
                                $('#dor').get(0).setCustomValidity("");
                            }

                        }
                    });


                });

                $('#form').on('submit', function(e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../AttendanceController",
                        data: {pdfName: $('#attendance_report').val(), date: $('#dor').val(), type: "add1"},
                        success: function(result) {
                            if (result === 'false') {

                                alert("added failed");
                            } else {
                                $('#form')[0].reset();
                                alert(result + " records added successfuly");
                            }

                        }
                    });

                });

            });
        </script> 
    </head>

    <body>
        <div class="body">
            <form id="form" onsubmit="return false">
                <div class="row" id="heading_sub">
                    <h2>Add Daily Attendance Report</h2></div>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_two label_input ">
                            <label for="dor">Date of Report <span class="asterix">*</span></label>
                        </div>
                        <div class="column_four  ">
                            <input type="date" name="dor" id="dor" required width="80" class="combo_date">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two label_input ">
                            <label for="report">Upload file here <span class="asterix">*</span></label>
                        </div>
                        <div class="column_four  ">
                            <input type="file" name="report" id="attendance_report" accept="application/pdf">
                            <!--Limits only pdf files-->
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="column_two"></div>
                        <div class="column_two">   
                            <input type="submit" value="Add Report" id="addB">
                        </div>
                        <div class="column_five"></div>
                    </div>

                </div>
            </form>
        </div>

    </body>
</html>
