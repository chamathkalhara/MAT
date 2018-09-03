/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author tajini94
 */
public class ContractRenewalDTO {
    private String employee_id;
    private String employee_name;
    private String contract_id;
    private String contract_name;
    private String start_date;
    private String end_date;

    public ContractRenewalDTO() {
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public void setContract_id(String contract_id) {
        this.contract_id = contract_id;
    }

    public void setContract_name(String contract_name) {
        this.contract_name = contract_name;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public String getContract_id() {
        return contract_id;
    }

    public String getContract_name() {
        return contract_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public ContractRenewalDTO(String employee_id, String employee_name, String contract_id, String contract_name, String start_date, String end_date) {
        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.contract_id = contract_id;
        this.contract_name = contract_name;
        this.start_date = start_date;
        this.end_date = end_date;
    }
    
    
}
