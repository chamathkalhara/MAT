/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;


import dao.PersonnelContractDAO;
import dto.PersonnelContractDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Asus
 */
public class PersonnelContractService {
    PersonnelContractDAO perDAO= new PersonnelContractDAO();
    
    public ArrayList<PersonnelContractDTO> getAllPersonnelContract(Connection connection, String  emp_id) throws SQLException{
        return perDAO.getAllPersonnelContract(connection, emp_id);
        
    }
    
    public ArrayList<PersonnelContractDTO> getAllSalaryDetails(Connection connection, String  emp_id) throws SQLException{
        System.out.println("7");
        return perDAO.getAllSalaryDetails(connection, emp_id);
        
    }
}

