<%@page import="service.LoanService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page import="dto.LoanDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/main.js"></script>
        <script src="/MAT/js/validation.js"></script>

        <script>

            $(document).ready(function () {
                
                $("#form").on('submit', function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../LoanControllerNew2",
                        data: {loan_Id: $("#lno").val(), loan_Date: $("#ldate").val(), amount: $("#amount").val(), period: $("#time").val(), status: $("#status").val(), emp_Id: $("#eno").val(), type: "add1"},
                        success: function (result) {
                            if (result === 'true') {
                                $('#form')[0].reset();

                                var oldID = $('#lno').val();
                                var newId = parseInt(oldID.substring(3))+1;
                                $('#lno').val("LON"+newId);
                                
                                alert("New loan added success");

                            } else {
                                alert("added failed ");
                            }
                        }
                    });
                });

                $("#eno").on('keyup paste change', function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../LoanControllerNew2",
                        data: {name: $("#eno").val(), type: "empid"},
                        success: function (result) {
                            console.log("result :" +result);
                            if (result === 'true') {
                                $('#eno').get(0).setCustomValidity('This Employee number already exist');
                            } else {
                                $('#eno').get(0).setCustomValidity('');
                                $('#empname').val(result);
                            }
                        }
                    });
                });
                
            });
        </script>
    </head>

    <body>

        <div class="body">

            <%                DBConnection dBConnection = new DBConnection();
                Connection connection = dBConnection.getConnection();

                LoanService loanService = new LoanService();
                String newId = loanService.getNewId(connection);

            %>
            <form id="form" onsubmit="return false" border="0" >
                <div class="row" id="heading_sub">
                    <h2>Add New Loan</h2></div>
                <div class="grid_container">


                    <div class="row">
                        <div class="column_one label_input">
                            <label for="lno">Loan Id<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="lno" id="lno" required value='<%=newId%>' readonly>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="empname">Employee Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="empname" id="empname" >
                        </div>
                        <div class="column_one"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="eno">Employee Number<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="eno" id="eno" value="EMP">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ldate"> Issued Date<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two ">
                            <input type="date" name="ldate" id="ldate" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="amount">Amount<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="amount" id="amount" required title="Enter amount in numbers only.">
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="time">Time Period<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <select  id="time" name="time" required>
                                <option>2 Months</option>
                                <option>3 Months</option>
                                <option>4 Months</option>
                                <option>5 Months</option>
                                <option>6 Months</option>
                                <option>7 Months</option>
                                <option>8 Months</option>
                                <option>9 Months</option>
                                <option>10 Months</option>
                                <option>11 Months</option>
                                <option>12 Months</option>
                            </select>
                        </div>
                        <div class="column_five"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="status">Status<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <select  id="status" name="status" required>
                                <option>Not Completed</option>
                                <option>Completed</option>
                            </select>
                        </div>
                        <div class="column_five"></div>
                    </div>


                    <div class="row">
                        <div class="column_two">
                            <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                        </div>
                        <div class="column_six"></div>   
                    </div>

                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">    
                            <input type="submit" value="Add New Loan">
                        </div>
                        <div class="column_five"></div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>