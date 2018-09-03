/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmployeeDTO;
import dto.EmployeeReportDTO;
import dto.EmployeeTRReportDTO;
import dto.EmployeeTableDTO;
import dto.EmployeeViewDTO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class EmployeeDAO {

    public int addEmployee(EmployeeDTO emp, Connection connection) throws SQLException, FileNotFoundException, IOException {
        Statement statement = connection.createStatement();

        //BlobImpl blobImpl = new BlobImpl(fis, fis.available());
        int a = statement.executeUpdate("insert into work_force values('" + emp.getEmpId() + "','" + emp.getFname() + "','" + emp.getLname() + "','" + emp.getGender() + "','" + emp.getNIC() + "','" + emp.getDOB() + "','" + emp.getAddress() + "','" + emp.getEPFNo() + "',' ','" + emp.getPassportNo() + "','','','" + emp.getEmail() + "','" + emp.getPhone() + "')");
        String query = "update work_force set Photo=? where emp_id='" + emp.getEmpId() + "';";
        PreparedStatement p = connection.prepareStatement(query);
        //p.setBinaryStream(1, fis);
        FileInputStream fis = null;
        boolean b = true;
        if (!emp.getPhoto().equals("")) {
            File file = new File("C:\\Users\\Chamath\\Desktop/" + emp.getPhoto());
            fis = new FileInputStream(file);
            p.setBinaryStream(1, fis, (int) file.length());
            b = p.execute();
        } else {
            b = false;
        }

        if (!b && a > 0) {
            return a;
        } else {
            return 0;
        }
    }

    public String getLastId(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Emp_Id from work_force order by Emp_Id desc limit 1");
        result.next();
        String id = result.getString("Emp_Id");

        return id;

    }

    public String getEmpStatus(String empId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Status from employee_deactivated where emp_id='" + empId + "'");
        if (result.next()) {
            return result.getString(1);
        } else {
            return "Active";
        }
    }

    public ArrayList<EmployeeTableDTO> getEmployeeForTable(Connection connection) throws SQLException {
        ArrayList<EmployeeDTO> allEmployee = getAllEmployee(connection);
        ArrayList<EmployeeTableDTO> allTable = new ArrayList<>();

        for (EmployeeDTO e : allEmployee) {
            EmployeeTableDTO employeeTableDTO = new EmployeeTableDTO(e.getEmpId(), e.getFname() + " " + e.getLname(), e.getNIC(), e.getDOB(), "", "", "");
          
            String status = getEmpStatus(e.getEmpId(), connection);
            switch (status) {
                case "T":
                    employeeTableDTO.setStatus("Terminated");
                    break;
                case "RS":
                    employeeTableDTO.setStatus("Resigned");
                    break;
                case "RT":
                    employeeTableDTO.setStatus("Retired");
                    break;
                case "M":
                    employeeTableDTO.setStatus("Maternity");
                    break;
                case "Active":
                    employeeTableDTO.setStatus("Active");
            }

            allTable.add(employeeTableDTO);
        }
        return allTable;
    }

    public EmployeeDTO getEmployeeById(String Emp_Id, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet empResult = statement.executeQuery("select * from work_force where Emp_Id = '" + Emp_Id + "'");
        EmployeeDTO empDTO = null;
        empResult.beforeFirst();
        if (empResult.next()) {

            empDTO = new EmployeeDTO();
            empDTO.setEmpId(empResult.getString(1));
            empDTO.setFname(empResult.getString(2));
            empDTO.setLname(empResult.getString(3));
            empDTO.setGender(empResult.getString(4));
            empDTO.setNIC(empResult.getString(5));
            empDTO.setDOB(empResult.getString(6));
            empDTO.setAddress(empResult.getString(7));
            empDTO.setEPFNo(empResult.getString(8));
            empDTO.setPhoto(empResult.getString(9));
            empDTO.setPassportNo(empResult.getString(10));
            empDTO.setEmail(empResult.getString(13));
            empDTO.setPhone(empResult.getString(14));

        }
        return empDTO;
    }

    public EmployeeViewDTO getEmployeeByIdForView(String empId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet empResult = statement.executeQuery("select * from work_force where Emp_Id = '" + empId + "'");
        EmployeeViewDTO empDTO = null;
        empResult.beforeFirst();
        if (empResult.next()) {

            empDTO = new EmployeeViewDTO();
            empDTO.setEmpId(empResult.getString(1));
            empDTO.setFname(empResult.getString(2));
            empDTO.setLname(empResult.getString(3));
            empDTO.setGender(empResult.getString(4));
            empDTO.setNIC(empResult.getString(5));
            empDTO.setDOB(empResult.getString(6));
            empDTO.setAddress(empResult.getString(7));
            empDTO.setEPFNo(empResult.getString(8));
            empDTO.setPhoto(empResult.getBlob(9));
            empDTO.setPassportNo(empResult.getString(10));
            empDTO.setEmail(empResult.getString(13));
            empDTO.setPhone(empResult.getString(14));

        }
        return empDTO;
    }

    public EmployeeDTO getEmployeeByNic(String nic, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet empResult = statement.executeQuery("select * from work_force where NIC = '" + nic + "'");
        EmployeeDTO empDTO = null;
        empResult.beforeFirst();
        if (empResult.next()) {
            empDTO = new EmployeeDTO();
            empDTO.setEmpId(empResult.getString(1));
            empDTO.setFname(empResult.getString(2));
            empDTO.setLname(empResult.getString(3));
            empDTO.setGender(empResult.getString(4));
            empDTO.setNIC(empResult.getString(5));
            empDTO.setDOB(empResult.getString(6));
            empDTO.setAddress(empResult.getString(7));
            empDTO.setEPFNo(empResult.getString(8));
            empDTO.setPhoto(empResult.getString(9));
            empDTO.setPassportNo(empResult.getString(10));
            empDTO.setEmail(empResult.getString(13));

        } else {
            return empDTO;
        }
        return empDTO;
    }

    public EmployeeDTO getEmployeeByEpf(String epf, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet empResult = statement.executeQuery("select * from work_force where EPF_No = '" + epf + "'");
        EmployeeDTO empDTO = null;
        empResult.beforeFirst();
        if (empResult.next()) {
            empDTO = new EmployeeDTO();
            empDTO.setEmpId(empResult.getString(1));
            empDTO.setFname(empResult.getString(2));
            empDTO.setLname(empResult.getString(3));
            empDTO.setGender(empResult.getString(4));
            empDTO.setNIC(empResult.getString(5));
            empDTO.setDOB(empResult.getString(6));
            empDTO.setAddress(empResult.getString(7));
            empDTO.setEPFNo(empResult.getString(8));
            empDTO.setPhoto(empResult.getString(9));
            empDTO.setPassportNo(empResult.getString(10));
            empDTO.setEmail(empResult.getString(13));

        } else {
            return empDTO;
        }
        return empDTO;
    }

    public ArrayList<EmployeeDTO> getEmployeeByname(String fName, String lName, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet empResult = null;

        if (!lName.equals("")) {
            empResult = statement.executeQuery("select * from work_force where fname = '" + fName + "' and lname= '" + lName + "'");
        } else {
            empResult = statement.executeQuery("select * from work_force where fname = '" + fName + "' OR lname = '" + fName + "'");
        }

        ArrayList<EmployeeDTO> empList = new ArrayList<>();
        empResult.beforeFirst();
        while (empResult.next()) {
            EmployeeDTO empDTO = new EmployeeDTO();
            empDTO.setEmpId(empResult.getString(1));
            empDTO.setFname(empResult.getString(2));
            empDTO.setLname(empResult.getString(3));
            empDTO.setGender(empResult.getString(4));
            empDTO.setNIC(empResult.getString(5));
            empDTO.setDOB(empResult.getString(6));
            empDTO.setAddress(empResult.getString(7));
            empDTO.setEPFNo(empResult.getString(8));
            empDTO.setPhoto(empResult.getString(9));
            empDTO.setPassportNo(empResult.getString(10));
            empDTO.setEmail(empResult.getString(13));

            empList.add(empDTO);
        }
        return empList;
    }

    public ArrayList<EmployeeDTO> getAllEmployee(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from work_force order by 1");
        result.beforeFirst();
        ArrayList<EmployeeDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeDTO empDTO = new EmployeeDTO();
            empDTO.setEmpId(result.getString(1));
            empDTO.setFname(result.getString(2));
            empDTO.setLname(result.getString(3));
            empDTO.setGender(result.getString(4));
            empDTO.setNIC(result.getString(5));
            empDTO.setDOB(result.getString(6));
            empDTO.setAddress(result.getString(7));
            empDTO.setEPFNo(result.getString(8));
            empDTO.setPhoto(result.getString(9));
            empDTO.setPassportNo(result.getString(10));
            empDTO.setEmail(result.getString(13));

            list.add(empDTO);
        }
        return list;
    }

    public int deleteEmployee(String empNo, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from work_force where emp_id='" + empNo + "'");
    }

    public int modifyEmployee(String empId, String type, String reason, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date2 = sdf.format(date);
        int result = statement.executeUpdate("insert into employee_deactivated values('" + empId + "','" + date2 + "','" + type + "','" + reason + "')");
        return result;
    }

    public int updateEmployee(EmployeeDTO employeeDTO, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        String empId = employeeDTO.getEmpId();
        String fName = employeeDTO.getFname();
        String lName = employeeDTO.getLname();
        String gender = employeeDTO.getGender();
        String nic = employeeDTO.getNIC();
        String dob = employeeDTO.getDOB();
        String address = employeeDTO.getAddress();
        String epf = employeeDTO.getEPFNo();
        String passport = employeeDTO.getPassportNo();
        String email = employeeDTO.getEmail();
        String phone = employeeDTO.getPhone();

        return statement.executeUpdate("update work_force set fname = '" + fName + "',lname = '" + lName + "',gender = '" + gender + "',nic = '" + nic + "',dob = '" + dob + "',address = '" + address + "',epf_no = '" + epf + "',passport_no = '" + passport + "',dept_id = '',cardre_id = '',email = '" + email + "',Contact_Number = '" + phone + "' where emp_id = '" + empId + "'");

    }

    public ArrayList<EmployeeReportDTO> getAllDepartmentContractEmployee(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT emp_Id, FName, LName, NIC, department.name, cardre.name FROM work_force LEFT JOIN department ON Work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id WHERE emp_id NOT IN (SELECT emp_id FROM employee_permanent) AND work_force.dept_id='" + dept_id + "'");
        ArrayList<EmployeeReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeReportDTO a = new EmployeeReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(4));
            list.add(a);
        }
        return list;

    }

    public ArrayList<EmployeeReportDTO> getAllDepartmentEmployee(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT emp_Id, FName, LName, NIC, department.name, cardre.name FROM work_force LEFT JOIN department ON work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id where work_force.dept_id='" + dept_id + "'");
        ArrayList<EmployeeReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeReportDTO emp = new EmployeeReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(4));
            list.add(emp);
        }
        return list;
    }

    public ArrayList<EmployeeReportDTO> getAllDepartmentPermanentEmployee(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT emp_Id, FName, LName, NIC, department.name, cardre.name FROM work_force LEFT JOIN department ON work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id WHERE emp_id IN ( SELECT emp_id FROM employee_permanent) AND work_force.dept_id='" + dept_id + "'");
        ArrayList<EmployeeReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeReportDTO emp;
            emp = new EmployeeReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(4));
            list.add(emp);
        }
        System.out.println(list);
        return list;
    }

    public ArrayList<EmployeeTRReportDTO> getAllDepartmentTerminatedEmployees(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT employee_deactivated.emp_id, work_force.FName, work_force.LName, department.name, cardre.name, employee_deactivated.Date, employee_deactivated.Reason FROM employee_deactivated LEFT JOIN work_force ON employee_deactivated.emp_id=work_force.emp_id LEFT JOIN department ON work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id WHERE status='T' AND work_force.dept_id='" + dept_id + "' ;");
        ArrayList<EmployeeTRReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeTRReportDTO emp;
            emp = new EmployeeTRReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(6), result.getString(7));
            list.add(emp);
        }
        return list;
    }

    public ArrayList<EmployeeTRReportDTO> getAllDepartmentResignedEmployees(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT employee_deactivated.emp_id, work_force.FName, work_force.LName, department.name, cardre.name, employee_deactivated.Date, employee_deactivated.Reason FROM employee_deactivated LEFT JOIN work_force ON employee_deactivated.emp_id=work_force.emp_id LEFT JOIN department ON work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id WHERE status='RS' AND work_force.dept_id='" + dept_id + "' ;");
        ArrayList<EmployeeTRReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeTRReportDTO emp;
            emp = new EmployeeTRReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(6), result.getString(7));
            list.add(emp);
        }
        return list;
    }

    public ArrayList<EmployeeTRReportDTO> getAllDepartmentRetiredEmployees(Connection connection, String dept_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT employee_deactivated.emp_id, work_force.FName, work_force.LName, department.name, cardre.name, employee_deactivated.Date, employee_deactivated.Reason FROM employee_deactivated LEFT JOIN work_force ON employee_deactivated.emp_id=work_force.emp_id LEFT JOIN department ON work_force.dept_id = department.dept_id LEFT JOIN cardre ON work_force.cardre_id = cardre.cardre_id WHERE status='RT' AND work_force.dept_id='" + dept_id + "' ;");
        ArrayList<EmployeeTRReportDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeTRReportDTO emp;
            emp = new EmployeeTRReportDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(6), result.getString(7));
            list.add(emp);
        }
        return list;
    }

    public boolean isEmployeeIdExcist(String empId, Connection connection) throws SQLException {
        EmployeeDTO employeeById = getEmployeeById(empId, connection);
        if (employeeById == null) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isNicExist(String nic, Connection connection) throws SQLException {
        EmployeeDTO employeeByNic = getEmployeeByNic(nic, connection);
        if (employeeByNic == null) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isEpfExist(String epf, Connection connection) throws SQLException {
        EmployeeDTO employeeByEpf = getEmployeeByEpf(epf, connection);
        if (employeeByEpf == null) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isPassportExist(String passport, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Passport_No from work_force where Passport_No = '" + passport + "'");
        if (result.next()) {
            return true;
        } else {
            return false;
        }
    }

}
