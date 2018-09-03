/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import dto.EmployeeReportDTO;
import dto.EmployeeTRReportDTO;
import dto.EmployeeSalaryReportDTO;
import dto.EmployeeSalaryViewDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import service.EmployeeSalaryReportService;
import service.EmployeeService;

/**
 *
 * @author ASUS
 */
public class EmployeeReportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, JRException {
        response.setContentType("application/pdf;charset=UTF-8");
        try {

            String type = request.getParameter("type");
            String rType = request.getParameter("reporttype");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sri_lanka_cricket", "root", "");
            if ("salary".equals(type)) {

                EmployeeSalaryReportService employeeSalaryReportService = new EmployeeSalaryReportService();
                ArrayList<EmployeeSalaryReportDTO> allEmployee = employeeSalaryReportService.getEmployeeSalaryReportDetails(connection);

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/EmployeeSalaryReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allEmployee);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("allEmployee".equals(type)) {
                EmployeeSalaryReportService employeeSalaryReportService = new EmployeeSalaryReportService();
                ArrayList<EmployeeSalaryViewDTO> allEmployee = employeeSalaryReportService.getAllEmployee(connection);

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/AllEmpReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allEmployee);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("Contract Employees".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeReportDTO> allDepartmentContractEmployees = employeeService.getAllDepartmentContractEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentContractEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allDepartmentContractEmployees);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("All Employees".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeReportDTO> allDepartmentContractEmployees = employeeService.getAllDepartmentContractEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();
                //InputStream inputStream = this.getClass().getResourceAsStream("image/header1.jpg");
                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allDepartmentContractEmployees);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("Permanent Employees".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeReportDTO> getAllDepartmentPermanentEmployee = employeeService.getAllDepartmentPermanentEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentPermanentEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(getAllDepartmentPermanentEmployee);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();

            } else if ("Terminated Employee".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeTRReportDTO> allDepartmentTerminatedEmployees = employeeService.getAllDepartmentTerminatedEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentTerminatedEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allDepartmentTerminatedEmployees);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("Resigned Employees".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeTRReportDTO> allDepartmentResignedEmployees = employeeService.getAllDepartmentResignedEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentResignedEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allDepartmentResignedEmployees);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } else if ("Retired Employees".equals(rType)) {
                EmployeeService employeeService = new EmployeeService();
                //ArrayList<EmployeeTRReportDTO> allDepartmentRetiredEmployees = employeeService.getAllDepartmentRetiredEmployees(connection, name.getDpt_id());

                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/DepartmentRetiredEmployeesReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();

                String realPath = getServletContext().getRealPath("image/header1.jpg");

                paramerter.put("IMG", realPath);

                //JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(allDepartmentRetiredEmployees);
                //JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);

                //JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            }
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(EmployeeReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
