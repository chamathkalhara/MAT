/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.EmployeeContractDAO;
import dto.EmployeeContractDTO;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class EmployeeContractService {
    EmployeeContractDAO employeeContractDAO = new EmployeeContractDAO();
    
    public boolean addEmployeeContract(EmployeeContractDTO employeeContractDTO,Connection connection) throws SQLException{
        int result = employeeContractDAO.addEmployeeContract(employeeContractDTO, connection);
        if(result >= 1){
            return true;
        }else{
            return false;
        }
    }
}
