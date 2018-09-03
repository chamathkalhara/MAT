/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.CheckLoanDetailsDTO;
import dto.EmployeeDTO;
import dto.LoanDTO;
import dto.LoanNewDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.EmployeeService;
import service.LoanService;

/**
 *
 * @author Chamath
 */
public class LoanControllerNew2 extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String type = request.getParameter("type");
            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();
            LoanService loanService = new LoanService();
            EmployeeService employeeService = new EmployeeService();
            if ("search1".equals(type)) {
                ArrayList< LoanNewDTO> allLoan = loanService.getLoanForTable(connection);
                Gson gson = new Gson();
                String loan = gson.toJson(allLoan);
                response.setContentType("text/plain");
                response.getWriter().write(loan);
            }
            if ("search2".equals(type)) {
                String empId = request.getParameter("empId");
                CheckLoanDetailsDTO empdetails = loanService.getDetailsForEmpId(empId, connection);
                Gson gson = new Gson();
                String empdetail = gson.toJson(empdetails);
                response.setContentType("text/plain");
                response.getWriter().write(empdetail);
            }
            if ("add1".equals(type)) {
                String lno = request.getParameter("loan_Id");
                String eno = request.getParameter("emp_Id");
                String date = request.getParameter("loan_Date");
                String amount = request.getParameter("amount");
                String time = request.getParameter("period");
                String status = request.getParameter("status");
                boolean result = loanService.addLoan(new LoanDTO(lno, date, amount, time, status, eno), connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }
            if ("empid".equals(type)) {
                String name = request.getParameter("name");
                boolean empIdExcist = loanService.isEmpIdExcist(name, connection);
                response.setContentType("text/plain");
                if(empIdExcist){
                    response.getWriter().write("" + empIdExcist);
                }else{
                    EmployeeDTO employeeByID = employeeService.getEmployeeByID(name, connection);
                    response.getWriter().write(employeeByID.getFname()+" "+employeeByID.getLname());
                }
                
            }
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
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoanControllerNew2.class.getName()).log(Level.SEVERE, null, ex);
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
