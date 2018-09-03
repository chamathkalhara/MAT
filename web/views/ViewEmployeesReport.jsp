

<%@page import="java.util.Collections"%>
<%@page import="dto.DepartmentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.DepartmentService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="/MAT/css/input_styles2.css" />
        <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
        <title></title>
    </head>
    <body>
        <form method="POST" action="../EmployeeReportController" target="_blank">
            <div class="grid_container">
                <div class="row" id="heading_sub">
                    <h2>Employees Report</h2></div>
                <div class="row">
                    <div class="column_four">
                        <div class="row">

                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="deptid">Department</label>
                            </div>
                            <div class="column_four">
                                <select name="deptid">
                                    <%
                                        Connection connection = new DBConnection().getConnection();
                                        DepartmentService departmentService = new DepartmentService();
                                        ArrayList<String> de = departmentService.getAllNames(connection);
                                        for (String a : de) {
                                            out.print("<option>" + a + "</option>");
                                        }
                                        Collections.sort(de);
                                    %>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="column_one">

                            </div>
                            <div class="column_three label_input">
                                <label for="reporttype">Report Type</label>
                            </div>
                            <div class="column_four">
                                <select name="reporttype">
                                    <option>All Employees</option>
                                    <option>Contract Employees</option>
                                    <option>Permanent Employees</option>
                                    <option>Terminated Employee</option>
                                    <option>Resigned Employees</option>
                                    <option>Retired Employees</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            
                            <br>
                            <div class="column_three">

                            </div>
                            <div class="column_four">
                                <input type="submit" value="Get Report" >
                            </div>

                            <div class="column_two">

                            </div>
                        </div>
                    </div>
                    <div class="column_four"></div>
                </div>            
            </div>
        </form>
    </body>
</html>
