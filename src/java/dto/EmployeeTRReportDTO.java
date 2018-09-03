/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dto;

/**
 *
 * @author Asus
 */
public class EmployeeTRReportDTO {
    private String empid;
    private String name;
    private String date;
    private String reason;

    public EmployeeTRReportDTO() {
    }

    public EmployeeTRReportDTO(String empid, String name, String date, String reason) {
        this.empid = empid;
        this.name = name;
        this.date = date;
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
}
