<%-- 
    Document   : ContractRenewal
    Created on : Jan 11, 2017, 11:15:03 AM
    Author     : tajini94
--%>

<%@page import="dto.ContractDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.ContractService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/main.js"></script>
    <script src="/MAT/js/jquery.dataTables.min.js"></script>

    <style>
        td.highlight {
            font-weight: bold;
            color:red;
        }
    </style>

    <script>

        jQuery(function () {

            var table = $('#t').DataTable({
                "bRetrieddddddve": true,
                "bDestroy": true,
                "processing": true,
                "ajax": {
                    "url": "../ContractControllerNew?type=search2",
                    "type": "POST",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "employee_id"
                    }, {
                        "data": "employee_name"
                    }, {
                        "data": "contract_id"
                    }, {
                        "data": "contract_name"
                    }, {
                        "data": "start_date"
                    }, {
                        "data": "end_date"

                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="renew searchtablebutton"  type="button" ><i class="fa fa-plus"></i>'
                    }],
                "aaSorting": [[5, "asc"]],
                "createdRow": function (row, data, index) {
                    var d1 = data.end_date;

                    var d2 = d1.split('-');
                    var s3 = new Date();
                    var s4 = new Date(d2[0], d2[1], d2[2]);
                    var s5 = s3.setMonth(s3.getMonth() + 2);

                    if (s4.getTime() < s5) {
                        //$('td', row).css('background-color', 'Orange');
                        $('td', row).eq(5).addClass('highlight');

                    }
                }
            });
        });

        $('#table tbody').on('click', '.renew', function () {

            var data = table.row($(this).parents('tr')).data();
            var empid = data.employee_id;
            $('#peid').val(empid);
            $('#myModal').css('display', 'block');

        });

        $('#form').on('submit', function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $.ajax({
                type: "POST",
                url: "../EmployeeContractController",
                data: {empid: $('#peid').val(), name: $('#pctype').val(), date: $('#pdoc').val(), salary: $('#pbsalary').val(), type: "insert"},
                success: function (result) {
                    if ('true' === result) {
                        $('#myModal').css('display', 'none');
                        alert("Contract renewed");
                    } else {
                        $('#myModal').css('display', 'none');
                        alert("Contract renewed failed");
                    }
                }
            });

        });

        $('.close').click(function () {
            $('#myModal').css('display', 'none');
        });



    </script>

    <body>
        <div>
            <div class="row" id="heading_sub">
                <h2><center>Contract Renewal</center></h2></div>
            <table id="t" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style='width:10%;'>Employee Id</th>
                        <th style='width:15%;'>Employee Name</th>
                        <th style='width:10%;'>Contract Id</th>
                        <th style='width:15%;'>Contract Name</th>
                        <th style='width:15%;'>Start Date</th>
                        <th style='width:10%;'>End Date</th>
                        <th style='width:10%;'>Renew</th>


                    </tr>
                </thead>

            </table>

            <br><br>

        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">×</span>
                <p>Add Contract</p>
                <form id="form" onsubmit="return false">
                    Employee Number : <input type="text" id="peid" disabled>
                    Contract Type : <select  id="pctype" name="pctype" required>
                        <%
                            Connection connection = new DBConnection().getConnection();
                            ContractService contractService = new ContractService();
                            ArrayList<ContractDTO> list = contractService.getAllContract(connection);
                            for (ContractDTO a : list) {
                                out.print("<option>" + a.getContractName() + "</option>");
                            }
                        %>
                    </select>
                    Date of Contract : <input type="date" name="pdoc" id="pdoc" required>
                    Basic Salary : <input type="text" id="pbsalary">
                    <input type="button" value="Add Contract" id="paddcontract">
                </form>

            </div>
        </div>
    </body>
</html>