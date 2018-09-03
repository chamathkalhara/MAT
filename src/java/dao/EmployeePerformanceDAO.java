/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmployeePerformanceGraphDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Chamath
 */
public class EmployeePerformanceDAO {
    
    public EmployeePerformanceGraphDTO getEmployeePerformanceForGraph(Connection connection,String empid,String midOrEnd,int year) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select w.fname,w.lname,ep.Communication,ep.Commitment,ep.Initiative,ep.Leadership,ep.Productivity,ep.Creativity,ep.Dependability,ep.Accountability from Work_force w,Employee_performance ep where w.Emp_id = ep.Emp_id AND midorend = '"+midOrEnd+"' AND year(Date) = "+year+" AND w.Emp_id = '"+empid+"'");
        EmployeePerformanceGraphDTO employeePerformanceDAO = new EmployeePerformanceGraphDTO();
        if(result.next()){
            employeePerformanceDAO = new EmployeePerformanceGraphDTO(result.getString(1)+" "+result.getString(2), result.getInt(3), result.getInt(4), result.getInt(5), result.getInt(6), result.getInt(7), result.getInt(8), result.getInt(9), result.getInt(10));
            
        }
        return employeePerformanceDAO;
    }
}
