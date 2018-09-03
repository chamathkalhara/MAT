/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.EmployeeSalaryReportDAO;
import dto.EmployeeAllowanceSalaryDTO;
import dto.EmployeeAllowanceViewDTO;
import dto.EmployeeSalaryReportDTO;
import dto.EmployeeSalaryViewDTO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class EmployeeSalaryReportService {
    
    
    EmployeeSalaryReportDAO employeeSalaryReportDAO = new EmployeeSalaryReportDAO();
    
    
    private ArrayList<EmployeeSalaryReportDTO> getEmployeeSalaryReportDetailsWithoutTotal(Connection connection) throws SQLException{
        ArrayList<EmployeeSalaryViewDTO> employeeSalaryViewList = employeeSalaryReportDAO.getEmployeeSalaryViewDetails(connection);
        ArrayList<EmployeeAllowanceViewDTO> employeeAllowanceViewList = employeeSalaryReportDAO.getEmployeeAllowanceViewDetails(connection);
        ArrayList<EmployeeSalaryReportDTO> employeeSalaryReportDTO = new ArrayList<>();
        
        for(EmployeeSalaryViewDTO c:employeeSalaryViewList){
            EmployeeSalaryReportDTO e = new EmployeeSalaryReportDTO();
            e.setEmpId(c.getEmpId());
            e.setName(c.getName());
            e.setDepartment(c.getDepartment());
            e.setCadre(c.getCadre());
            e.setSalary(c.getSalary());
            employeeSalaryReportDTO.add(e);
        }
        
        ArrayList<EmployeeSalaryReportDTO> newList = new ArrayList<>();
        ArrayList<EmployeeSalaryReportDTO> finalList = new ArrayList<>();
        
        for(EmployeeSalaryReportDTO a:employeeSalaryReportDTO){
            String empId = a.getEmpId();
            for(EmployeeAllowanceViewDTO b:employeeAllowanceViewList){
                if(empId.equals(b.getEmpId())){
                    
                    String allowance = b.getAllowance();
                    if(!"Meal".equals(allowance)){
                        String[] split = allowance.split("-");
                        if("Travelling".equals(split[0])){
                            a.setTravelling(split[1]);
                        }else if("Mobile".equals(split[0])){
                            a.setMobile(split[1]);
                        }else if("Vehicle".equals(split[0])){
                            a.setVehicle(split[1]);
                        }else if("Fuel".equals(split[0])){
                            a.setFuel(split[1]);
                        }
                    }else{
                        a.setMeal("Yes");
                    }
                    
                }
                
            }
            newList.add(a);
        }
        for(EmployeeSalaryReportDTO a:newList){
            if(a.getTravelling() == null){
                a.setTravelling("No");
            }
            if(a.getMobile() == null){
                a.setMobile("No");
            }
            if(a.getVehicle() == null){
                a.setVehicle("No");
            }
            if(a.getFuel()== null){
                a.setFuel("No");
            }
            if(a.getMeal()== null){
                a.setMeal("No");
            }
            finalList.add(a);
        }
        
        return newList;
    }
    
    public ArrayList<EmployeeSalaryReportDTO> getEmployeeSalaryReportDetails(Connection connection) throws SQLException{
        ArrayList<EmployeeSalaryReportDTO> employeeSalaryReportDetailsWithoutTotal = getEmployeeSalaryReportDetailsWithoutTotal(connection);
        ArrayList<EmployeeSalaryReportDTO> employeeSalaryReportDetails = new ArrayList<>();
        ArrayList<EmployeeAllowanceSalaryDTO> employeeAllowanceTotal = employeeSalaryReportDAO.getEmployeeAllowanceTotal(connection);
        for(EmployeeSalaryReportDTO s : employeeSalaryReportDetailsWithoutTotal){
            for(EmployeeAllowanceSalaryDTO a : employeeAllowanceTotal){
                if(s.getEmpId().equals(a.getEmpId())){
                    s.setTotal(s.getSalary()+a.getTotal());
                }
            }
            employeeSalaryReportDetails.add(s);
        }
        return employeeSalaryReportDetails;
    }
    
    public ArrayList<EmployeeSalaryViewDTO> getAllEmployee(Connection connection) throws SQLException{
        
        ArrayList<EmployeeSalaryViewDTO> employeeSalaryViewDetails = employeeSalaryReportDAO.getEmployeeSalaryViewDetails(connection);
        return employeeSalaryViewDetails;
    }
}
