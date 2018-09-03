/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CheckLoanDetailsDTO;
import dto.EmployeeDTO;
import dto.LoanDTO;
import dto.LoanNewDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author sashika
 */
public class LoanDAO {

    private String sql;

    public int addLoan(LoanDTO loan, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("insert into loan values('" + loan.getLoan_Id() + "','" + loan.getLoan_Date() + "'," + Double.parseDouble(loan.getAmount()) + ",'" + loan.getPeriod() + "','"+ loan.getStatus() + "','" + loan.getEmp_Id() + "')");
    }

    public String getLastId(Connection connection) throws SQLException {
        String id = "LON000";
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Loan_Id from loan order by Loan_Id desc limit 1");
        if (result.next()) {
            id = result.getString("Loan_Id");
        }
        return id;

    }

    public LoanDTO getLoanByLoanID(String id, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet loanResult = statement.executeQuery("select * from loan where Loan_Id='" + id + "'");
        LoanDTO loanDTO = null;
        loanResult.beforeFirst();
        if (loanResult.next()) {
            loanDTO = new LoanDTO();
            loanDTO.setLoan_Id(loanResult.getString(1));
            loanDTO.setLoan_Date(loanResult.getString(2));
            loanDTO.setAmount(loanResult.getString(3));
            loanDTO.setPeriod(loanResult.getString(4));
            loanDTO.setStatus(loanResult.getString(5));
            loanDTO.setEmp_Id(loanResult.getString(6));

        }
        return loanDTO;
    }

    public LoanDTO getLoanByEmpID(String id, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet loanResult = statement.executeQuery("select * from loan where Emp_Id='" + id + "'");
        LoanDTO loanDTO = null;
        loanResult.beforeFirst();
        if (loanResult.next()) {
            loanDTO = new LoanDTO();
            loanDTO.setLoan_Id(loanResult.getString(1));
            loanDTO.setLoan_Date(loanResult.getString(2));
            loanDTO.setAmount(loanResult.getString(3));
            loanDTO.setPeriod(loanResult.getString(4));
            loanDTO.setStatus(loanResult.getString(5));
            loanDTO.setEmp_Id(loanResult.getString(6));

        } 
        return loanDTO;
    }

    /*public boolean isIdExist(String id, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from loan where Loan_Id = '" + id + "'");
        if (result.next()) {
            return true;
        } else {
            return false;
        }
    }*/
    public boolean isEmpIdExcist(String empId, Connection connection) throws SQLException {
        LoanDTO loanByempId = getLoanByEmpID(empId, connection);
        if (loanByempId == null) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isLoanIdExist(String loanId, Connection connection) throws SQLException {
        LoanDTO loanByloanId = getLoanByLoanID(loanId, connection);
        if (loanByloanId == null) {
            return false;
        } else {
            return true;
        }
    }

    public int deleteLoan(String lId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from loan where Loan_Id='" + lId + "'");
    }

    public int updateLoan(LoanDTO loanDTO, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        String Loan_Id = loanDTO.getLoan_Id();
        String Loan_Date = loanDTO.getLoan_Date();
        String Amount = loanDTO.getAmount();
        String Period = loanDTO.getPeriod();
        String Status = loanDTO.getStatus();
        String Emp_Id = loanDTO.getEmp_Id();

        return statement.executeUpdate("update loan set Loan_Id = '" + Loan_Id + "',Loan_Date = '" + Loan_Date + "',Amount = '" + Amount + "',Period = '" + Period + "',Status = '" + Status + "',Emp_Id = '" + Emp_Id + "' where Loan_Id = '" + Loan_Id + "'");

    }

    public ArrayList<LoanDTO> getAllLoan(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from loan");
        ArrayList<LoanDTO> list = new ArrayList<>();

        result.beforeFirst();
        while (result.next()) {
            LoanDTO d = new LoanDTO(result.getString("Loan_Id"), result.getString("Date"), String.valueOf(result.getFloat("Amount")), result.getString("Period"), result.getString("Status"), result.getString("Emp_Id"));
            list.add(d);
        }
        return list;
    }

    public ArrayList<LoanDTO> getNotCompleteLoan(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from loan where Status='Incomplete'");
        ArrayList<LoanDTO> list = new ArrayList<>();

        result.beforeFirst();
        while (result.next()) {
            LoanDTO d = new LoanDTO(result.getString("Loan_Id"), result.getString("Date"), result.getString("Amount"), result.getString("Period"), result.getString("Status"), result.getString("Emp_Id"));
            list.add(d);
        }
        return list;
    }

    public ArrayList<LoanNewDTO> getLoanForTable(Connection connection) throws SQLException {
        ArrayList<LoanDTO> allLoans = getAllLoan(connection);
        EmployeeDAO empDAO = new EmployeeDAO();
        ArrayList<EmployeeDTO> allemployee = empDAO.getAllEmployee(connection);
        ArrayList<LoanNewDTO> newtable = new ArrayList<>();

        for (LoanDTO l : allLoans) {
            LoanNewDTO loanNewDTO = new LoanNewDTO(l.getLoan_Id(), l.getLoan_Date(), l.getAmount(), l.getPeriod(), l.getStatus(), l.getEmp_Id(), "");
            for (EmployeeDTO e : allemployee) {
                if (l.getEmp_Id().equals(e.getEmpId())) {
                    loanNewDTO.setFullName(e.getFname() + " " + e.getLname());
                }
            }
            newtable.add(loanNewDTO);

        }
        return newtable;
    }

    public CheckLoanDetailsDTO getDetailsForEmpId(String Emp_Id, Connection connection) throws SQLException {

        Statement statement = connection.createStatement();
        ResultSet getDetailsResult = statement.executeQuery("select work_force.Emp_Id,work_force.Fname,work_force.Lname,contract_employee.Basic_Salary,TimeStampDiff(Month,contract_employee.Date,DATE_ADD(contract_employee.Date,INTERVAL 1 YEAR))as No_Months from work_force left join contract_employee on work_force.Emp_Id=contract_employee.Emp_Id where work_force.Emp_Id='" + Emp_Id + "'");
        CheckLoanDetailsDTO checkLoanDetailsDTO = new CheckLoanDetailsDTO();
        getDetailsResult.beforeFirst();
        if (getDetailsResult.next()) {
            checkLoanDetailsDTO.setEmpId(getDetailsResult.getString(1));
            checkLoanDetailsDTO.setEmpName((getDetailsResult.getString(2) + " " + getDetailsResult.getString(3)));
            //checkLoanDetailsDTO.setMaxAmount(getDetailsResult.getString(4));
            if (getDetailsResult.getInt(5) == 2) {
                checkLoanDetailsDTO.setMaxAmount(getDetailsResult.getInt(4));
            } else if (getDetailsResult.getInt(5) == 1) {
                checkLoanDetailsDTO.setMaxAmount(getDetailsResult.getInt(4)/2);
            } else {
                checkLoanDetailsDTO.setMaxAmount(getDetailsResult.getInt(4)*2);
            }
            checkLoanDetailsDTO.setMaxMonth(String.valueOf(getDetailsResult.getInt(5)));
            
            checkLoanDetailsDTO.setPayment("");
            checkLoanDetailsDTO.seteAmount("");
            checkLoanDetailsDTO.seteMonth("");
        }
        return checkLoanDetailsDTO;

    }

}
