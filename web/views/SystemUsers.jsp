<%-- 
    Document   : SystemUsers
    Created on : Nov 8, 2016, 11:19:58 PM
    Author     : sashika
--%>

<%@page import="dto.UserDTO"%>
<%@page import="dto.UserProfileInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.UserService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/main.js"></script>

    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />
    <script src="/MAT/js/jquery.dataTables.min.js"></script>

    <script>

        jQuery(function () {

            var table = $('#table').DataTable({
                "bRetrieve": true,
                "bDestroy": true,
                "processing": true,
                "ajax": {
                    "url": "../UserController?type=search1",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "empid"
                    }, {
                        "data": "name"
                    }, {
                        "data": "userName"
                    }, {
                        "data": "userLevel"
                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="edit searchtablebutton"  type="button" style="background-color:Transparent;width: 1%; padding: 1px 17px 0px 0;"><i class="fa fa-pencil">'
                    }, {
                        "data": null,
                        "defaultContent":
                                '<button class="delete searchtablebutton"  type="button" style="background-color:Transparent;width: 1%; padding: 1px 17px 0px 0;"><i class="fa fa-trash">'
                    }]

            });

            $('#table tbody').on('click', '.delete', function () {

                var data = table.row($(this).parents('tr')).data();
                var empid = data.empid;
                //alert(empid);
                var a = confirm("Are you sure you want to delete this user?");
                if (a === true) {
                    $.ajax({
                        type: "POST",
                        url: "../UserController",
                        data: {empid: empid, type: "delete1"},
                        success: function (result) {

                            if (result === 'true') {
                                alert("User deleted..!");

                            } else {
                                alert("User not deleted.!");
                            }

                        }
                    });
                    //table.row($(this).parents('tr')).remove();

                }
                table.ajax.reload();

            });

            $('#table tbody').on('click', '.edit', function () {

                var data = table.row($(this).parents('tr')).data();
                var empid = data.empid;
                var uname = data.userName;
                var ulevel = data.userLevel;

                $('#user').val(uname);
                $('#ulevel').val(ulevel);

                $('#myModal').css('display', 'block');

                $('#cancel').click(function () {
                    $('#myModal').css('display', 'none');
                });

                $('#update').click(function () {
                    $.ajax({
                        type: "POST",
                        url: "../UserController",
                        data: {empid: empid, type: "update1", uname: $('#user').val(), ulevel: $('#ulevel').val()},
                        success: function (result) {

                            if (result === 'true') {
                                alert("User Updated..!");
                                $('#myModal').css('display', 'none');

                            } else {
                                alert("User not Updated.!");
                            }

                        }
                    });

                });
                table.ajax.reload();


            });

            $('.close').click(function () {
                $('#myModal').css('display', 'none');
            });




        });
    </script>


    <body>
        <div class="body">
            <div class="row" id="heading_sub">
                <h2><center>Edit User</center></h2></div>

            <table id="table" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style='width:10%;'>Employee ID</th>
                        <th style='width:30%;'>Name</th>
                        <th style='width:20%;'>Username</th>
                        <th style='width:20%;'>User Level</th>
                        <th style='width:10%;'>Update</th>
                        <th style='width:10%;'>Delete</th>
                    </tr>
                </thead>

            </table>

            <div id="myModal" class="modal">
                <div class="modal-content model_int">

                    <span class="close">×</span>
                    <div class="modal-header">
                    <h2><center>Update Users</center></h2></div><br>
                    Username : <input type="text" id="user">
                    User Level : 
                    <select id="ulevel">
                        <option>Administrator</option>
                        <option>Executive Committee</option>
                        <option>Finance HOD</option>
                        <option>HOD</option>
                        <option>Receptionist</option>
                    </select>
                    <center><input type="button" id="update" value="Update"></center>
                    <center><input type="button" id="cancel" value="Cancel"></center>

                </div>
            </div>

            <%--input type="text" id="search" placeholder="Type to search" --%>

            <%--
                DBConnection db = new DBConnection();
                Connection connection = db.getConnection();
                UserService userService = new UserService();
                ArrayList<UserDTO> list = userService.getAllUsers(connection);

                    out.print("<table id='table' class='display' cellspacing='0' width='100%'>");
                    out.print("<thead>");
                    out.print("<tr>");
                    out.print("<th style='width:10%;'>Employee ID</th>");
                    out.print("<th style='width:30%;'>Name</th>");
                    out.print("<th style='width:20%;'>UserName</th>");
                    out.print("<th style='width:20%;'>User Level</th>");
                    out.print("<th style='width:10%;'>Edit User</th>");
                    out.print("<th style='width:10%;'>Delete User</th>");

                    out.print("</tr>");
                    out.print("</thead>");

                    for (UserDTO e : list) {
                        UserProfileInfoDTO up = userService.getUserProfileInfo(e.getEmp_Id(), connection);

                        out.print("<tr>");
                        out.print("<td style='width:10%;'>" + e.getEmp_Id() + "</td>");
                        out.print("<td style='width:30%;'>" + up.getName() + "</td>");
                        out.print("<td style='width:20%;'>" + e.getUserID() + "</td>");
                        out.print("<td style='width:20%;'>" + e.getUser_Level() + "</td>");
                        out.print("<td style='width:10%;'><a><i class='fa fa-pencil'></td></a>");
                        /*out.print("<td><i class='fa fa-trash'></td>");*/
                        out.print("<td style='width:10%;'><form action='../UserController' method='POST' id = 'd'>");
                        out.print("<input type='hidden' name='username' value='" + e.getEmp_Id() + "'>");
                        out.print("<input type='hidden' name='type' value='delete'>");
                        out.print("<input class='delete' name='" + e.getEmp_Id() + "' type='button' value='' style='background-color:Transparent;width: 1%; padding: 1px 17px 0px 0;'><i class='fa fa-trash'>");
                        out.print("</form>");
                        out.print("</td>");
                        out.print("</tr>");
                    }

                    out.print("</table>");
            --%>

            <script>
                /*var $rows = $('#table tr');
                 $('#search').keyup(function () {
                 var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                 
                 $rows.show().filter(function () {
                 var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                 return !~text.indexOf(val);
                 }).hide();
                 });
                 */

            </script>
            <br><br>

        </div>
    </body>

</html>
