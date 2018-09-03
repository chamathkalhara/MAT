/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ContractDAO;
import dto.AllowanceDTO;
import dto.ContractDTO;
import dto.ContractRenewalDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class ContractService {
    ContractDAO contractDAO = new ContractDAO();
    
    public ContractDTO getContractByName(String name,Connection connection) throws SQLException{
        ContractDTO contractDTO = contractDAO.getContractByName(name, connection);
        return contractDTO;
    }
     
    public ArrayList<ContractDTO> getAllContract(Connection connection) throws SQLException{
        return contractDAO.getAllContract(connection);
    }
    
    public String getNewId(Connection connection) throws SQLException {
        String lastId = contractDAO.getLastId(connection);
        
        int lastIdVal = Integer.parseInt(lastId.substring(3));
        String newId = "";
        if (lastIdVal < 9) {
            newId = "CON00" + (lastIdVal + 1);
        } else if(lastIdVal < 99){
            newId = "CON0" + (lastIdVal + 1);
        }else {
            return "CON" + (lastIdVal + 1);
        }
        return newId;

    }
    
    public boolean isIdExist(String contractId, Connection connection) throws SQLException{
        return contractDAO.isIdExist(contractId, connection);
    }
    
    public boolean addContract(ContractDTO contract,String allowance, Connection connection) throws SQLException, Exception {
        String[] split = allowance.split(",");
        ArrayList<String> list = new ArrayList<>();
        for(int i = 1;i<split.length;i++){
            list.add(split[i]);
        }
        int result = contractDAO.addContract(contract,list, connection);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean deleteContract(String contractId, Connection connection) throws SQLException{
        int result = contractDAO.deleteContract(contractId,connection);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }
    public ArrayList<ContractRenewalDTO> getAllRenwalContract(Connection connection) throws SQLException{
        return contractDAO.getAllRenewalContract(connection);
    }
    
    public boolean updateContract(ContractDTO contractDTO,Connection connection) throws SQLException{
        int result = contractDAO.updateContract(contractDTO,connection);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }
    public ArrayList<AllowanceDTO> getAllowancesInContract(String conId,Connection connection) throws SQLException{
        return contractDAO.getAllowancesInContract(conId, connection);
    }
}
