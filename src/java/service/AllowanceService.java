/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AllowanceDAO;
import dto.AllowanceDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tajini94
 */
public class AllowanceService {
    AllowanceDAO allowanceDAO = new AllowanceDAO();
    
    public ArrayList<AllowanceDTO> getAllAllowance(Connection connection) throws SQLException{
        return allowanceDAO.getAllAllowance(connection);
    }
    
    public String getNewId(Connection connection) throws SQLException {
        String lastId = allowanceDAO.getLastId(connection);
        
        int lastIdVal = Integer.parseInt(lastId.substring(3));
        String newId = "";
        if (lastIdVal < 9) {
            newId = "ALW00" + (lastIdVal + 1);
        } else if(lastIdVal < 99){
            newId = "ALW0" + (lastIdVal + 1);
        }else {
            return "ALW" + (lastIdVal + 1);
        }
        return newId;

    }
    
    public boolean deleteAllowance(String allowanceId, Connection connection) throws SQLException{
        int result = allowanceDAO.deleteAllowance(allowanceId,connection);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }
    
    
}
