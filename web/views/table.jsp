<%-- 
    Document   : table
    Created on : Oct 30, 2016, 9:53:14 AM
    Author     : Chamath
--%>

<%@page import="dto.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EmployeeService"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            DBConnection db = new DBConnection();
            Connection connection = db.getConnection();
            EmployeeService employeeService = new EmployeeService();
            ArrayList<EmployeeDTO> list = employeeService.getAllEmployee(connection);
            out.print("<table>");
            out.print("<tr>");
            out.print("<th>ID</th>");
            out.print("<th>NAME</th>");
            out.print("<th>GENDER</th>");
            out.print("</tr>");

            for (EmployeeDTO e : list) {
                out.print("<tr>");
                out.print("<td>"+e.getEmpId()+"</td>");
                out.print("<td>"+e.getFname()+" "+e.getLname()+"</td>");
                out.print("<td>"+e.getGender()+"</td>");
                out.print("</tr>");
            }
            
            out.print("</table>");
        %>
    </body>
</html>
