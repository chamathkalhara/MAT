/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.EmployeeDTO;
import dto.EmployeeTableDTO;
import dto.EmployeeViewDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.EmployeeService;

/**
 *
 * @author ASUS
 */
public class EmployeeController extends HttpServlet {

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

            EmployeeService empService = new EmployeeService();

            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sri_lanka_cricket", "root", "");
            if ("nic".equals(type)) {
                String name = request.getParameter("name");
                boolean nicExcist = empService.isNicExist(name, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + nicExcist);

            }
            if ("epf".equals(type)) {
                String name = request.getParameter("name");
                boolean epfExcist = empService.isEpfExist(name, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + epfExcist);

            }
            if ("pasport".equals(type)) {
                String name = request.getParameter("name");
                boolean pasportExcist = empService.isPasswordExist(name, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + pasportExcist);

            }
            if ("eno".equals(type)) {
                String name = request.getParameter("number");
                boolean enoExcist = empService.isEmployeeIdExcist(name, connection);
                EmployeeDTO employeeDTO = empService.getEmployeeByID(name, connection);
                String fullName = "";
                if (employeeDTO != null) {
                    fullName = employeeDTO.getFname() + " " + employeeDTO.getLname();
                    HttpSession session = request.getSession();
                    session.setAttribute("employee_performance", fullName);
                }

                if (enoExcist) {
                    response.setContentType("text/plain");
                    response.getWriter().write("" + fullName);
                } else {
                    response.setContentType("text/plain");
                    response.getWriter().write("" + enoExcist);
                }
            }
            if ("view".equals(type)) {

                String empId = request.getParameter("empid");
                EmployeeService employeeService = new EmployeeService();
                EmployeeViewDTO result = employeeService.getEmployeeByIDForView(empId, connection);

                HttpSession session = request.getSession();
                session.setAttribute("empPhoto", result);

                Gson gson = new Gson();
                String emp = gson.toJson(result);
                response.setContentType("text/plain");
                response.getWriter().write(emp);
            }

