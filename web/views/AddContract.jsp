

<%@page import="dto.AllowanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.AllowanceService"%>
<%@page import="connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="service.ContractService"%>
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

                    var allVals = "";
                    $('#alli :checked').each(function () {
                        allVals = allVals + "," + $(this).val();
                    });
                    
                    console.log(allVals);
                    $.ajax({
                        type: "POST",
                        url: "../ContractControllerNew",
                        data: {cno: $("#cno").val(), full_day: $("#full_day").val(), short_leave: $("#short_leave").val(), c_name: $("#c_name").val(), sdate: $("#sdate").val(), allowance: allVals, type: "add1"},
                        success: function (result) {
                            if (result === 'true') {
                                alert("Contract added successfully");
                                $('#form')[0].reset();
                            } else {
                                alert("Contract added failed ");
                            }

                        }
                    });
                });
            });
        </script>
    </head>
    <body>

        <div class="body">
            <form border="0" id="form" onsubmit="return false">
                <div class="row" id="heading_sub">
                    <h2>Add New Contract</h2></div>
                <div class="grid_container">
                    <div class="row">
                        <%  Connection connection = new DBConnection().getConnection();
                            ContractService contractService = new ContractService();
                            String newId = contractService.getNewId(connection);
                        %>
                        <div class="column_two label_input">
                            <label for="cno">Contract Number</label>
                        </div>
                        <div class="column_two">
                            <input type="text" value='<%=newId%>' name="cno" id="cno" class="col-2" readonly>
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="period">Period </label>
                        </div>
                        <div class="column_two">    
                            <input type="text" name="period" id="period" class="col-2" value="1" readonly>
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="full_day">Full Day<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two"> 
                            <input type="text" name="full_day" id="full_day" class="col-2" required pattern="[0-9]" title="Enter numbers only as days per year." placeholder="Full day">
                        </div>
                        <div class="column_five"></div>
                    </div>

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="short_leave">Short Leave<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two"> 
                            <input type="text" name="short_leave" id="short_leave" class="col-2" required pattern="[0-9]" title="Enter numbers only as days per year." placeholder="Short leave">
                        </div>
                        <div class="column_five"></div>
                    </div>

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="c_name">Contract Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two"> 
                            <input type="text" name="c_name" id="c_name" class="col-2" placeholder="Contract name" required>
                        </div>
                        <div class="column_five"></div>
                    </div>

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="sdate">Start Date <span class="asterix">*</span></label><br>
                        </div>
                        <div class="column_two">
                            <input type="date" name="sdate" id="sdate" required>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="alw">Allowances <span class="asterix">*</span></label><br>
                        </div>
                        <div class="column_two combo_date" id="alli">

                            <%
                                AllowanceService allowanceService = new AllowanceService();
                                ArrayList<AllowanceDTO> list = allowanceService.getAllAllowance(connection);
                                for (AllowanceDTO a : list) {
                                    out.print("<input type='checkbox' value='" + a.getName() + "'>" + a.getName() + "<br>");
                                }

                            %>

                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="column_two"></div>
                        <div class="column_two">   
                            <input type="submit" value="Add Contract">
                        </div>
                        <div class="column_five"></div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>