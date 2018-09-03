/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ASUS
 */
public class EmployeeContractDTO {
    private String EmpId;
    private String type;
    private String date;
    private int salary;

    public String getEmpId() {
        return EmpId;
    }

    public void setEmpId(String EmpId) {
        this.EmpId = EmpId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public EmployeeContractDTO(String EmpId, String type, String date, int salary) {
        this.EmpId = EmpId;
        this.type = type;
        this.date = date;
        this.salary = salary;
    }

    public EmployeeContractDTO() {
    }
    
    
}
