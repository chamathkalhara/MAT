/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.UserDTO;
import dto.UserProfileInfoDTO;
import dto.UserTableDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.UserService;

/**
 *
 * @author ASUS
 */
public class UserController extends HttpServlet {

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
            throws ServletException, IOException, Exception {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            UserService userService = new UserService();
            String type = request.getParameter("type");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sri_lanka_cricket", "root", "");
            if ("username".equals(type)) {
                String name = request.getParameter("name");
                UserDTO user = userService.getUser(name, connection);
                boolean userExcist = true;
                if (user.getUserID() == null) {
                    userExcist = false;
                }
                response.setContentType("text/plain");
                response.getWriter().write("" + userExcist);
            }

            if ("search1".equals(type)) {

                ArrayList<UserTableDTO> allUsers = userService.getAllUsersForTable(connection);

                Gson gson = new Gson();
                String usr = gson.toJson(allUsers);
                response.setContentType("text/plain");
                response.getWriter().write(usr);
            }

            if ("delete1".equals(type)) {
                String empid = request.getParameter("empid");
                boolean result = userService.deleteUser(empid, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }
            if ("update1".equals(type)) {
                String empid = request.getParameter("empid");
                String uname = request.getParameter("uname");
                String ulevel = request.getParameter("ulevel");

                UserDTO us = new UserDTO(empid, uname, ulevel, "");
                boolean result = userService.updateUser(us, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }

            if ("password".equals(type)) {
                String userName = request.getParameter("username");
                String password = request.getParameter("name");

                UserDTO user = userService.getUser(userName, connection);
                boolean userExcist = false;
                if (user.getUserID() == null) {
                    userExcist = false;
                } else if (user.getPassword() != null && user.getPassword().equals(password)) {
                    userExcist = true;
                }
                response.setContentType("text/plain");
                response.getWriter().write("" + userExcist);
            }

            if ("change".equals(type)) {
                String username = request.getParameter("userName");
                String newPw = request.getParameter("newPwd");

                boolean result = userService.changePassword(username, newPw, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }

            if ("login".equals(type)) {
                String userId = request.getParameter("username");
                String password = request.getParameter("password");

                UserDTO user = userService.getUser(userId, connection);

                HttpSession session = request.getSession();
                UserProfileInfoDTO userProfileInfo = userService.getUserProfileInfo(user.getEmp_Id(), connection);

                String sp[] = user.getUser_Level().split(" ");

                if (sp.length == 2) {
                    session.setAttribute("curForm", "Dashboard_" + sp[0] + "_" + sp[1] + ".jsp");
                } else {
                    session.setAttribute("curForm", "Dashboard_" + user.getUser_Level() + ".jsp");
                }

                session.setAttribute("profile", userProfileInfo);
                session.setAttribute("user", user);
                
                response.setContentType("text/plain");
                response.getWriter().write("views/Work_Area_" + user.getUser_Level() + ".jsp");

            }
            if ("verifyPassword".equals(type)) {
                String userId = request.getParameter("uname");
                String password = request.getParameter("cpwd");

                UserDTO user = userService.getUser(userId, connection);

                if (password.equals(user.getPassword())) {
                } else {

                    System.out.println("wrong password");

                }
            }
            if ("add".equals(type)) {
                String empNo = request.getParameter("empno");
                String uName = request.getParameter("uname");
                String uLevel = request.getParameter("ulevel");
                String pwd = request.getParameter("pwd");

                boolean result = userService.addUser(new UserDTO(empNo, uName, uLevel, pwd), connection);
                HttpSession session = request.getSession();
                session.setAttribute("curForm", "SysUsers.jsp");
                UserDTO user = (UserDTO) session.getAttribute("user");
                if (result) {
                    out.println("<script>");
                    out.println("alert('User " + uName + " added');");
                    out.println("</script>");

                } else {
                    out.println("<script>");
                    out.println("alert('User " + uName + " not added');");
                    out.println("</script>");
                }
                response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");
            }
            if ("delete".equals(type)) {

                String empId = request.getParameter("username");

                boolean result = userService.deleteUser(empId, connection);
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                session.setAttribute("curForm", "SystemUsers.jsp");
                response.sendRedirect("views/Work_Area_" + user.getUser_Level() + ".jsp");

            }

            //Connection connection = (Connection) request.getAttribute("connection");
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
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
