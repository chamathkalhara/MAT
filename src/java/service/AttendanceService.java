/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AttendanceDAO;
import dto.AttendanceDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Chamath
 */
public class AttendanceService {

    AttendanceDAO attendanceDAO = new AttendanceDAO();

    public boolean addAttendance(ArrayList<AttendanceDTO> list, String date, Connection connection) throws SQLException {
        boolean added = true;
        for (AttendanceDTO a : list) {
            a.setId(getNewId(connection));
            int result = attendanceDAO.addAttendance(a, date, connection);
            if (result < 1) {
                added = false;
            }
        }
        return added;
    }

    public String getNewId(Connection connection) throws SQLException {
        String lastId = attendanceDAO.getLastId(connection);
        String substring = lastId.substring(3);
        String newId = "ATN" + (Integer.parseInt(substring) + 1);
        return newId;
    }
    
    public boolean isDateExist(String date,Connection connection) throws SQLException{
        return attendanceDAO.isDateExist(date, connection);
    }

}
