/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author sashika
 */
public class CheckLoanDetailsDTO {
    private String empId;
    private String empName;
    private String maxMonth;
    private double maxAmount;
    private String eAmount;
    private String eMonth;
    private String payment;

    public CheckLoanDetailsDTO() {
    }

    public CheckLoanDetailsDTO(String empId, String empName, String maxMonth, double maxAmount, String eAmount, String eMonth, String payment) {
        this.empId = empId;
        this.empName = empName;
        this.maxMonth = maxMonth;
        this.maxAmount = maxAmount;
        this.eAmount = eAmount;
        this.eMonth = eMonth;
        this.payment = payment;
    }

    public String getEmpId() {
        return empId;
    }

    public String getEmpName() {
        return empName;
    }

    public String getMaxMonth() {
        return maxMonth;
    }

    public double getMaxAmount() {
        return maxAmount;
    }

    public String geteAmount() {
        return eAmount;
    }

    public String geteMonth() {
        return eMonth;
    }

    public String getPayment() {
        return payment;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public void setMaxMonth(String maxMonth) {
        this.maxMonth = maxMonth;
    }

    public void setMaxAmount(double maxAmount) {
        this.maxAmount = maxAmount;
    }

    public void seteAmount(String eAmount) {
        this.eAmount = eAmount;
    }

    public void seteMonth(String eMonth) {
        this.eMonth = eMonth;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
    
    

    
}
