/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Chamath
 */
public class EmployeeTableDTO {
    private String empid;
    private String name;
    private String nic;
    private String dob;
    private String cadre;
    private String department;
    private String status;

    public EmployeeTableDTO(String empid, String name, String nic, String dob, String cadre, String department, String status) {
        this.empid = empid;
        this.name = name;
        this.nic = nic;
        this.dob = dob;
        this.cadre = cadre;
        this.department = department;
        this.status = status;
    }

    public EmployeeTableDTO() {
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmpid() {
        return empid;
    }

    public void setEmpid(String empid) {
        this.empid = empid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCadre() {
        return cadre;
    }

    public void setCadre(String cadre) {
        this.cadre = cadre;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    
}
