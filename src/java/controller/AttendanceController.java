/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.SimpleTextExtractionStrategy;
import com.itextpdf.text.pdf.parser.TextExtractionStrategy;
import connection.DBConnection;
import dto.AttendanceDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AttendanceService;
import service.EmployeeService;

/**
 *
 * @author Chamath
 */
public class AttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String pdfPath = "C:\\Users\\Chamath\\Desktop/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                DBConnection dBConnection = new DBConnection();
                Connection connection = dBConnection.getConnection();

                AttendanceService attendanceService = new AttendanceService();
                EmployeeService employeeService = new EmployeeService();

                String type = request.getParameter("type");

                if ("add1".equals(type)) {
                    String date = request.getParameter("date");
                    String pdfPath = request.getParameter("pdfName");

                    String fixedPath = "C:\\Users\\Chamath\\Desktop/";

                    String[] pdfSplit = pdfPath.split("\\\\");

                    PdfReader reader = new PdfReader(fixedPath + pdfSplit[2]);
                    PdfReaderContentParser parser = new PdfReaderContentParser(reader);
                    TextExtractionStrategy strategy = null;

                    //Date date = new Date();
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//                    String formatedDate = sdf.format(date);
//                    String[] split2 = formatedDate.split("-");
                    //java.sql.Date d = new java.sql.Date(Integer.parseInt(split2[0]), Integer.parseInt(split2[1]), Integer.parseInt(split2[2]));
                    ArrayList<AttendanceDTO> list = new ArrayList<>();
                    int count = 0;

                    for (int i = 1; i <= reader.getNumberOfPages(); i++) {

                        strategy = parser.processContent(i, new SimpleTextExtractionStrategy());

                        String page = strategy.getResultantText();
                        String[] split = page.split("\n");
                        for (int j = 1; j < split.length - 1; j++) {
                            String trim = split[j].trim();
                            AttendanceDTO attendanceDTO = new AttendanceDTO();

                            boolean employeeIdExcist = employeeService.isEmployeeIdExcist(trim.substring(0, 6), connection);

                            if (employeeIdExcist) {
                                count++;
                                attendanceDTO.setId("");
                                attendanceDTO.setEmpId(trim.substring(0, 6));
                                attendanceDTO.setTimeIn(Time.valueOf(trim.substring(7, 15)));
                                attendanceDTO.setTimeOut(Time.valueOf(trim.substring(16, 23)));

                                list.add(attendanceDTO);
                            }

                        }
                    }
                    reader.close();
                    boolean result = attendanceService.addAttendance(list, date, connection);
                    if (result) {
                        response.setContentType("text/plain");
                        response.getWriter().write("" + count);
                    } else {
                        response.setContentType("text/plain");
                        response.getWriter().write("" + result);
                    }

                }
                if ("dateCheck".equals(type)) {
                    String date = request.getParameter("date");
                    boolean result = attendanceService.isDateExist(date, connection);
                    response.setContentType("text/plain");
                    response.getWriter().write("" + result);
                }
                connection.close();

            } catch (IOException ex) {
                ex.printStackTrace();
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
            Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
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
