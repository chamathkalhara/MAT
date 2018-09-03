<%-- 
    Document   : SearchContractNew
    Created on : Jan 9, 2017, 1:54:23 PM
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
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />

    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script> 
    <script src="/MAT/js/main.js"></script>
    <script src="/MAT/js/jquery.dataTables.min.js"></script>

    <script>

        jQuery(function () {

            var table = $('#table').DataTable({
                "bRetrieddddddve": true,
                "bDestroy": true,
                "processing": true,
                "ajax": {
                    "url": "../ContractControllerNew?type=search1",
                    "type": "POST",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "contractId"
                    }, {
                        "data": "contractName"
                    }, {
                        "data": "period"
                    }, {
                        "data": "startDate"
                    }, {
                        "data": "fullDay"
                    }, {
                        "data": "shortLeave"
                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="view searchtablebutton" id="" type="button" ><i class="fa fa-eye">'
                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="edit searchtablebutton"  type="button" ><i class="fa fa-pencil">'
                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="delete searchtablebutton"  type="button" ><i class="fa fa-trash">'
                    }]

            });

            $('#table tbody').on('click', '.delete', function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();
                var data = table.row($(this).parents('tr')).data();
                var contractId = data.contractId;
                //alert(empid);
                var a = confirm("Are you sure you want to delete Contract?");
                if (a === true) {
                    $.ajax({
                        type: "POST",
                        url: "../ContractControllerNew",
                        data: {contractId: contractId, type: "delete1"},
                        success: function (result) {

                            if (result === 'true') {
                                alert("Contract deleted..!");

                            } else {
                                alert("Contract delete failed");
                            }

                        }
                    });
                    //table.row($(this).parents('tr')).remove();
                    table.ajax.reload();
                }


                //alert(data[0] + "'s salary is: " + data[ 1 ]);
            });

            $('#table tbody').on('click', '.edit', function () {
                var data = table.row($(this).parents('tr')).data();
                var contractId = data.contractId;
                var contractName = data.contractName;
                var period = data.period;
                var startDate = data.startDate;
                var fullDay = data.fullDay;
                var shortLeave = data.shortLeave;

                $('#cno').val(contractId);
                $('#full_day').val(fullDay);
                $('#short_leave').val(shortLeave);
                $('#c_name').val(contractName);
                $('#sdate').val(startDate);
                $('#period').val(period);
                $('#myModal').css('display', 'block');

            });

            $('#form').on('submit', function () {
                e.preventDefault();
                e.stopImmediatePropagation();

                $.ajax({
                    type: "POST",
                    url: "../ContractControllerNew",
                    data: {cno: $("#cno").val(), full_day: $("#full_day").val(), short_leave: $("#short_leave").val(), c_name: $("#c_name").val(), sdate: $("#sdate").val(), type: "update1"},
                    success: function (result) {
                        if ("true" === result) {
                            alert("Contract update successfully");
                        } else {
                            alert("Contract update failed");
                        }
                    }
                });
                table.ajax.reload();
            });

            $('.close').click(function () {
                $('#myModal').css('display', 'none');
                $('#myModal2').css('display', 'none');
            });

            $('#table tbody').on('click', '.view', function () {
                var data = table.row($(this).parents('tr')).data();
                var contractId = data.contractId;

                $.ajax({
                    type: "POST",
                    url: "../ContractControllerNew",
                    data: {cno: contractId, type: "allowance"},
                    success: function (result) {
                        if ("false" === result) {
                            alert("no allowances");
                        } else {
                            var data2 = JSON.parse(result);

                            //console.log(data2.length);

                            $("#allowanceTable").html("");

                            //var table = $("<table id=DynamicTable border=1></table>").appendTo("#allowanceTable");

                            var table2 = document.getElementById("allowanceTable");

                            var rowHeader = $("<tr></tr>").appendTo(table2);
                            $("<td></td>").text("Allowance Id").appendTo(rowHeader);
                            $("<td></td").text("Name").appendTo(rowHeader);
                            $("<td></td>").text("Description").appendTo(rowHeader);
                            $("<td></td>").text("Amount").appendTo(rowHeader);

                            //var i = 1;
                            //data2.forEach(function(obj) {
                            for (var i = 0; i < data2.length; i++) {
                                var row = table2.insertRow(i + 1);

                                var cell1 = row.insertCell(0);
                                var cell2 = row.insertCell(1);
                                var cell3 = row.insertCell(2);
                                var cell4 = row.insertCell(3);

                                cell1.innerHTML = data2[i]["aid"];
                                cell2.innerHTML = data2[i]["name"];
                                cell3.innerHTML = data2[i]["desc"];
                                cell4.innerHTML = data2[i]["amount"];

                            }

                            //});

                            $('#myModal2').css('display', 'block');

                        }
                    }
                });

            });

        });


    </script>

    <body>
        <div>
            <div class="row" id="heading_sub">
                <h2><center>Search Contract</center></h2></div>
            <table id="table" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style='width:10%;'>Contract Id</th>
                        <th style='width:15%;'>Contract Name</th>
                        <th style='width:10%;'>Period</th>
                        <th style='width:15%;'>Start Date</th>
                        <th style='width:10%;'>Full Day</th>
                        <th style='width:7%;'>Short Leave</th>
                        <th style='width:5%;'>View Allowances</th>
                        <th style='width:5%;'>Update</th>
                        <th style='width:5%;'>Delete</th>

                    </tr>
                </thead>

            </table>

            <br><br>

        </div>

        <div id="myModal2" class="modal">
            <div class="modal-content model_int">
                <span class="close">×</span>
                <div class="modal-header">
                    <h2><center>Allowance Details</center></h2></div><br>
                <div id="dynamicTable">

                </div>
                <table id="allowanceTable">
                    <%--tr>
                        <th>Allowance Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Amount</th>
</tr--%>

                </table>
            </div>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content model_int">
                <span class="close">×</span>
                <form border="0" id="form" onsubmit="return false">
                    <div class="modal-header">
                    <h2><center>Update Contract</center></h2></div><br>
                    <div class="grid_container">
                        <div class="row">

                            <div class="column_two label_input">
                                <label for="cno">Contract Number</label>
                            </div>
                            <div class="column_two">
                                <input type="text" name="cno" id="cno" class="col-2" readonly>
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
                                <input type="text" name="full_day" id="full_day" class="col-2" required>
                            </div>
                            <div class="column_five"></div>
                        </div>

                        <div class="row">
                            <div class="column_two label_input">
                                <label for="short_leave">Short Leave<span class="asterix">*</span></label>
                            </div>
                            <div class="column_two"> 
                                <input type="text" name="short_leave" id="short_leave" class="col-2" required>
                            </div>
                            <div class="column_five"></div>
                        </div>

                        <div class="row">
                            <div class="column_two label_input">
                                <label for="c_name">Contract Name<span class="asterix">*</span></label>
                            </div>
                            <div class="column_two"> 
                                <input type="text" name="c_name" id="c_name" class="col-2" required>
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
                            <div class="column_two"></div>
                            <div class="column_two">   
                                <input type="submit" value="Add Contract">
                            </div>
                            <div class="column_five"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>

