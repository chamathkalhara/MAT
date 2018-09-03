<%-- 
    Document   : ReceptionistSearchDepartment
    Created on : 20-Sep-2016, 04:23:44
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
                            <h3>Search Department Contact details</h3>
                        </div>
                        <div class="column_four"></div>
                    </div><br>
                    <div class="row">
                        
                        <div class="column_three label_input">
                            <label for="input"> Serach by Department Name <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="input" id="input" required>
                        </div>
                        <div class="column_two">
                            <input type="submit" value="Search">
                        </div>
                </div><br><br>

                <table id="table">
                    <tr>
                        <th>Department Number</th>
                        <th>Name</th>
                        <th>Manager</th>
                        <th>Contact Details</th>
                    </tr>

                </table>

            </form>
        </div>
        <br><br>
        <hr>
        <br><br>

</html>
