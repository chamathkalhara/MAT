 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.EmployeeDTO;
import dto.UserDTO;
import dto.UserProfileInfoDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class UserDAO {
    private String sql;
    public int addUser(UserDTO user,Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        return statement.executeUpdate("insert into users values('"+user.getEmp_Id()+"','"+user.getUserID()+"','"+user.getUser_Level()+"','"+user.getPassword()+"')");
        
    }
    public ArrayList<UserDTO> getAllUsers(Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from users order by 1");
        result.beforeFirst();
        ArrayList<UserDTO> list = new ArrayList<>();
        while (result.next()) {
            UserDTO userDTO = new UserDTO();
            userDTO.setEmp_Id(result.getString(1));
            userDTO.setUserID(result.getString(2));
            userDTO.setUser_Level(result.getString(3));
            
            list.add(userDTO);
        }
        return list;
    }
    
    public ArrayList<EmployeeDTO> getAllEmployee(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from work_force order by 1");
        result.beforeFirst();
        ArrayList<EmployeeDTO> list = new ArrayList<>();
        while (result.next()) {
            EmployeeDTO empDTO = new EmployeeDTO();
            empDTO.setEmpId(result.getString(1));
            empDTO.setFname(result.getString(2));
            empDTO.setLname(result.getString(3));
            empDTO.setGender(result.getString(4));
            empDTO.setNIC(result.getString(5));
            empDTO.setDOB(result.getString(6));
            empDTO.setAddress(result.getString(7));
            empDTO.setEPFNo(result.getString(8));
            empDTO.setPhoto(result.getString(9));
            empDTO.setPassportNo(result.getString(10));
            empDTO.setEmail(result.getString(13));

            list.add(empDTO);
        }
        return list;
    }
    public UserDTO getUser(String userId,Connection connection) throws SQLException{
        
        Statement statement = connection.createStatement();
        ResultSet userResult = statement.executeQuery("select * from users where userId = '"+userId+"'");
        UserDTO userDTO = new UserDTO();
        userResult.beforeFirst();
        if(userResult.next()){
            userDTO.setUserID(userResult.getString(2));
            userDTO.setPassword(userResult.getString(4));
            userDTO.setEmp_Id(userResult.getString(1));
            userDTO.setUser_Level(userResult.getString(3));
        }
        return userDTO;
    }
    
    public UserProfileInfoDTO getUserProfileInfo(String empId,Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        String sql = "select e.Emp_Id,e.FName,e.LName,e.Photo,e.Email,c.Name from work_force e,cardre c where e.Cardre_Id = c.Cardre_Id AND e.Emp_Id = '"+empId+"'";
        ResultSet resultSet = statement.executeQuery(sql);
        UserProfileInfoDTO userProfileInfoDTO = new UserProfileInfoDTO();
        resultSet.beforeFirst();
        if(resultSet.next()){
            userProfileInfoDTO.setEmpId(resultSet.getString(1));
            userProfileInfoDTO.setName(resultSet.getString(2)+" "+resultSet.getString(3));
            userProfileInfoDTO.setPhoto(resultSet.getBlob(4));
            userProfileInfoDTO.setEmail(resultSet.getString(5));
            
        }
        return userProfileInfoDTO;
    }
    public int updateUser(UserDTO user,Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        return statement.executeUpdate("update users set userId = '"+user.getUserID()+"',user_level = '"+user.getUser_Level()+"' where Emp_id = '"+user.getEmp_Id()+"'");
    }
    
    public int deleteUser(String empNo, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from users where Emp_Id='" +empNo+"'");
    }

    public int changePassword(String username, String password, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("update users set password = '"+password+"' where userId = '"+username+"'");
    }
    
}
