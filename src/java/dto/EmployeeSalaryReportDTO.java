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
public class EmployeeSalaryReportDTO {
    private String empId;
    private String name;
    private String department;
    private String cadre;
    private double salary;
    private String travelling;
    private String mobile;
    private String vehicle;
    private String fuel;
    private String meal;
    private double total;

    public EmployeeSalaryReportDTO() {
    }

    public EmployeeSalaryReportDTO(String empId, String name, String department, String cadre, double salary, String travelling, String mobile, String vehicle, String fuel, String meal, double total) {
        this.empId = empId;
        this.name = name;
        this.department = department;
        this.cadre = cadre;
        this.salary = salary;
        this.travelling = travelling;
        this.mobile = mobile;
        this.vehicle = vehicle;
        this.fuel = fuel;
        this.meal = meal;
        this.total = total;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCadre() {
        return cadre;
    }

    public void setCadre(String cadre) {
        this.cadre = cadre;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getTravelling() {
        return travelling;
    }

    public void setTravelling(String travelling) {
        this.travelling = travelling;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
    
}
