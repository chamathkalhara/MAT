/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.EmployeePerformanceDAO;
import dto.EmployeePerformanceGraphDTO;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Chamath
 */
public class EmployeePerformanceService {
    EmployeePerformanceDAO employeePerformanceDAO = new EmployeePerformanceDAO();
    
    public EmployeePerformanceGraphDTO getEmployeePerformanceForGraph(Connection connection,String empid,String midOrEnd,int year) throws SQLException{
        return employeePerformanceDAO.getEmployeePerformanceForGraph(connection, empid, midOrEnd, year);
    }
}
