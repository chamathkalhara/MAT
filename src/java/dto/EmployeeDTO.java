/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Blob;

/**
 *
 * @author ASUS
 */
public class EmployeeDTO {
    private String EmpId;
    private String Fname;
    private String Lname;
    private String Gender;
    private String NIC;
    private String DOB;
    private String Address;
    private String EPFNo;
    private String photo;
    private String PassportNo;
    private String email;
    private String phone;

    public EmployeeDTO() {
    }

    public EmployeeDTO(String EmpId, String Fname, String Lname, String Gender, String NIC, String DOB, String Address, String EPFNo, String photo, String PassportNo, String email, String phone) {
        this.EmpId = EmpId;
        this.Fname = Fname;
        this.Lname = Lname;
        this.Gender = Gender;
        this.NIC = NIC;
        this.DOB = DOB;
        this.Address = Address;
        this.EPFNo = EPFNo;
        this.photo = photo;
        this.PassportNo = PassportNo;
        this.email = email;
        this.phone = phone;
    }

    
    
    public String getEmpId() {
        return EmpId;
    }

    public void setEmpId(String EmpId) {
        this.EmpId = EmpId;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEPFNo() {
        return EPFNo;
    }

    public void setEPFNo(String EPFNo) {
        this.EPFNo = EPFNo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPassportNo() {
        return PassportNo;
    }

    public void setPassportNo(String PassportNo) {
        this.PassportNo = PassportNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    
}
