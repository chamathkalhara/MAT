/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmployeeContractDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class EmployeeContractDAO {
    public int addEmployeeContract(EmployeeContractDTO employeeContractDTO,Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        return statement.executeUpdate("insert into Contract_Employee values('"+employeeContractDTO.getEmpId()+"','"+employeeContractDTO.getType()+"','"+employeeContractDTO.getDate()+"','"+employeeContractDTO.getSalary()+"')");
    }
    public ArrayList<EmployeeContractDTO>getAllEmployeeContract(Connection connection)throws SQLException{
        Statement statement=connection.createStatement();
        ResultSet result=statement.executeQuery("select * form contract_employee");
        ArrayList<EmployeeContractDTO> list=new ArrayList<>();
        
        result.beforeFirst();
        while(result.next()){
            EmployeeContractDTO d=new EmployeeContractDTO(result.getString("Emp_Id"),result.getString("Contract_Id"),result.getString("Date"),result.getInt("Basic_Salary"));
            list.add(d);
        }
        return list;
    }
}
