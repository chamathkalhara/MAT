/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Chamath
 */
public class EmployeePerformanceGraphDTO {
    private String name;
    private int communication;
    private int commitment;
    private int initiative;
    private int leadership;
    private int productivity;
    private int creativity;
    private int dependability;
    private int accountability;

    public EmployeePerformanceGraphDTO() {
    }

    public EmployeePerformanceGraphDTO(String name, int communication, int commitment, int initiative, int leadership, int productivity, int creativity, int dependability, int accountability) {
        this.name = name;
        this.communication = communication;
        this.commitment = commitment;
        this.initiative = initiative;
        this.leadership = leadership;
        this.productivity = productivity;
        this.creativity = creativity;
        this.dependability = dependability;
        this.accountability = accountability;
    }

    public String getEmpid() {
        return name;
    }

    public void setEmpid(String name) {
        this.name = name;
    }

    public int getCommunication() {
        return communication;
    }

    public void setCommunication(int communication) {
        this.communication = communication;
    }

    public int getCommitment() {
        return commitment;
    }

    public void setCommitment(int commitment) {
        this.commitment = commitment;
    }

    public int getInitiative() {
        return initiative;
    }

    public void setInitiative(int initiative) {
        this.initiative = initiative;
    }

    public int getLeadership() {
        return leadership;
    }

    public void setLeadership(int leadership) {
        this.leadership = leadership;
    }

    public int getProductivity() {
        return productivity;
    }

    public void setProductivity(int productivity) {
        this.productivity = productivity;
    }

    public int getCreativity() {
        return creativity;
    }

    public void setCreativity(int creativity) {
        this.creativity = creativity;
    }

    public int getDependability() {
        return dependability;
    }

    public void setDependability(int dependability) {
        this.dependability = dependability;
    }

    public int getAccountability() {
        return accountability;
    }

    public void setAccountability(int accountability) {
        this.accountability = accountability;
    }
    
    
}
