
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="dto.EmployeeViewDTO"%>
<%@page import="dto.DepartmentDTO"%>
<%@page import="dto.CadreDTO"%>
<%@page import="service.CadreService"%>
<%@page import="service.DepartmentService"%>
<%@page import="dto.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EmployeeService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="/MAT/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">

    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/jquery.dataTables.min.js"></script>
    <script src="/MAT/js/main.js"></script>
    <script>

        jQuery(function () {

            var table = $('#table').DataTable({
                "bRetrieddddddve": true,
                "bDestroy": true,
                "processing": true,
                "ajax": {
                    "url": "../EmployeeController?type=search1",
                    dataSrc: ''
                },
                "columns": [{
                        "data": "empid"
                    }, {
                        "data": "name"
                    }, {
                        "data": "nic"
                    }, {
                        "data": "dob"
                    }, {
                        "data": "status"
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

            var m = "";

            $('#table tbody').on('click', '.delete', function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();

                m = table.row($(this).parents('tr')).data();

                $('#myModal3').css('display', 'block');

            });

            $("#form3").on('submit', function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();

                var modify = $('#form3 input:checked').val();
                var empid = m.empid;

                var a = confirm("Are you sure you want to Modify this Employee?");
                if (a === true) {
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {empid: empid, modify: modify, desc: $('#desc').val(), type: "modify"},
                        success: function (result) {
                            var s = result.split(",");
                            if (s[1] === 'true') {
                                $('#myModal3').css('display', 'none');
                                if (s[0] === 'delete') {
                                    alert("Employee deleted successfully");
                                } else {
                                    alert("Employee modification successfully");
                                }
                            } else {
                                $('#myModal3').css('display', 'none');
                                alert("Employee not modifide");
                            }
                        }
                    });                 
                }
                table.ajax.reload();
            });

            $('#table tbody').on('click', '.view', function () {

                var data = table.row($(this).parents('tr')).data();
                var empid = data.empid;

                //alert(empid);
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {empid: empid, type: "view"},
                    success: function (result) {
                        var data = JSON.parse(result);

                        $.ajax({
                            type: "POST",
                            url: "../EmployeeController",
                            data: {empid: empid, type: "photo"},
                            success: function (result) {
                                $('#pht').attr('src', 'data:image/gif;base64,' + result);
                            }
                        });

                        $('#pAddress').val(data.Address);
                        $('#pGender').val(data.Gender);
                        $('#pEPF').val(data.EPFNo);
                        $('#pEmail').val(data.email);
                        $('#pPassport').val(data.PassportNo);
                        $('#pFullName').val(data.Fname + " " + data.Lname);
                        $('#myModal').css('display', 'block');
                    }
                });

            });

            $('#table tbody').on('click', '.edit', function () {
                var data = table.row($(this).parents('tr')).data();
                var empid = data.empid;
                var dept = data.department;
                var crd = data.cadre;
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {empid: empid, type: "view"},
                    success: function (result) {

                        var data = JSON.parse(result);
                        $('#address').val(data.Address);
                        $('#gender').val(data.Gender);
                        $('#epfno').val(data.EPFNo);
                        $('#email').val(data.email);
                        $('#ppno').val(data.PassportNo);
                        $('#fname').val(data.Fname);
                        $('#lname').val(data.Lname);
                        $('#eno').val(data.EmpId);
                        $('#nic').val(data.NIC);
                        $('#contactno').val(data.phone);
                        $('#dob').val(data.DOB);
                        $('#cid').val(crd);
                        $('#did').val(dept);

                        $('#myModal2').css('display', 'block');
                    }
                });

            });

            $('.close').click(function () {
                $('#myModal').css('display', 'none');
                $('#myModal2').css('display', 'none');
                $('#myModal3').css('display', 'none');
            });

            $("#nic").on('keyup', function (e) {
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {name: $("#nic").val(), type: "nic"},
                    success: function (result) {
                        if (result === 'true') {
                            $('#nic').css({"border": "1px solid red"});
                            $('#nic').get(0).setCustomValidity('This nic number already exist');
                        } else {
                            $('#nic').css({"border": ""});
                            $('#nic').get(0).setCustomValidity('');
                        }

                    }
                });
            });


            $("#epfno").on('keyup', function (e) {
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {name: $("#epfno").val(), type: "epf"},
                    success: function (result) {
                        if (result === 'true') {
                            $('#epfno').css({"border": "1px solid red"});
                            $('#epfno').get(0).setCustomValidity('This epf number already exist');
                        } else {
                            $('#epfno').css({"border": ""});
                            $('#epfno').get(0).setCustomValidity('');
                        }
                    }
                });
            });

            $("#ppno").on('keyup', function (e) {
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {name: $("#ppno").val(), type: "pasport"},
                    success: function (result) {
                        if (result === 'true') {
                            $('#ppno').css({"border": "1px solid red"});
                            $('#ppno').get(0).setCustomValidity('This pasport number already exist');
                        } else {
                            $('#ppno').css({"border": ""});
                            $('#ppno').get(0).setCustomValidity('');
                        }

                    }
                });
            });

            $('#form').on('submit', function () {
                e.preventDefault();
                e.stopImmediatePropagation();
                $.ajax({
                    type: "POST",
                    url: "../EmployeeController",
                    data: {eno: $("#eno").val(), fname: $("#fname").val(), lname: $("#lname").val(), gender: $("#gender").val(), nic: $("#nic").val(), dob: $("#dob").val(), address: $("#address").val(), epfno: $("#epfno").val(), ppno: $("#ppno").val(), did: $("#did").val(), cid: $("#cid").val(), email: $("#email").val(), phone: $("#contactno").val(), type: "update1"},
                    success: function (result) {
                        if (result === 'true') {
                            alert("Employee updated");

                        } else {
                            alert("Employee update failed");
                        }
                    }
                });
                table.ajax.reload();

            });

        });


    </script>

    <body>
        <div>
            <div class="row" id="heading_sub">
                <h2><center>Search Employee</center></h2></div>
            <table id="table" class="display" cellspacing="0" width="95%">
                <thead>
                    <tr>
                        <th style='width:6%;'>Employee ID</th>
                        <th style='width:25%;'>Name</th>
                        <th style='width:10%;'>NIC</th>
                        <th style='width:15%;'>Date of birth</th>
                        <th style='width:20%;'>Status</th>
                        <th style='width:4%;' class="aligning">View more</th>
                        <th style='width:4%;'>Update</th>
                        <th style='width:4%;'>Delete</th>
                    </tr>
                </thead>

            </table>



            <div id="myModal" class="modal grid_container">

                <div class="modal-content model_int">
                    <div class="modal-header">
                        <span class="close">×</span>
                        <h2><center><strong>Employee Details</strong></center></h2>
                    </div><br>
                   
                    <div class="row">
                        <img src="" alt="images Here" class="nav_bar_image modal_image" id="pht">
                    </div><br>

                    <div class="row">
                        <div class="column_two modelname label_input">
                            Name :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pFullName" class="modal_input" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two modelname label_input">
                            Address :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pAddress" class="modal_input" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two modelname label_input">
                            Gender :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pGender" class="modal_input" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two modelname label_input">
                            EPF Number :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pEPF" class="modal_input" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_two modelname label_input">
                            Email :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pEmail" class="modal_input" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="columnn_two"></div>
                        <div class="column_two modelname label_input">
                            Passport Number :
                        </div>
                        <div class="column_four">
                            <input type="text" id="pPassport" class="modal_input" readonly>
                        </div>
                    </div>




                </div>
            </div>

            <div id="myModal2" class="modal">
                <div class="modal-content">
                    <span class="close">×</span>
                    <%
                        DBConnection dBConnection = new DBConnection();
                        Connection connection = dBConnection.getConnection();

                    %>

                    <form id="form" onsubmit="return false">
                        <div class="grid_container model_int">
                            <div class="modal-header">
                                <h2><center>Update Employee</center></h2>
                            </div><br>
                            <div class="row">
                                <div class="column_four">
                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="eno">Employee Number </label>
                                        </div>

                                        <div class="column_five">
                                            <input type="text" name="eno" id="eno" readonly>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="fname">First Name <span class="asterix">*</span> </label>
                                        </div>

                                        <div class="column_five">
                                            <input  type="text" name="fname" id="fname" required pattern="[a-zA-Z]+" placeholder="Enter First Name here">        
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="lname"> Last Name <span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five">
                                            <input  type="text" name="lname" id="lname" required pattern="[a-zA-Z]+" placeholder="Enter Last Name here">
                                        </div>
                                    </div>
                                </div> 


                            </div>


                            <div class="row">
                                <div class="column_four">


                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="nic">NIC <span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five">
                                            <input type="text" minlength ="9" maxlength="9" name="nic" id="nic" required id="NIC" pattern="[0-9]{9}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="ppno">Passport Number </label>
                                        </div>
                                        <div class="column_five">
                                            <input type="text" name="ppno" id="ppno" maxlength="8" minlength="8" pattern="[A-Z0-9]+" placeholder="Enter Passport Number here">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="epfno">EPF Number <span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five">
                                            <input type="text" name="epfno" id="epfno" maxlength="8" minlength="8" required pattern="[A-Z0-9]+" placeholder="Enter EPF Number here">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="contactno">Contact Number  </label>
                                        </div>
                                        <div class="column_five">
                                            <input type="text" name="contactno" id="contactno" maxlength="10" minlength="10" pattern= "[0-9]">
                                        </div>
                                    </div>
                                </div>


                                <div class="column_four">
                                    <div class="row">
                                        <div class="column_two label_input">
                                            <label for="address">Address <span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five">
                                            <textarea rows="6" cols="25" type="text" name="address" id="address" required placeholder="Enter  ' Number or Name , Street Name , City '  here"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="column_three label_input ">
                                            <label for="dob">Date of Birth <span class="asterix">*</span></label>
                                        </div>
                                        <div class="column_five">
                                            <input type="date" name="dob" id="dob" required width="80" class="combo_date">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_three label_input">
                                            <label for="gender">Gender <span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five adjust">
                                            <input type="radio" name="gender" id="gender" value="Male"  checked> Male
                                            <input type="radio" name="gender" id="gender" value="female"> Female
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_three label_input">
                                            <label for="email">Email </label>
                                        </div>
                                        <div class="column_five adjust">
                                            <input type="text" name="email" id="email" checked> 
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="column_three label_input">
                                            <label for="did">Department<span class="asterix">*</span> </label>
                                        </div>
                                        <div class="column_five ">
                                            <select  id="did" name="did" required>
                                                <%                                                    DepartmentService departmentService = new DepartmentService();
                                                    ArrayList<String> dNames = departmentService.getAllNames(connection);
                                                    for (String name : dNames) {
                                                %>
                                                <option><%=name%></option>

                                                <%
                                                    }

                                                %>
                                            </select>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="column_three label_input">
                                            <label for="cid">Cadre<span class="asterix">*</span></label>
                                        </div>
                                        <div class="column_five">
                                            <select  id="cid" name="cid" required>

                                                <%                                            CadreService cadreService = new CadreService();
                                                    ArrayList<String> cNames = cadreService.getAllNames(connection);
                                                    for (String name : cNames) {
                                                %>
                                                <option><%=name%></option>

                                                <%
                                                    }

                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="column_two">
                                        <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                                    </div>

                                    <input type="hidden" name="type" value="add">

                                    <div class="column_two">
                                    </div>
                                    <div class="column_two">
                                        <input type="submit" value="Update">
                                    </div>
                                    <div class="column_two">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

                <br><br>

            </div>

            <div id="myModal3" class="modal grid_container">

                <div class="modal-content model_int">
                    <div class="modal-header2">
                        <span class="close">×</span>
                        <h2><center><strong>Employee Modify</strong></center></h2>
                    </div><br>
                    <form id="form3" onsubmit="return false">
                        <div class="row">
                            <input type="radio" id="modify" name="modify" value="M">
                            Maternity
                        </div>
                        <div class="row">
                            <input type="radio" id="modify" name="modify" value="T">
                            Terminate
                        </div>
                        <div class="row">
                            <input type="radio" id="modify" name="modify" value="RS">
                            Resign
                        </div>
                        <div class="row">
                            <input type="radio" id="modify" name="modify" value="RT">
                            Retire
                        </div>
                        <div class="row">
                            <input type="radio" id="modify" name="modify" value="delete">
                            Delete<br>                           
                            <p id="font_clr">Warning.................</p>
                        </div>
                        <div class="row">
                            <textarea id="desc" cols="5" rows="4"></textarea>
                            
                        </div>
                        <div class="row">
                            <center><input type="submit" value="Modify" id="delete_btn"></center>
                        </div>
                    </form>

                </div>
            </div>
    </body>
</html>
