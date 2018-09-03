<%-- 
    This form is used to add new employees and players.
--%>

<%@page import="dto.ContractDTO"%>
<%@page import="service.ContractService"%>
<%@page import="java.util.Collections"%>
<%@page import="dto.EmployeeDTO"%>
<%@page import="connection.DBConnection"%>
<%@page import="service.DepartmentService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.CadreService"%>
<%@page import="service.EmployeeService"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

                $("#paddcontract").on('click', function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeContractController",
                        data: {eid: $("#eno").val(), ctype: $("#pctype").val(), doc: $("#pdoc").val(), bsalary: $("#pbsalary").val(), type: "add1"},
                        success: function (result) {
                            if (result === 'true') {
                                $('#myModal').css('display', 'none');
                                $('#form')[0].reset();

                                var oldID = $('#eno').val();
                                var newId = parseInt(oldID.substring(3))+1;
                                $('#eno').val("EMP"+newId);
                                
                                alert("Contract added");

                            } else {
                                alert("added failed ");

                            }

                        }
                    });
                });

                $('#form').on('submit', function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {eno: $("#eno").val(), fname: $("#fname").val(), lname: $("#lname").val(), gender: $("#gender").val(), nic: $("#nic").val(), dob: $("#dob").val(), address: $("#address").val(), epfno: $("#epfno").val(), photo: $("#image_upload").val(), ppno: $("#ppno").val(), email: $("#email").val(), phone: $("#contactno").val(), type: "add1"},
                        success: function (result) {
                            if (result === 'true') {

                                $('#peid').val($("#eno").val());

                                $('#myModal').css('display', 'block');

                            } else {
                                alert("added failed ");
                            }

                        }
                    });
                });
                $('#form2').on('submit', function (e) {

                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $.ajax({
                        type: "POST",
                        url: "../EmployeeController",
                        data: {eno: $("#eno").val(), fname: $("#fname").val(), lname: $("#lname").val(), gender: $("#gender").val(), nic: $("#nic").val(), dob: $("#dob").val(), address: $("#address").val(), epfno: $("#epfno").val(), photo: $("#image_upload").val(), ppno: $("#ppno").val(), email: $("#email").val(), phone: $("#contactno").val(), role: $("#role").val(), keeper: $("#keeper").val(), national: $("#national").val(), cricid: $("#cricid").val(), type: "add2"},
                        success: function (result) {
                            if (result === 'true') {
                                $('#peid').val($("#eno").val());
                                $('#myModal3').css('display', 'none');
                                $('#myModal').css('display', 'block');

                            } else {
                                alert("added failed ");
                            }

                        }
                    });
                });

                $('#cid').on('change', function (e) {

                    e.preventDefault();
                    e.stopImmediatePropagation();

                    if (this.value === 'Player') {

                        if ($('form')[0].checkValidity()) {
                            $('#myModal3').css('display', 'block');
                        } else {
                            alert("Complete personal details");
                        }

                    }

                });

                $('.close').click(function () {
                    $('#myModal').css('display', 'none');
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
            });
        </script>


    </head>

    <body>

        <div class="body">


            <%
                DBConnection dBConnection = new DBConnection();
                Connection connection = dBConnection.getConnection();

                EmployeeService empService = new EmployeeService();
                String newId = empService.getNewId(connection);

            %>

            <form id="form" onsubmit="return false">
                <div class="grid_container">
                    <div class="row" id="heading_sub">
                        <h2>Add New Employee</h2>
                    </div>
                    <div class="row">
                        <div class="column_four">
                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="eno">Employee Number </label>
                                </div>


                                <div class="column_four">
                                    <input type="text" name="eno" id="eno" required  value='<%=newId%>'>
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="fname">First Name <span class="asterix">*</span> </label>
                                </div>

                                <div class="column_four">
                                    <input  type="text" name="fname" id="fname" required pattern="[a-zA-Z]+" placeholder="Enter First Name here" title="Enter letters only">        
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="lname"> Last Name <span class="asterix">*</span> </label>
                                </div>
                                <div class="column_four">
                                    <input  type="text" name="lname" id="lname" required pattern="[a-zA-Z]+" placeholder="Enter Last Name here" title="Enter letters only">
                                </div>
                            </div>
                        </div> 

                        <div class="column_four">
                            <div class="row">
                                <div class="column_one">
                                </div>
                                <div class="column_four" id="preview_image">
                                    <!--<img src="../image/user-icon.png" alt="profile" height="170" width="170" >-->
                                    <input type="file" id="image_upload">
                                    <script type="text/javascript">
                                        $(function () {
                                            $("#image_upload").on("change", function ()
                                            {
                                                var files = !!this.files ? this.files : [];
                                                if (!files.length || !window.FileReader)
                                                    return; // no file selected, or no FileReader support

                                                if (/^image/.test(files[0].type)) { // only image file
                                                    var reader = new FileReader(); // instance of the FileReader
                                                    reader.readAsDataURL(files[0]); // read the local file

                                                    reader.onloadend = function () { // set image data as background of div
                                                        $("#preview_image").css("background-image", "url(" + this.result + ")");
                                                    };
                                                }
                                            });
                                        });
                                    </script>

                                </div>
                                <div class="column_two">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="column_four">
                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="address">Address <span class="asterix">*</span> </label>
                                </div>
                                <div class="column_four">
                                    <textarea rows="6" cols="50" type="text" name="address" id="address" required placeholder="Enter Number or Name , Street Name , City here"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="nic">NIC <span class="asterix">*</span> </label>
                                </div>
                                <div class="column_four">
                                    <input type="text" minlength ="9" maxlength="9" name="nic" id="nic" required  pattern="[0-9]{9}" title="Enter the first nine numbers only">
                                </div>
                            </div>
                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="ppno">Passport Number </label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="ppno" id="ppno" maxlength="8" minlength="8" pattern="[A-Z0-9]+" placeholder="Enter Passport Number here" title="Enter the passport number specified in the document using letters and numbers only">
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="epfno">EPF Number <span class="asterix">*</span> </label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="epfno" id="epfno" maxlength="8" minlength="8" required pattern="[A-Z0-9]+" placeholder="Enter EPF Number here" title="Enter the EPF number specified in the document using capital letters and numbers only">
                                </div>
                            </div>
                            
                        </div>


                        <div class="column_four">
                            <div class="row">
                                <div class="column_three label_input ">
                                    <label for="dob">Date of Birth <span class="asterix">*</span></label>
                                </div>
                                <div class="column_four  ">
                                    <input type="date" name="dob" id="dob" required width="80" class="combo_date">
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="gender">Gender <span class="asterix">*</span> </label>
                                </div>
                                <div class="column_four adjust">
                                    <input type="radio" name="gender" id="gender" value="Male"  checked> Male
                                    <input type="radio" name="gender" id="gender" value="female"> Female
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="email">Email </label>
                                </div>
                                <div class="column_four adjust">
                                    <input type="email" name="email" id="email" checked> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="contactno">Contact Number  </label>
                                </div>
                                <div class="column_four adjust">
                                    <input type="text" name="contactno" id="contactno" maxlength="10" minlength="10" title="Enter numbers only">
                                </div>
                            </div>


                        <div class="row">
                            <div class="column_two">
                                <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                            </div>

                            <input type="hidden" name="type" value="add">

                            <div class="column_two">
                            </div>
                            <div class="column_three">
                                <input type="submit" value="Add Employee" id="add">
                            </div>
                            <div class="column_two">
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content model_int">
                <span class="close">×</span>
                <div class="modal-header">
                        <h2><center><strong>Add Contract</strong></center></h2></div><br>
                Employee Number : <input type="text" id="peid" disabled>
                Contract Type : <select  id="pctype" name="pctype" required>
                    <%                        
                        ContractService contractService = new ContractService();
                        ArrayList<ContractDTO> list = contractService.getAllContract(connection);
                        for (ContractDTO a : list) {
                            out.print("<option>" + a.getContractName() + "</option>");
                        }
                    %>
                </select>
                Date of Contract : <input type="date" name="pdoc" id="pdoc" required>
                Basic Salary : <input type="text" id="pbsalary">
                <center><input type="button" value="Add Contract" id="paddcontract"></center>

            </div>
        </div>

        <div id="myModal3" class="modal">
            <div class="modal-content model_int">
                <span class="close">×</span>
                <div class="modal-header">
                        <h2><center><strong>Add Player Details</strong></center></h2></div><br>
                <form id="form2" onsubmit="return false">
                    <div class="grid_container">
                        <div class="row">
                            <div class="column_four">
                                <div class="row">
                                    <div class="column_two label_input">
                                        <label for="did">Player Role<span class="asterix">*</span> </label>
                                    </div>
                                    <div class="column_four ">
                                        <select style="width: 280px" id="role" name="role" required>
                                            <option selected="">Please Select</option>
                                            <option>Batsman</option>
                                            <option>Bowler</option>
                                            <option>All Rounder</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="column_two label_input">
                                        <label for="wkeeper">Wicket Keeper <span class="asterix">*</span> </label>
                                    </div>
                                    <div class="column_four adjust">
                                        <input type="radio" name="wkeeper" id="keeper" value="yes"  checked> Yes
                                        <input type="radio" name="wkeeper" id="keeper" value="no"> No
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="column_two label_input">
                                        <label for="national">National <span class="asterix">*</span> </label>
                                    </div>
                                    <div class="column_four adjust">
                                        <select id="national">
                                            <option>National</option>
                                            <option>First class</option>
                                            <option>List A</option>
                                            <option>U19</option>
                                        </select>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="column_three label_input">
                                        <label for="cid">Cric ID<span class="asterix">*</span></label>
                                    </div>
                                    <div class="column_four">
                                        <input type="text" name="cricid" required id="cricid" maxlength="8" minlength="4" pattern="[0-9]+" placeholder="Enter Cric ID here">
                                    </div>

                                </div>

                            </div>
                        </div>
                        <center><input type="submit" value="Add Player" id="paddcontract"></center>
                    </div>
                </form>
                <div id="dialog-message" title="Download complete">
                    <p>
                        <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
                        Your files have downloaded successfully into the My Downloads folder.
                    </p>
                    <p>
                        Currently using <b>36% of your storage space</b>.
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>