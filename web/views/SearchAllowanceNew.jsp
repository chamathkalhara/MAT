<%--
    Document   : SearchAllowanceNew
    Created on : Jan 12, 2017, 8:15:18 AM
    Author     : tajini94
--%>

<%@page import="dto.AllowanceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.AllowanceService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.css" />
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
                    "url": "../AllowanceControllerNew?type=search1",
                    "type": "POST",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "aid"
                    }, {
                        "data": "name"
                    }, {
                        "data": "desc"
                    }, {
                        "data": "amount"
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
                var allowanceId = data.allowanceId;
                //alert(empid);
                var a = confirm("Are you sure you want to delete Contract?");
                if (a === true) {
                    $.ajax({
                        type: "POST",
                        url: "../AllowanceController",
                        data: {allowanceId: allowanceId, type: "delete1"},
                        success: function (result) {

                            if (result === 'true') {
                                alert("Allowance deleted..!");

                            } else {
                                alert("Allowance delete failed");
                            }

                        }
                    });
                    //table.row($(this).parents('tr')).remove();
                    table.ajax.reload();
                }


                //alert(data[0] + "'s salary is: " + data[ 1 ]);
            });

        });


    </script>

    <body>
        <div>
            <div class="row" id="heading_sub">
                <h2><center>Search Allowance</center></h2></div>
            <table id="table" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style='width:10%;'>Allowance Id</th>
                        <th style='width:20%;'>Name</th>
                        <th style='width:50%;'>Description</th>
                        <th style='width:15%;'>Amount</th>
                        <th style='width:5%;'>Update</th>
                        <th style='width:5%;'>Delete</th>

                    </tr>
                </thead>

            </table>

            <br><br>

        </div>


    </body>
</html>
