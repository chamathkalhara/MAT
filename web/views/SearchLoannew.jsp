<%-- 
    Document   : SearchLoannew
    Created on : Jan 9, 2017, 2:49:47 PM
    Author     : sashika
--%>

<%@page import="dto.LoanDTO"%>
<%@page import="service.LoanService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="/MAT/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script charset="utf8" src="/MAT/js/jquery.dataTables.min.js"></script>
    <script src="/MAT/js/main.js"></script>


    <script>

        $(document).ready(function () {

            var table = $('#table').DataTable({
                "bRetrieddddddve": true,
                "bDestroy": true,
                "processing": true,
                "ajax": {
                    "url": "../LoanControllerNew2?type=search1",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "loan_Id"
                    }, {
                        "data": "emp_Id"
                    }, {
                        "data": "fullName"
                    }, {
                        "data": "loan_Date"
                    }, {
                        "data": "amount"
                    }, {
                        "data": "period"
                    }, {
                        "data": "status"
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
                var loanid = data.loan_Id;
                //alert(empid);
                var a = confirm("Are you sure you want to delete Loan detials?");
                if (a === true) {
                    $.ajax({
                        type: "POST",
                        url: "../LoanControllerNew2",
                        data: {loanid: loanid, type: "delete1"},
                        success: function (result) {

                            if (result === 'true') {
                                alert("Loan detials successfully deleted..!");

                            } else {
                                alert("Loan detials not deleted.!");
                            }
                            table.ajax.reload();

                        }
                    });

                }

            });


        });


    </script>

    <body>
        <div>
            <div class="row" id="heading_sub">
                <h2><center>Search Loan</center></h2></div>
            <table id="table" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style='width:10%;'>Loan ID</th>
                        <th style='width:10%;'>Employee Id</th>
                        <th style='width:20%;'>Full Name</th>
                        <th style='width:10%;'>Date</th>
                        <th style='width:15%;'>Amount</th>
                        <th style='width:10%;'>Period</th>
                        <th style='width:15%;'>Status</th>
                        <th style='width:5%;'>Update</th>
                        <th style='width:5%;'>Delete</th>
                    </tr>
                </thead>

            </table>

            <br><br>

        </div>
    </body>
</html>