            if ("photo".equals(type)) {
                String empId = request.getParameter("empid");
                EmployeeService employeeService = new EmployeeService();
                EmployeeViewDTO result = employeeService.getEmployeeByIDForView(empId, connection);

                Blob img = result.getPhoto();
                byte[] imgData = img.getBytes(1, (int) img.length());
                String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));

                response.setContentType("text/plain");
                response.getWriter().write(imgDataBase64);
            }

            if ("search1".equals(type)) {

                EmployeeService employeeService = new EmployeeService();
                ArrayList<EmployeeTableDTO> employeeForTable = employeeService.getEmployeeForTable(connection);

                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                String ulevel = user.getUser_Level();

                Gson gson = new Gson();
                String emp = gson.toJson(employeeForTable);
                response.setContentType("text/plain");
                response.getWriter().write(emp);
            }

            if ("modify".equals(type)) {

                String modify = request.getParameter("modify");
                //String empId = (String)request.getSession().getAttribute("empNo");
                String empId = request.getParameter("empid");

                if (modify.equals("delete")) {
                    EmployeeService employeeService = new EmployeeService();
                    boolean result = employeeService.deleteEmployee(empId, connection);

                    response.setContentType("text/plain");
                    response.getWriter().write("delete," + result);
                }else{
                    String desc = request.getParameter("desc");
                    boolean result = empService.modifyEmployee(empId,modify,desc, connection);
                    response.setContentType("text/plain");
                    response.getWriter().write(modify+"," + result);
                    
                }

            }
            if ("delete".equals(type)) {

                //String empId = (String)request.getSession().getAttribute("empNo");
                String empId = request.getParameter("empid");
                EmployeeService employeeService = new EmployeeService();
                boolean result = employeeService.deleteEmployee(empId, connection);
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                if (result) {

                    session.setAttribute("msg", empId + " Employee deleted.");

                } else {
                    session.setAttribute("msg", empId + " Deletion failed.");
                }
                session.setAttribute("curForm", "Employee.jsp");
                response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");

            }

            if ("add1".equals(type)) {

                String empId = request.getParameter("eno");
                String fName = request.getParameter("fname");
                String lName = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String NIC = request.getParameter("nic");
                String DOB = request.getParameter("dob");
                String address = request.getParameter("address");
                String EPFNo = request.getParameter("epfno");
                String photo = request.getParameter("photo");
                String passportNo = request.getParameter("ppno");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");

                String[] split = new String[3];
                if (!photo.equals("")) {
                    split = photo.split("\\\\");
                } else {
                    split[2] = "";
                }

                //File source = new File("C:\\Users\\Chamath\\Desktop/"+split[2]+"");
                //File dest = new File("web\\image\\photo");
                //File dest = new File("D:\\cs\\cs\\uni\\2nd year\\Synergy\\project\\11 7\\new\\SLCHRMS\\web\\image\\photo");
//                try {
//                    //FileUtils.copyDirectory(source, dest);
//                    FileUtils.copyFileToDirectory(source, dest);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
                EmployeeDTO employeeDTO = new EmployeeDTO(empId, fName, lName, gender, NIC, DOB, address, EPFNo, split[2], passportNo, email, phone);

                boolean result = empService.addEmployee(employeeDTO, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }

            if ("add2".equals(type)) {

                String empId = request.getParameter("eno");
                String fName = request.getParameter("fname");
                String lName = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String NIC = request.getParameter("nic");
                String DOB = request.getParameter("dob");
                String address = request.getParameter("address");
                String EPFNo = request.getParameter("epfno");
                String photo = request.getParameter("photo");
                String passportNo = request.getParameter("ppno");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String role = request.getParameter("role");
                String keeper = request.getParameter("keeper");
                String national = request.getParameter("national");
                String cricid = request.getParameter("cricid");

                String[] split = new String[3];
                if (!photo.equals("")) {
                    split = photo.split("\\\\");
                } else {
                    split[2] = "";
                }

                //File source = new File("C:\\Users\\Chamath\\Desktop/"+split[2]+"");
                //File dest = new File("web\\image\\photo");
                //File dest = new File("D:\\cs\\cs\\uni\\2nd year\\Synergy\\project\\11 7\\new\\SLCHRMS\\web\\image\\photo");
//                try {
//                    //FileUtils.copyDirectory(source, dest);
//                    FileUtils.copyFileToDirectory(source, dest);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
                EmployeeDTO employeeDTO = new EmployeeDTO(empId, fName, lName, gender, NIC, DOB, address, EPFNo, split[2], passportNo, email, phone);

                boolean result = empService.addEmployee(employeeDTO, connection);
                boolean result2 = false;
                if (result) {
                }
                if (result && result2) {
                    response.setContentType("text/plain");
                    response.getWriter().write("true");
                } else {
                    response.setContentType("text/plain");
                    response.getWriter().write("false");
                }

            }

            if ("update1".equals(type)) {

                EmployeeService employeeService = new EmployeeService();

                String empId = request.getParameter("eno");
                String fName = request.getParameter("fname");
                String lName = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String NIC = request.getParameter("nic");
                String DOB = request.getParameter("dob");
                String address = request.getParameter("address");
                String EPFNo = request.getParameter("epfno");
                String passportNo = request.getParameter("ppno");
                String deptId = request.getParameter("did");
                String cardreId = request.getParameter("cid");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");

                EmployeeDTO employeeDTO = new EmployeeDTO(empId, fName, lName, gender, NIC, DOB, address, EPFNo, "", passportNo, email, phone);

                boolean result = employeeService.updateEmployee(employeeDTO, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }

//            if ("add".equals(type)) {
//                String empId = request.getParameter("eno");
//                String fName = request.getParameter("fname");
//                String lName = request.getParameter("lname");
//                String gender = request.getParameter("gender");
//                String NIC = request.getParameter("nic");
//                String DOB = request.getParameter("dob");
//                String address = request.getParameter("address");
//                String EPFNo = request.getParameter("epfno");
//                String photo = request.getParameter("photo");
//                String passportNo = request.getParameter("ppno");
//                String deptName = request.getParameter("did");
//                String cardreName = request.getParameter("cid");
//                String email = request.getParameter("email");
//
//                CadreService cadreService = new CadreService();
//                CadreDTO cadreDTO = cadreService.getCadreByName(cardreName, connection);
//                String cadreId = cadreDTO.getCadre_Id();
//
//                DepartmentService departmentService = new DepartmentService();
//                DepartmentDTO departmentDTO = departmentService.getDepartmentByName(deptName, connection);
//                String departmentId = departmentDTO.getDpt_id();
//
//                EmployeeDTO employeeDTO = new EmployeeDTO(empId, fName, lName, gender, NIC, DOB, address, EPFNo, photo, passportNo, departmentId, cadreId, email);
//
//                boolean idExcist = empService.isEmployeeIdExcist(empId, connection);
//
//                String curForm = "Employee.jsp";
//                HttpSession session = null;
//                HttpSession session2 = request.getSession();
//                UserDTO user = (UserDTO) session2.getAttribute("user");
//
//                System.out.println(user.getUserID());
//
//                if (idExcist) {
//                    session = request.getSession();
//                    session.setAttribute("msg", empId + "already exists");
//                    session.setAttribute("employeeDTO", employeeDTO);
//                    session.setAttribute("curForm", curForm);
//                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
//
//                } else {
//                    boolean result = empService.addEmployee(employeeDTO, connection);
//                    if (result) {
//                        session = request.getSession();
//                        session.setAttribute("employee", empId);
//                        session.setAttribute("curForm", "AddEmployeeContract.jsp");
//                        //request.setAttribute("employee", empId);
//                        //request.setAttribute("msg", "Inserted Employee Successfully!\n\nPlease continue inserting\nemployee contract details");
//                        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/AddEmployeeContract.jsp");
//                        //requestDispatcher.forward(request, response);
//                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
//
//                    } else {
//                        session = request.getSession();
//                        session.setAttribute("msg", "Error in Employee insertion");
//                        session.setAttribute("curForm", curForm);
//                        //request.setAttribute("msg", "Error in Employee insersion");
//                        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/AddEmployee.jsp");
//                        //requestDispatcher.forward(request, response);
//                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
//                    }
//
//                }
//
//            }
//            if ("search".equals(type)) {
//                String search = request.getParameter("search");
//                String input = request.getParameter("input");
//
//                EmployeeService employeeService = new EmployeeService();
//                EmployeeDTO employeeDTO = new EmployeeDTO();
//
//                HttpSession session = request.getSession();
//                UserDTO user = (UserDTO) session.getAttribute("user");
//                switch (search) {
//                    case "Employee Number":
//                        employeeDTO = employeeService.getEmployeeByID(input, connection);
//                        session.setAttribute("empNo", input);
//                        if (employeeDTO == null) {
//                            session.setAttribute("msg", input + " is not available");
//                        } else {
//                            session.setAttribute("sType", "ENo");
//                            session.setAttribute("employee", employeeDTO);
//                        }
//                        session.setAttribute("curForm", "SearchEmployee.jsp");
//
//                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
//                        break;
//                    case "Employee Name":
//                        ArrayList<EmployeeDTO> empList = employeeService.getEmployeeByName(input, connection);
//
//                        if (empList.size() == 0) {
//                            session.setAttribute("msg", input + " is not available");
//                        } else {
//                            session.setAttribute("sType", "ENa");
//                            session.setAttribute("employeeL", empList);
//                            session.setAttribute("curForm", "SearchEmployee.jsp");
//                        }
//                        response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
//
//                        break;
//
//                }
//
//            }
            if ("Update".equals(type)) {

                EmployeeService employeeService = new EmployeeService();

                String empId = (String) request.getSession().getAttribute("empNo");
                String fName = request.getParameter("fname");
                String lName = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String NIC = request.getParameter("nic");
                String DOB = request.getParameter("dob");
                String address = request.getParameter("address");
                String EPFNo = request.getParameter("epfno");
                String photo = request.getParameter("photo");
                String passportNo = request.getParameter("ppno");
                String deptId = request.getParameter("did");
                String cardreId = request.getParameter("cid");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");

                EmployeeDTO employeeDTO = new EmployeeDTO(empId, fName, lName, gender, NIC, DOB, address, EPFNo, photo, passportNo, email, phone);

                boolean nicExcist = employeeService.isNicExist(NIC, connection);
                boolean epfExcist = employeeService.isEpfExist(EPFNo, connection);

                String curForm = "SearchEmployee.jsp";
                HttpSession session = null;
                HttpSession session2 = request.getSession();
                UserDTO user = (UserDTO) session2.getAttribute("user");
                if (nicExcist) {
                    session = request.getSession();
                    session.setAttribute("msg", NIC + "already exists");
                    session.setAttribute("employeeDTO", employeeDTO);
                    session.setAttribute("curForm", curForm);
                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
                } else if (epfExcist) {
                    session = request.getSession();
                    session.setAttribute("msg", EPFNo + "already exists");
                    session.setAttribute("employeeDTO", employeeDTO);
                    session.setAttribute("curForm", curForm);
                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
                }

                boolean result = employeeService.updateEmployee(employeeDTO, connection);

                if (result) {

                    session2.setAttribute("msg", "Employee updated.");
                    String[] s = user.getUser_Level().split(" ");
                    if (s.length == 2) {
                        session2.setAttribute("curForm", "Dashboard_" + s[0] + "_" + s[1] + ".jsp");
                    } else {
                        session2.setAttribute("curForm", "Dashboard_" + s[0] + ".jsp");
                    }
                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");

                } else {
                    session2.setAttribute("msg", "Employee update failed.");
                    session2.setAttribute("curForm", curForm);
                    response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
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
