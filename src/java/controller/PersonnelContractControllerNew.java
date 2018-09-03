/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import connection.DBConnection;
import dto.PersonnelContractDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import service.PersonnelContractService;

/**
 *
 * @author Asus
 */
public class PersonnelContractControllerNew extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("application/pdf;charset=UTF-8");
        try {
            String rType = request.getParameter("reporttype");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            if (rType.equals("Contract Details")) {
                
                                
                PersonnelContractService pcService = new PersonnelContractService();
                
                String empid = request.getParameter("emp_id");
                ArrayList<PersonnelContractDTO> getAllPersonnelContract = pcService.getAllPersonnelContract(connection, empid);
                
                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/PersonnelContractReeport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();
                
                JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(getAllPersonnelContract);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);
                
                ServletOutputStream outputStream = response.getOutputStream();
                JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
                outputStream.flush();
                outputStream.close();
                            }
            if (rType.equals("Salary Details")) {
                System.out.println("1");
                                
                PersonnelContractService pcontractService = new PersonnelContractService();
                System.out.println("2");
                String empid = request.getParameter("emp_id");
                ArrayList<PersonnelContractDTO> getAllSalaryDetails = pcontractService.getAllSalaryDetails(connection, empid);
                System.out.println("3");
                JasperReport jr = JasperCompileManager.compileReport(getServletContext().getRealPath("reports/SalaryDetailsReport.jrxml"));
                //JasperReport jr = JasperCompileManager.compileReport("G:\\uni\\2nd year\\Synergy\\project\\2016 9 12\\SLCHRMS\\src\\java\\reports\\EmployeeSalaryReport.jrxml");
                Map<String, Object> paramerter = new java.util.HashMap<>();
                System.out.println("4");
                JRBeanCollectionDataSource jrCollection = new JRBeanCollectionDataSource(getAllSalaryDetails);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jr, paramerter, jrCollection);
                System.out.println("5");
                ServletOutputStream outputStream = response.getOutputStream();
                JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
                outputStream.flush();
                outputStream.close();
                System.out.println("6");
                            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
