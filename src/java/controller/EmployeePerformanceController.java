/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import dto.EmployeePerformanceGraphDTO;
import java.awt.Color;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import service.EmployeePerformanceService;

/**
 *
 * @author Chamath
 */
public class EmployeePerformanceController extends HttpServlet {

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

        response.setContentType("image/png");
        ServletOutputStream os = response.getOutputStream();

        String type1 = request.getParameter("type");

        String[] split = type1.split(" ");
        String empid = split[0];
        int year = Integer.parseInt(split[1]);
        
        HttpSession session = request.getSession();
        String emp_name = (String) session.getAttribute("employee_performance");

        Connection connection = new DBConnection().getConnection();

        EmployeePerformanceService ems = new EmployeePerformanceService();

        EmployeePerformanceGraphDTO midData = ems.getEmployeePerformanceForGraph(connection, empid, "mid", year);
        EmployeePerformanceGraphDTO endData = ems.getEmployeePerformanceForGraph(connection, empid, "end", year);

        final DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();

        dataset1.addValue(midData.getCommunication(), "mid", "Communication");
        dataset1.addValue(endData.getCommunication(), "end", "Communication");

        dataset1.addValue(midData.getCommitment(), "mid", "Commitment");
        dataset1.addValue(endData.getCommitment(), "end", "Commitment");

        dataset1.addValue(midData.getInitiative(), "mid", "Initiative");
        dataset1.addValue(endData.getInitiative(), "end", "Initiative");

        dataset1.addValue(midData.getLeadership(), "mid", "Leadership");
        dataset1.addValue(endData.getLeadership(), "end", "Leadership");

        dataset1.addValue(midData.getProductivity(), "mid", "Productivity");
        dataset1.addValue(endData.getProductivity(), "end", "Productivity");

        dataset1.addValue(midData.getCreativity(), "mid", "Creativity");
        dataset1.addValue(endData.getCreativity(), "end", "Creativity");

        dataset1.addValue(midData.getDependability(), "mid", "Dependability");
        dataset1.addValue(endData.getDependability(), "end", "Dependability");

        dataset1.addValue(midData.getAccountability(), "mid", "Accountability");
        dataset1.addValue(endData.getAccountability(), "end", "Accountability");

        JFreeChart lineChart = ChartFactory.createLineChart(
                emp_name,
                "Criteria",
                "Rating",
                dataset1,
                PlotOrientation.VERTICAL,
                true, true, false
        );

        CategoryPlot plot = lineChart.getCategoryPlot();
        CategoryItemRenderer renderer = plot.getRenderer();
        LineAndShapeRenderer renderer2 = (LineAndShapeRenderer) plot.getRenderer();
        renderer.setSeriesPaint(0, Color.blue);
        renderer.setSeriesPaint(1, Color.green);
        plot.setDataset(0, dataset1);

        plot.setBackgroundPaint(Color.white);
        plot.setRangeGridlinePaint(Color.black);

        renderer2.setShapesVisible(true);

        CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);


        NumberAxis numberAxis = new NumberAxis();
        numberAxis.setTickLabelFont(new Font("Sans-serif", 0, 12));
        numberAxis.setLabel("Score");
        numberAxis.setLabelFont(new Font("Sans-serif", 0, 20));
        //numberAxis.setNumberFormatOverride(new DecimalFormat("00"));
        numberAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        plot.setRangeAxis(numberAxis);

        //session.setAttribute("player", null);
        lineChart.setBackgroundPaint(null);
        BufferedImage bufferedImage = lineChart.createBufferedImage(700, 500);
        ImageIO.write(bufferedImage, "png", os);
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
            Logger.getLogger(EmployeePerformanceController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeePerformanceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EmployeePerformanceController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeePerformanceController.class.getName()).log(Level.SEVERE, null, ex);
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
