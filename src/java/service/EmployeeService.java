/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.EmployeeDAO;
import dto.EmployeeDTO;
import dto.EmployeeReportDTO;
import dto.EmployeeTRReportDTO;
import dto.EmployeeTableDTO;
import dto.EmployeeViewDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class EmployeeService {

    EmployeeDAO empDAO = new EmployeeDAO();

    public boolean addEmployee(EmployeeDTO employee, Connection connection) throws SQLException, Exception {

        int result = empDAO.addEmployee(employee, connection);
        
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public ArrayList<EmployeeTableDTO> getEmployeeForTable(Connection connection) throws SQLException{
        return empDAO.getEmployeeForTable(connection);
    }

    public String getNewId(Connection connection) throws SQLException {
        String lastId = empDAO.getLastId(connection);
        int lastIdVal = Integer.parseInt(lastId.substring(3));
        return "EMP"+(lastIdVal+1);
    }

    public EmployeeDTO getEmployeeByID(String EmpId, Connection connection) throws SQLException, Exception {
        
        EmployeeDTO result = empDAO.getEmployeeById(EmpId, connection);
        return result;
    }
    
    public EmployeeViewDTO getEmployeeByIDForView(String empId, Connection connection) throws SQLException {
        EmployeeViewDTO result = empDAO.getEmployeeByIdForView(empId, connection);
        return result;
    }
    
    public EmployeeDTO getEmployeeByNic(String nic, Connection connection) throws SQLException, Exception {
        
        EmployeeDTO result = empDAO.getEmployeeByNic(nic, connection);
        return result;
    }
    
    public EmployeeDTO getEmployeeByEpf(String epf, Connection connection) throws SQLException, Exception {
        
        EmployeeDTO result = empDAO.getEmployeeByNic(epf, connection);
        return result;
    }

   
    
    public ArrayList<EmployeeDTO> getAllEmployee(Connection connection) throws SQLException{
        
        ArrayList<EmployeeDTO> list = empDAO.getAllEmployee(connection);
        return list;
    }

    public ArrayList<EmployeeDTO> getEmployeeByName(String name, Connection connection) throws SQLException {
        String[] splitName = name.split(" ");
        String fName ="";
        String lName = "";
        if(splitName.length > 1){
            fName = splitName[0];
            lName = splitName[1];
        }else{
            fName = name;
        }
        ArrayList<EmployeeDTO> employeeDTO = empDAO.getEmployeeByname(fName, lName, connection);
        return employeeDTO;
    }

    public boolean deleteEmployee(String empNo, Connection connection) throws SQLException {
        int result = empDAO.deleteEmployee(empNo,connection);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }

    public boolean updateEmployee(EmployeeDTO employeeDTO, Connection connection) throws SQLException {
        int result = empDAO.updateEmployee(employeeDTO,connection);
        if(result >= 1){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean modifyEmployee(String empId,String type,String reason,Connection connection) throws SQLException{
        int result = empDAO.modifyEmployee(empId,type,reason,connection);
        if(result >= 1){
            return true;
        }else{
            return false;
        }
    }
    
    public ArrayList<EmployeeReportDTO> getAllDepartmentContractEmployees(Connection connection, String dept_id) throws SQLException{
        return empDAO.getAllDepartmentContractEmployee(connection, dept_id);
    }
    
    public ArrayList<EmployeeReportDTO> getAllDepartmentEmployees(Connection connection, String dept_id) throws SQLException{
        return empDAO.getAllDepartmentEmployee(connection, dept_id);
    }
    
    public ArrayList<EmployeeReportDTO> getAllDepartmentPermanentEmployees(Connection connection, String  dept_id) throws SQLException{
        System.out.println("abc3");
        return empDAO.getAllDepartmentPermanentEmployee(connection, dept_id);
        
    }
    
    public ArrayList<EmployeeTRReportDTO> getAllDepartmentTerminatedEmployees(Connection connection, String  dept_id) throws SQLException{
        return empDAO.getAllDepartmentTerminatedEmployees(connection, dept_id);
    }
    
    public ArrayList<EmployeeTRReportDTO> getAllDepartmentResignedEmployees(Connection connection, String  dept_id) throws SQLException{
        return empDAO.getAllDepartmentResignedEmployees(connection, dept_id);
    }
    
    public ArrayList<EmployeeTRReportDTO> getAllDepartmentRetiredEmployees(Connection connection, String  dept_id) throws SQLException{
        return empDAO.getAllDepartmentRetiredEmployees(connection, dept_id);
    }

    public boolean isEmployeeIdExcist(String empId,Connection connection) throws SQLException{
        return empDAO.isEmployeeIdExcist(empId, connection);
    }
    
    public boolean isNicExist(String nic,Connection connection) throws SQLException{
        return empDAO.isNicExist(nic, connection);
    }
    
    public boolean isEpfExist(String epf,Connection connection) throws SQLException{
        return empDAO.isEpfExist(epf, connection);
    }
    
    public boolean isPasswordExist(String pasport,Connection connection) throws SQLException{
        return empDAO.isPassportExist(pasport, connection);
    }

    
}
