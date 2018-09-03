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
public class ContractDTO {
    private String contractId;
    private String period;
    private String startDate;
    private int fullDay;
    private int shortLeave;
    private String contractName;

    
    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getFullDay() {
        return fullDay;
    }

    public void setFullDay(int fullDay) {
        this.fullDay = fullDay;
    }

    public int getShortLeave() {
        return shortLeave;
    }

    public void setShortLeave(int shortLeave) {
        this.shortLeave = shortLeave;
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    public ContractDTO() {
    }

    public ContractDTO(String contractId, String period, String startDate, int fullDay, int shortLeave, String contractName) {
        this.contractId = contractId;
        this.period = period;
        this.startDate = startDate;
        this.fullDay = fullDay;
        this.shortLeave = shortLeave;
        this.contractName = contractName;
    }
    
    
}
