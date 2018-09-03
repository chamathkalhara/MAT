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
public class UserTableDTO {
    private String empid;
    private String name;
    private String userName;
    private String userLevel;

    public UserTableDTO() {
    }

    public UserTableDTO(String empid, String name, String userName, String userLevel) {
        this.empid = empid;
        this.name = name;
        this.userName = userName;
        this.userLevel = userLevel;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }
    
    
}
