/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import dto.ContractDTO;
import dto.EmployeeContractDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.ContractService;
import service.EmployeeContractService;

/**
 *
 * @author ASUS
 */
public class EmployeeContractController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String type = request.getParameter("type");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();
            
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sri_lanka_cricket", "root", "");

            EmployeeContractService employeeContractService = new EmployeeContractService();

            if ("add1".equals(type)) {
                String cType = request.getParameter("ctype");
                String doc = request.getParameter("doc");
                String bSalary = request.getParameter("bsalary");
                String eid = request.getParameter("eid");
                
                //String[] split = bSalary.split(",");
                //String newBSalary = split[0]+""+split[1];
             
                ContractService contractService = new ContractService();
                ContractDTO contractDTO = contractService.getContractByName(cType, connection);
                String cid = contractDTO.getContractId();

                EmployeeContractDTO employeeContractDTO = new EmployeeContractDTO();
                employeeContractDTO.setEmpId(eid);
                employeeContractDTO.setType(cid);
                employeeContractDTO.setDate(doc);
                employeeContractDTO.setSalary(Integer.parseInt(bSalary));

                boolean result = employeeContractService.addEmployeeContract(employeeContractDTO, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }
            
            if ("insert".equals(type)) {
                String empid = request.getParameter("empid");
                String name = request.getParameter("name");
                String salary = request.getParameter("salary");
                String date = request.getParameter("date");

                boolean result = employeeContractService.addEmployeeContract(new EmployeeContractDTO(empid, type, date, Integer.parseInt(salary)), connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }
            
            if ("add".equals(type)) {
                String cType = request.getParameter("ctype");
                String doc = request.getParameter("doc");
                String bSalary = request.getParameter("bsalary");
                String eid = request.getParameter("eid");
                
                String[] split = bSalary.split(",");
                String newBSalary = split[0]+""+split[1];
                
                
                ContractService contractService = new ContractService();
                ContractDTO contractDTO = contractService.getContractByName(cType, connection);
                String cid = contractDTO.getContractId();

                EmployeeContractDTO employeeContractDTO = new EmployeeContractDTO();
                employeeContractDTO.setEmpId(eid);
                employeeContractDTO.setType(cid);
                employeeContractDTO.setDate(doc);
                employeeContractDTO.setSalary(Integer.parseInt(newBSalary));

                boolean result = employeeContractService.addEmployeeContract(employeeContractDTO, connection);
                if (result) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Employee Contract details successfully entered!"); 
                    session.setAttribute("curForm", "Employee.jsp");
                    UserDTO user = (UserDTO)session.getAttribute("user");
                    //request.setAttribute("msg", "");
                    //RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/AddEmployee.jsp");
                    //requestDispatcher.forward(request, response);
                    response.sendRedirect("views/Work_Area_"+user.getUser_Level()+".jsp");

                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", "Error in Employee Contract insersion"); 
                    session.setAttribute("curForm", "AddEmployeeContract.jsp");
                    UserDTO user = (UserDTO)session.getAttribute("user");
                    //request.setAttribute("msg", "Error in Employee Contract insersion");
                    //RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/AddEmployeeContract.jsp");
                    //requestDispatcher.forward(request, response);
                    response.sendRedirect("views/Work_Area_"+user.getUser_Level()+".jsp");
                }
            }
            
            connection.close();
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
            Logger.getLogger(EmployeeContractController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeContractController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EmployeeContractController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeContractController.class.getName()).log(Level.SEVERE, null, ex);
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
