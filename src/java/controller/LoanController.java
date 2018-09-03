/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.LoanDTO;
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
import service.LoanService;

/**
 *
 * @author sashika
 */
public class LoanController extends HttpServlet {

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
            throws ServletException, IOException,ClassNotFoundException,SQLException,Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String type = request.getParameter("type");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();
            
            LoanService loanService = new LoanService();
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sri_lanka_cricket","root","");
            
            if ("empid".equals(type)) {
                String name = request.getParameter("name");
                boolean empIdExcist = loanService.isEmpIdExcist(name, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + empIdExcist);
            }
            
            /*if ("view".equals(type)) {

                String loanId = request.getParameter("loanId");
                LoanService loanService = new LoanService();
                LoanDTO result = loanService.getLoanByLoanId(loanId, connection);

                Gson gson = new Gson();
                String lon = gson.toJson(result);
                response.setContentType("text/plain");
                response.getWriter().write(lon);
            }*/
            if("search1".equals(type)){
                LoanService lonService = new LoanService();
                ArrayList<LoanDTO> allLoan = lonService.getAllLoan(connection);

                Gson gson = new Gson();
                String lon = gson.toJson(allLoan);
                response.setContentType("text/plain");
                response.getWriter().write(lon);
            }
            if ("delete1".equals(type)) {
                String lonid = request.getParameter("loanid");
                LoanService lonService = new LoanService();
                boolean result = lonService.deleteLoan(lonid, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }
            
            if ("add1".equals(type)) {

                String Loan_Id = request.getParameter("lno");
                String Loan_Date = request.getParameter("ldate");
                String Amount = request.getParameter("amount");
                String Period = request.getParameter("time");
                String Status = request.getParameter("status");
                String Emp_Id = request.getParameter("eno");
                
                //LoanService loanService = new LoanService();
                /*CadreDTO cadreDTO = cadreService.getCadreByName(cardreName, connection);
                String cadreId = cadreDTO.getCadre_Id();

                DepartmentService departmentService = new DepartmentService();
                DepartmentDTO departmentDTO = departmentService.getDepartmentByName(deptName, connection);
                String departmentId = departmentDTO.getDpt_id();

                String[] split = photo.split("\\\\");
                */
                //File source = new File("C:\\Users\\Chamath\\Desktop/"+split[2]+"");
                //File dest = new File("web\\image\\photo");
                //File dest = new File("D:\\cs\\cs\\uni\\2nd year\\Synergy\\project\\11 7\\new\\SLCHRMS\\web\\image\\photo");
//                try {
//                    //FileUtils.copyDirectory(source, dest);
//                    FileUtils.copyFileToDirectory(source, dest);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }

                LoanDTO loanDTO = new LoanDTO(Loan_Id, Loan_Date, Amount, Period, Status, Emp_Id);

                boolean result = loanService.addLoan(loanDTO, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }

            /*
            
            if ("add".equals(type)) {
                String loanId = request.getParameter("lno");
                String loandate = request.getParameter("date");
                String amount = request.getParameter("amount");
                String period = request.getParameter("time");
                String status = request.getParameter("status");
                String empId = request.getParameter("eno");

                
                boolean idExcist = loanService.isIdExist(loanId, connection);

                LoanDTO loanDTO = new LoanDTO(loanId,loandate,amount,period,status,empId);

                String curForm = "Loan.jsp";
                HttpSession session = null;
                HttpSession session2 = request.getSession();
                UserDTO user = (UserDTO) session2.getAttribute("user");
                if (idExcist) {
                    session = request.getSession();
                    session.setAttribute("msg", loanId + "already exists");
                    session.setAttribute("loanDTO", loanDTO);
                    session.setAttribute("curForm", curForm);
                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");

                } else {
                    boolean addloan = loanService.addLoan(loanDTO, connection);

                    if (addloan) {
                        session = request.getSession();
                        String[] s = user.getUser_Level().split(" ");
                        if (s.length == 2) {
                            session2.setAttribute("curForm", "Dashboard_" + s[0] + "_" + s[1] + ".jsp");
                        } else {
                            session2.setAttribute("curForm", "Dashboard_" + s[0] + ".jsp");
                        }
                        session.setAttribute("msg", loanId + " Loan added");
                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
                    } else {
                        session2.setAttribute("msg", "Loan added failed.");
                        session2.setAttribute("curForm", curForm);
                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
                    }
                }
            }*/
            /*
            if("search1".equals(type)){
                LoanService loanService = new LoanService();
                ArrayList<LoanDTO> allLoan = loanService.getAllLoan(connection);

                Gson gson = new Gson();
                String lon = gson.toJson(allLoan);
                response.setContentType("text/plain");
                response.getWriter().write(lon);
            }
            
            if ("delete1".equals(type)) {
                String lonid = request.getParameter("loanId");
                LoanService loanService = new LoanService();
                boolean result = loanService.deleteLoan(lonid, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }
*/
            /*if ("search".equals(type)) {
                String cno = request.getParameter("cnom");
                String cname = request.getParameter("cname2");

                CadreService cadreService = new CadreService();
                CadreDTO cadreDTO = new CadreDTO();

                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                session.setAttribute("cid", cno);
                if (!cno.equals("") && cname.equals("")) {

                    cadreDTO = cadreService.getCadreByID(cno, connection);
                    if (cadreDTO.getCadre_Id() == null) {
                        session.setAttribute("msg", cno + " is not available");
                    } else {
                        //session.setAttribute("sType", "ENo");
                        session.setAttribute("cadre", cadreDTO);
                    }
                    session.setAttribute("curForm", "SearchCadre.jsp");

                } else if (!cname.equals("") && cno.equals("")) {
                    cadreDTO = cadreService.getCadreByName(cname, connection);
                    if (cadreDTO.getCadre_Id() == null) {
                        session.setAttribute("msg", cname + " is not available");
                    } else {
                        //session.setAttribute("sType", "ENo");
                        session.setAttribute("cadre", cadreDTO);
                    }
                    session.setAttribute("curForm", "SearchCadre.jsp");
                }

                response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");

            }*/
           
            /*
            if ("delete".equals(type)) {
                
                HttpSession session = request.getSession();
                String loanid = request.getParameter("loanId");
                
                LoanService loanService = new LoanService();
                boolean result = loanService.deleteLoan(loanid, connection);
                
                UserDTO user = (UserDTO)session.getAttribute("user");
                if (result) {
                    
                    session.setAttribute("msg", loanid+" Loan details deleted.");

                } else {
                    session.setAttribute("msg", loanid+" Loan details deleted failed.");
                }
                session.setAttribute("curForm", "Loan.jsp");
                response.sendRedirect("views/Work_Area_"+user.getUser_Level()+".jsp");

            }*/
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
        } catch (SQLException ex) {
            Logger.getLogger(LoanController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoanController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(LoanController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoanController.class.getName()).log(Level.SEVERE, null, ex);
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
