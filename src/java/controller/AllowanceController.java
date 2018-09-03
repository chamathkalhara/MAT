/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import connection.DBConnection;
import dto.AllowanceDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AllowanceService;

/**
 *
 * @author tajini94
 */
public class AllowanceController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String type = request.getParameter("type");

            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            AllowanceService allowanceService = new AllowanceService();

            if ("search1".equals(type)) {
                ArrayList<AllowanceDTO> allAllowances = allowanceService.getAllAllowance(connection);

                Gson gson = new Gson();
                String allowances = gson.toJson(allAllowances);
                response.setContentType("text/plain");
                response.getWriter().write(allowances);
            }
            
            if ("delete1".equals(type)) {
                String allowanceId = request.getParameter("aid");
                boolean result = allowanceService.deleteAllowance(allowanceId, connection);
                response.setContentType("text/plain");
                response.getWriter().write("" + result);

            }

        }
    }
}
