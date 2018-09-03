/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AllowanceDTO;
import dto.ContractDTO;
import dto.ContractRenewalDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import service.AllowanceService;

/**
 *
 * @author ASUS
 */
public class ContractDAO {

    public ContractDTO getContractByName(String name, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from contract where Contract_name = '" + name + "'");
        ContractDTO contractDTO = new ContractDTO();
        result.beforeFirst();
        if (result.next()) {
            contractDTO.setContractId(result.getString(1));
            contractDTO.setPeriod(result.getString(2));
            contractDTO.setStartDate(result.getString(3));
            contractDTO.setFullDay(result.getInt(4));
            contractDTO.setShortLeave(result.getInt(5));
            contractDTO.setContractName(result.getString(6));
        }
        return contractDTO;
    }

    public ArrayList<ContractDTO> getAllContract(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from contract");
        ArrayList<ContractDTO> list = new ArrayList<>();

        result.beforeFirst();
        while (result.next()) {
            ContractDTO d = new ContractDTO(result.getString(1), result.getString(2), result.getString(3), result.getInt(4), result.getInt(5), result.getString(6));
            list.add(d);
        }
        return list;
    }

    public String getLastId(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Contract_Id from contract order by Contract_Id desc limit 1");
        result.next();
        String id = result.getString("Contract_Id");

        return id;

    }

    public boolean isIdExist(String id, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from contract where Contract_Id = '" + id + "'");

        if (result.next()) {
            return true;

        } else {
            return false;
        }
    }

    public int addContract(ContractDTO contract, ArrayList<String> list, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        int result1 = statement.executeUpdate("insert into contract values('" + contract.getContractId() + "','" + contract.getPeriod() + "','" + contract.getStartDate() + "'," + contract.getFullDay() + "," + contract.getShortLeave() + ",'" + contract.getContractName() + "')");

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String newDate = sdf.format(date);
        
        AllowanceService allowanceService = new AllowanceService();
        ArrayList<AllowanceDTO> allAllowance = allowanceService.getAllAllowance(connection);
        if (result1 > 0) {
            for (String a : list) {
                String id = "";
                for(AllowanceDTO c: allAllowance){
                    if(c.getName().equals(a)){
                        id = c.getAid();
                    }
                }
                statement.executeUpdate("insert into contract_allowance values('" + contract.getContractId() + "','" + id + "','" + newDate + "')");
            }
        }
        return result1;
    }

    public int deleteContract(String contractId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from contract where Contract_Id='" + contractId + "'");
    }

    public ArrayList<ContractRenewalDTO> getAllRenewalContract(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select ce.Emp_Id,ce.Contract_Id,ce.Date as sDate,DATE_ADD(ce.Date,INTERVAL 1 YEAR) as eDate,w.Fname,w.Lname,c.Contract_name from contract_employee ce,Work_force w,Contract c where ce.Emp_id = w.Emp_id And ce.Contract_Id = c.Contract_Id AND curdate() < DATE_ADD(ce.Date,INTERVAL 1 YEAR);");
        ArrayList<ContractRenewalDTO> list = new ArrayList<>();

        result.beforeFirst();
        while (result.next()) {
            ContractRenewalDTO r = new ContractRenewalDTO(result.getString("Emp_Id"), result.getString("Fname") + " " + result.getString("Lname"), result.getString("Contract_Id"), result.getString("Contract_name"), result.getString("sDate"), result.getString("eDate"));
            list.add(r);
        }
        return list;
    }

    public int updateContract(ContractDTO contractDTO, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("update contract set Period = '1', Start_Date = '" + contractDTO.getStartDate() + "',Full_Day = " + contractDTO.getFullDay() + ",Short_Leave = " + contractDTO.getShortLeave() + ",Contract_name = '" + contractDTO.getContractName() + "' where Contract_Id = '" + contractDTO.getContractId() + "'");
    }

    public ArrayList<AllowanceDTO> getAllowancesInContract(String conId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select a.* from contract_allowance ca,allowance a where ca.allowance_id = a.allowance_id and contract_id = '" + conId + "'");
        ArrayList<AllowanceDTO> list = new ArrayList<>();
        while (resultSet.next()) {
            AllowanceDTO a = new AllowanceDTO(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4));
            list.add(a);
        }
        return list;
    }
}
