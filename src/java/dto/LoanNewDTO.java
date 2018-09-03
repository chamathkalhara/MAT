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
public class LoanNewDTO {
    private String loan_Id;
    private String loan_Date;
    private String amount;
    private String period;
    private String status;
    private String emp_Id;
    private String fullName;

    public LoanNewDTO() {
    }

    public LoanNewDTO(String loan_Id, String loan_Date, String amount, String period, String status, String emp_Id, String fullName) {
        this.loan_Id = loan_Id;
        this.loan_Date = loan_Date;
        this.amount = amount;
        this.period = period;
        this.status = status;
        this.emp_Id = emp_Id;
        this.fullName = fullName;
    }

    public String getLoan_Id() {
        return loan_Id;
    }

    public String getLoan_Date() {
        return loan_Date;
    }

    public String getAmount() {
        return amount;
    }

    public String getPeriod() {
        return period;
    }

    public String getStatus() {
        return status;
    }

    public String getEmp_Id() {
        return emp_Id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setLoan_Id(String loan_Id) {
        this.loan_Id = loan_Id;
    }

    public void setLoan_Date(String loan_Date) {
        this.loan_Date = loan_Date;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setEmp_Id(String emp_Id) {
        this.emp_Id = emp_Id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
}
