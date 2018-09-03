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
public class EmployeeReportDTO {
    private String empId;
    private String name;
    private String nic;
      
    

    public EmployeeReportDTO() {
    }

    public EmployeeReportDTO(String empId, String name, String nic) {
        this.empId = empId;
        this.name = name;
        this.nic = nic;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
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
    
}
