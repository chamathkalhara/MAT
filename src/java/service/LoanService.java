/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.LoanDAO;
import dto.CheckLoanDetailsDTO;
import dto.LoanDTO;
import dto.LoanNewDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sashika
 */
public class LoanService {

    /*(public LoanService(){
    
    }*/
    LoanDAO loanDAO = new LoanDAO();

    public boolean addLoan(LoanDTO loan, Connection connection) throws SQLException, Exception {

        int result = loanDAO.addLoan(loan, connection);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    /*public LoanDTO getLoanByID(String id, Connection connection) throws SQLException, Exception {
        
        LoanDTO result = loanDAO.getLoanByID(id, connection);
        if (result.getLoan_Id() == null) {
            return result;
        } else {
            return new LoanDTO(result.getLoan_Id(), result.getLoan_Date(),result.getAmount(),result.getPeriod(),result.getStatus(),result.getEmp_Id());
        }
    }*/
    public String getNewId(Connection connection) throws SQLException {
        String lastId = loanDAO.getLastId(connection);
        int lastIdVal = Integer.parseInt(lastId.substring(3));
        String newId = "";
        if (lastIdVal < 9) {
            newId = "LON00" + (lastIdVal + 1);
        } else if(lastIdVal < 99){
            newId = "LON0" + (lastIdVal + 1);
        }else {
            return "LON" + (lastIdVal + 1);
        }
        return newId;
    }

    public LoanDTO getLoanByLoanId(String LoanId, Connection connection) throws SQLException, Exception {

        LoanDTO result = loanDAO.getLoanByLoanID(LoanId, connection);
        return result;
    }

    public LoanDTO getLoanByEmpId(String EmpId, Connection connection) throws SQLException, Exception {

        LoanDTO result = loanDAO.getLoanByEmpID(EmpId, connection);
        return result;
    }

    public boolean deleteLoan(String lid, Connection connection) throws SQLException {
        int result = loanDAO.deleteLoan(lid, connection);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean updateLoan(LoanDTO loanDTO, Connection connection) throws SQLException {
        int result = loanDAO.updateLoan(loanDTO, connection);
        if (result >= 1) {
            return true;
        } else {
            return false;
        }
    }

    public ArrayList<LoanDTO> getAllLoan(Connection connection) throws SQLException {

        ArrayList<LoanDTO> list = loanDAO.getAllLoan(connection);
        return list;
    }
    
    public ArrayList<LoanNewDTO>getLoanForTable(Connection connection)throws SQLException{
        ArrayList<LoanNewDTO> list= loanDAO.getLoanForTable(connection);
        return list;
    
    }

    public ArrayList<LoanDTO> getNotCompleteLoan(Connection connection) throws SQLException {
        ArrayList<LoanDTO> list = loanDAO.getNotCompleteLoan(connection);
        return list;
    }

    public boolean isEmpIdExcist(String id, Connection connection) throws SQLException {
        return loanDAO.isEmpIdExcist(id, connection);
    }

    public boolean isLoanIdExist(String id, Connection connection) throws SQLException {
        return loanDAO.isLoanIdExist(id, connection);
    }
    
    public CheckLoanDetailsDTO getDetailsForEmpId(String id,Connection connection)throws SQLException{
        CheckLoanDetailsDTO result= loanDAO.getDetailsForEmpId(id, connection);
        return result;
    }

}
