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
public class LoanDTO {
    private String Loan_Id;
    private String Loan_Date;
    private String Amount;
    private String Period;
    private String Status;
    private String Emp_Id;

    public LoanDTO() {
    }

    public LoanDTO(String Loan_Id, String Loan_Date, String Amount, String Period, String Status, String Emp_Id) {
        this.Loan_Id = Loan_Id;
        this.Loan_Date = Loan_Date;
        this.Amount = Amount;
        this.Period = Period;
        this.Status = Status;
        this.Emp_Id = Emp_Id;
    }

    public String getLoan_Id() {
        return Loan_Id;
    }

    public String getLoan_Date() {
        return Loan_Date;
    }

    public String getAmount() {
        return Amount;
    }

    public String getPeriod() {
        return Period;
    }

    public String getStatus() {
        return Status;
    }

    public String getEmp_Id() {
        return Emp_Id;
    }

    public void setLoan_Id(String Loan_Id) {
        this.Loan_Id = Loan_Id;
    }

    public void setLoan_Date(String Loan_Date) {
        this.Loan_Date = Loan_Date;
    }

    public void setAmount(String Amount) {
        this.Amount = Amount;
    }

    public void setPeriod(String Period) {
        this.Period = Period;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setEmp_Id(String Emp_Id) {
        this.Emp_Id = Emp_Id;
    }
       
    
}
