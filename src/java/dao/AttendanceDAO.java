/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AttendanceDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Chamath
 */
public class AttendanceDAO {
    
    public int addAttendance(AttendanceDTO attendanceDTO,String date,Connection connection) throws SQLException{
        
        Statement statement = connection.createStatement();
        return statement.executeUpdate("insert into Attendance values('"+attendanceDTO.getId()+"','"+date+"','"+attendanceDTO.getTimeIn()+"','"+attendanceDTO.getTimeOut()+"','"+attendanceDTO.getEmpId()+"')");
        
    }
    
    public String getLastId(Connection connection) throws SQLException{
        String lastId = "ATN000";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select max(CONVERT(substring(Attendance_Id,4),UNSIGNED INTEGER)) from Attendance");
        resultSet.beforeFirst();
        if(resultSet.next()){
            lastId = "ATN"+String.valueOf(resultSet.getInt(1));
        }
        return lastId;
    }
    
    public boolean isDateExist(String date,Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select Attendance_Id from Attendance where date='"+date+"'");
        resultSet.beforeFirst();
        
        if(resultSet.next()){
            return true;
        }else{
            return false;
        }
        
    }
}
