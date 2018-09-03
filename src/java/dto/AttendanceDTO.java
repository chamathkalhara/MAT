/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Time;

/**
 *
 * @author Chamath
 */
public class AttendanceDTO {
    private String id;
    private String empId;
    private Time timeIn;
    private Time timeOut;

    public AttendanceDTO(String id, String empId, Time timeIn, Time timeOut) {
        this.id = id;
        this.empId = empId;
        this.timeIn = timeIn;
        this.timeOut = timeOut;
    }

    public AttendanceDTO() {
    }

    
    
    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public Time getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(Time timeIn) {
        this.timeIn = timeIn;
    }

    public Time getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(Time timeOut) {
        this.timeOut = timeOut;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    
}
