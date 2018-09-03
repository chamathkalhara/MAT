/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmployeeAllowanceSalaryDTO;
import dto.EmployeeAllowanceViewDTO;
import dto.EmployeeSalaryViewDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class EmployeeSalaryReportDAO {
    public ArrayList<EmployeeSalaryViewDTO> getEmployeeSalaryViewDetails(Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from employee_salary_view;");
        result.beforeFirst();
        ArrayList<EmployeeSalaryViewDTO> list = new ArrayList<>();
        while(result.next()){
            EmployeeSalaryViewDTO employeeSalaryViewDTO = new EmployeeSalaryViewDTO();
            employeeSalaryViewDTO.setEmpId(result.getString(1));
            employeeSalaryViewDTO.setName(result.getString(2)+" "+result.getString(3));
            employeeSalaryViewDTO.setDepartment(result.getString(4));
            employeeSalaryViewDTO.setCadre(result.getString(5));
            employeeSalaryViewDTO.setSalary(result.getInt(6));
            
            list.add(employeeSalaryViewDTO);
        }
        return list;
    }
    public ArrayList<EmployeeAllowanceViewDTO> getEmployeeAllowanceViewDetails(Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from employee_allowance_view;");
        result.beforeFirst();
        ArrayList<EmployeeAllowanceViewDTO> list = new ArrayList<>();
        while(result.next()){
            EmployeeAllowanceViewDTO employeeAllowanceViewDTO = new EmployeeAllowanceViewDTO();
            employeeAllowanceViewDTO.setEmpId(result.getString(1));
            employeeAllowanceViewDTO.setContractId(result.getString(2));
            employeeAllowanceViewDTO.setAllowanceId(result.getString(3));
            employeeAllowanceViewDTO.setAllowance(result.getString(4));
            
            list.add(employeeAllowanceViewDTO);
        }
        return list;
    }
    public ArrayList<EmployeeAllowanceSalaryDTO> getEmployeeAllowanceTotal(Connection connection) throws SQLException{
        String sql = "SELECT ce.emp_id as employee_id,sum(a.amount) as total FROM contract_employee ce,contract_allowance ca,allowance a WHERE ce.contract_id = ca.contract_id && ca.allowance_id = a.allowance_id GROUP by ce.emp_id ORDER by 1";
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(sql);
        result.beforeFirst();
        ArrayList<EmployeeAllowanceSalaryDTO> salaryList = new ArrayList<>();
        while(result.next()){
            EmployeeAllowanceSalaryDTO employeeAllowanceSalaryDTO = new EmployeeAllowanceSalaryDTO();
            employeeAllowanceSalaryDTO.setEmpId(result.getString(1));
            employeeAllowanceSalaryDTO.setTotal(result.getInt(2));
            salaryList.add(employeeAllowanceSalaryDTO);
        }
        return salaryList;
    }
}
