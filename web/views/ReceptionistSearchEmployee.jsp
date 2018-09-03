<%-- 
    Document   : ReceptionistEmployeeSearch
    Created on : 20-Sep-2016, 04:22:35
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../includes/header1.jsp"%>
    <script src="/MAT/js/main.js"></script>
    <body>
        <%@include file="../includes/navigations/ReceptionistNavigation.jsp"%><br><br>


        <div class="body">


            <form action="../EmployeeController" method="POST">

                <input type="hidden" value="search" name="type">

                <div class="grid_container">

                    <div class="row">

                        <div class="column_four">
                            <h3>Search Employee details by selecting specific criteria</h3>
                        </div>
                        <div class="column_four"></div>
                    </div><br>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="search"> Search by <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two">
                            <select  id="search" name="search" required>
                                <option>Employee Number</option>
                                <option>Employee Name</option>
                                <option>Department</option>
                                <option>Born Before given date</option>
                                <option>Age</option>
                                <option>Cadre</option>
                            </select>
                        </div>
                        <div class="column_one label_input">
                            <label for="input"> Input <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="input" id="input" required>
                        </div>

                    </div><br>
                    <div class="row">
                        <div class="column_two label_input"></div>
                        <div class="column_two label_input">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </div><br><br>

                <table id="table">
                    <tr>
                        <th>Employee Number</th>
                        <th>Employee Name</th>
                        <th>NIC</th>
                    </tr>

                </table>

            </form>
        </div>
        <br><br>
        <hr>
        <br><br>


        <div class="search-body" id="search-body">
            <h2><center>Employee Details</center></h2><br><br>
            <form action="" method="POST" border="0" >
                <div class="row">
                    <div class="column_one label_input">
                        <label for="enum">Employee Number</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="enum" id="enum" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>

                <div class="row">
                    <div class="column_one label_input">
                        <label for="fname">First Name</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="fname" id="fname" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>

                <div class="row">
                    <div class="column_one label_input">
                        <label for="lname"> Last Name</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="lname" id="lname" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="gender">Gender</label>
                    </div>
                    <div class="column_two">
                        <select name="gender" id="gender" disabled="true">
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="nic">NIC</label>
                    </div>
                    <div class="column_two">
                        <input type="text" min="9" max="9" name="nic" id="nic" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="dob">Date of Birth</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="dob" id="dob" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="address">Address</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="address" id="address" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="epfno">EPF Number</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="epfno" id="epfno" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">    
                        <label for="ppno">Passport Number</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="ppno" id="ppno" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="did">Department ID</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="did" id="did" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one label_input">
                        <label for="cid">Cadre ID</label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="cid" id="cid" disabled="true">
                    </div>
                    <div class="column_five"></div>
                </div>

                <div class="row">
                    <div class="column_one"></div>
                    <div class="column_two">
                        <input type="button" value="Update" id="updatebtn_emp" onclick="changeEmValue()">
                    </div>
                    <div class="column_five"></div>
                </div>
                <div class="row">
                    <div class="column_one"></div>
                    <div class="column_two"><input type="submit" value="Delete">
                    </div>
                    <div class="column_five"></div>
                </div>

            </form>
        </div>



    </form>



    <%
        String sType = (String) request.getAttribute("sType");
        if ("ENo".equals(sType)) {
            EmployeeDTO employeeDTO = (EmployeeDTO) request.getAttribute("employee");

            if (null != employeeDTO) {
                String empNo = employeeDTO.getEmpId();
                String fName = employeeDTO.getFname();
                String lName = employeeDTO.getLname();
                String adrs = employeeDTO.getAddress();
                String CID = employeeDTO.getCardreId();
                String DOB = employeeDTO.getDOB();
                String DID = employeeDTO.getDeptId();
                String epfNo = employeeDTO.getEPFNo();
                String email = employeeDTO.getEmail();
                String gen = employeeDTO.getGender();
                String photo = employeeDTO.getPhoto();
                String NIC = employeeDTO.getNIC();
                String ppNo = employeeDTO.getPassportNo();

                out.print("<script>");
                out.print("window.location.hash = 'search-body';");

                out.print("document.getElementById('input').value = '" + empNo + "';");
                out.print("document.getElementById('enum').value = '" + empNo + "';");
                out.print("document.getElementById('fname').value = '" + fName + "';");
                out.print("document.getElementById('lname').value = '" + lName + "';");
                out.print("document.getElementById('address').value = '" + adrs + "';");
                out.print("document.getElementById('cid').value = '" + CID + "';");
                out.print("document.getElementById('dob').value = '" + DOB + "';");
                out.print("document.getElementById('did').value = '" + DID + "';");
                out.print("document.getElementById('epfno').value = '" + epfNo + "';");
                //out.print("document.getElementById('email').value = '"+email+"';");
                out.print("document.getElementById('gender').value = '" + gen + "';");
                //out.print("document.getElementById('photo').value = '"+photo+"';");
                out.print("document.getElementById('nic').value = '" + NIC + "';");
                out.print("document.getElementById('ppno').value = '" + ppNo + "';");
                out.print("</script>");
            }
        } else if ("ENa".equals(sType)) {
            ArrayList<EmployeeDTO> empList = (ArrayList<EmployeeDTO>) request.getAttribute("employee");

            for (EmployeeDTO a : empList) {
                out.print("<script>");
                out.print("var table = document.getElementById('table');");
                out.print("var row = table.insertRow(1);");
                out.print("var cell1 = row.insertCell(0);");
                out.print("var cell2 = row.insertCell(1);");
                out.print("var cell3 = row.insertCell(2);");
                out.print("cell1.innerHTML = '" + a.getEmpId() + "';");
                out.print("cell2.innerHTML = '" + a.getFname() + " " + a.getLname() + "';");
                out.print("cell3.innerHTML = '" + a.getNIC() + "';");
                out.print("</script>");

            }
            
            
        }


    %>

</div>
<br><br>
<hr>
<br><br>
</body>
</html>
