/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.AllowanceDTO;
import dto.ContractDTO;
import dto.ContractRenewalDTO;
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
import service.ContractService;

/**
 *
 * @author Chamath
 */
public class ContractControllerNew extends HttpServlet {

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

            ContractService contractService = new ContractService();

            if ("search1".equals(type)) {
                ArrayList<ContractDTO> allContract = contractService.getAllContract(connection);

                Gson gson = new Gson();
                String contracts = gson.toJson(allContract);
                response.setContentType("text/plain");
                response.getWriter().write(contracts);
            }

            if ("search2".equals(type)) {
                ArrayList<ContractRenewalDTO> allRenewalContract = contractService.getAllRenwalContract(connection);

                Gson gson = new Gson();
                String contracts = gson.toJson(allRenewalContract);
                response.setContentType("text/plain");
                response.getWriter().write(contracts);
            }

            if ("delete1".equals(type)) {
                String contractId = request.getParameter("contractId");
                boolean result = contractService.deleteContract(contractId, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }

            if ("add1".equals(type)) {
                String cno = request.getParameter("cno");
                String full_day = request.getParameter("full_day");
                String short_leave = request.getParameter("short_leave");
                String c_name = request.getParameter("c_name");
                String sdate = request.getParameter("sdate");
                String allowance = request.getParameter("allowance");

                boolean result = contractService.addContract(new ContractDTO(cno, "1", sdate, Integer.parseInt(full_day), Integer.parseInt(short_leave), c_name),allowance, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }

            if ("update1".equals(type)) {
                String cno = request.getParameter("cno");
                String full_day = request.getParameter("full_day");
                String short_leave = request.getParameter("short_leave");
                String c_name = request.getParameter("c_name");
                String sdate = request.getParameter("sdate");

                boolean result = contractService.updateContract(new ContractDTO(cno, "1", sdate, Integer.parseInt(full_day), Integer.parseInt(short_leave), c_name), connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);
            }

            if ("allowance".equals(type)) {
                String cno = request.getParameter("cno");

                ArrayList<AllowanceDTO> result = contractService.getAllowancesInContract(cno, connection);
                if (!result.isEmpty()) {
                    Gson gson = new Gson();
                    String allowance = gson.toJson(result);
                    response.setContentType("text/plain");
                    response.getWriter().write("" + allowance);
                } else {
                    response.setContentType("text/plain");
                    response.getWriter().write("false");
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
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ContractControllerNew.class.getName()).log(Level.SEVERE, null, ex);
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
