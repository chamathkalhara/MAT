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
public class UserDTO {
    private String emp_Id;
    private String userID;
    private String password;
    private String user_Level;

    public UserDTO() {
    }

    public UserDTO(String emp_Id,String userID,String user_Level, String password) {
        this.userID = userID;
        this.password = password;
        this.user_Level = user_Level;
        this.emp_Id = emp_Id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmp_Id() {
        return emp_Id;
    }

    public void setEmp_Id(String emp_Id) {
        this.emp_Id = emp_Id;
    }

    public String getUser_Level() {
        return user_Level;
    }

    public void setUser_Level(String user_Level) {
        this.user_Level = user_Level;
    }
    
}
