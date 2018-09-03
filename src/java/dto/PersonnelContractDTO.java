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
public class PersonnelContractDTO {
    private String empid;
    private String name;
    private String dept;
    private String cadre;
    private String contractid;
    private String contractname;
    private String period;
    private String fullday;
    private String shortleave;
    private String date;
    private String basicsalary;
    private String allowancename;
    private String allowancedes;
    private String amount;

    public PersonnelContractDTO() {
    }

    public PersonnelContractDTO(String empid, String name, String dept, String cadre, String contractid, String contractname, String period, String fullday, String shortleave, String date, String basicsalary, String allowancename, String allowancedes, String amount) {
        this.empid = empid;
        this.name = name;
        this.dept = dept;
        this.cadre = cadre;
        this.contractid = contractid;
        this.contractname = contractname;
        this.period = period;
        this.fullday = fullday;
        this.shortleave = shortleave;
        this.date = date;
        this.basicsalary = basicsalary;
        this.allowancename = allowancename;
        this.allowancedes = allowancedes;
        this.amount = amount;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
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

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCadre() {
        return cadre;
    }

    public void setCadre(String cadre) {
        this.cadre = cadre;
    }

    public String getContractid() {
        return contractid;
    }

    public void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public String getContractname() {
        return contractname;
    }

    public void setContractname(String contractname) {
        this.contractname = contractname;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getFullday() {
        return fullday;
    }

    public void setFullday(String fullday) {
        this.fullday = fullday;
    }

    public String getShortleave() {
        return shortleave;
    }

    public void setShortleave(String shortleave) {
        this.shortleave = shortleave;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBasicsalary() {
        return basicsalary;
    }

    public void setBasicsalary(String basicsalary) {
        this.basicsalary = basicsalary;
    }

    public String getAllowancename() {
        return allowancename;
    }

    public void setAllowancename(String allowancename) {
        this.allowancename = allowancename;
    }

    public String getAllowancedes() {
        return allowancedes;
    }

    public void setAllowancedes(String allowancedes) {
        this.allowancedes = allowancedes;
    }
    
    
}
