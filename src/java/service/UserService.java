/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.UserDAO;
import dto.UserDTO;
import dto.UserProfileInfoDTO;
import dto.UserTableDTO;
import java.security.Key;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author ASUS
 */
public class UserService {

    private static final String ALGORITHM = "AES";
    private static final String KEY = "1Hbfh667adfDEJ78";

    private static String encrypt(String value) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(UserService.ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));
        String encryptedValue64 = new BASE64Encoder().encode(encryptedByteValue);
        return encryptedValue64;

    }

    private static String decrypt(String value) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(UserService.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decryptedValue64 = new BASE64Decoder().decodeBuffer(value);
        byte[] decryptedByteValue = cipher.doFinal(decryptedValue64);
        String decryptedValue = new String(decryptedByteValue, "utf-8");
        return decryptedValue;

    }

    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec(UserService.KEY.getBytes(), UserService.ALGORITHM);
        return key;
    }
    
    UserDAO userDAO = new UserDAO();
    
    public boolean addUser(UserDTO user,Connection connection) throws SQLException, Exception{
        userDAO = new UserDAO();
        UserDTO newUser = new UserDTO(user.getEmp_Id(),user.getUserID(),user.getUser_Level(),encrypt(user.getPassword()));
        
        int result = userDAO.addUser(newUser, connection);
        if (result > 0) {
            return true;
        }else{
            return false;
        }
    }
    
    public UserDTO getUser(String userId,Connection connection) throws SQLException, Exception{
        
        UserDTO result = userDAO.getUser(userId, connection);
        if (result.getUserID() == null) {
            return result;
        }else{  
            return new UserDTO(result.getEmp_Id(),result.getUserID(), result.getUser_Level(),decrypt(result.getPassword()));
        }
    }
    
    public UserProfileInfoDTO getUserProfileInfo(String empId,Connection connection) throws SQLException{
        return userDAO.getUserProfileInfo(empId, connection);
    }
    
    public ArrayList<UserDTO> getAllUsers(Connection connection) throws SQLException{
        
        ArrayList<UserDTO> list = userDAO.getAllUsers(connection);
        return list;
    }
    
    public ArrayList<UserTableDTO> getAllUsersForTable(Connection connection) throws SQLException{
        ArrayList<UserDTO> allUsers = getAllUsers(connection);
        ArrayList<UserTableDTO> allTableUsers = new ArrayList<>();
        for(UserDTO u : allUsers){
            UserProfileInfoDTO userProfileInfo = getUserProfileInfo(u.getEmp_Id(), connection);
            UserTableDTO a = new UserTableDTO(u.getEmp_Id(), userProfileInfo.getName(), u.getUserID(), u.getUser_Level());
            allTableUsers.add(a);
        }
        return allTableUsers;
    }
    
    public boolean updateUser(UserDTO user,Connection connection) throws SQLException{
        int result = userDAO.updateUser(user, connection);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean deleteUser(String empNo, Connection connection) throws SQLException{
        int deleteUser = userDAO.deleteUser(empNo, connection);
        if (deleteUser >0) {
            return true;
        }else{
            return false;
        }
    }
    
    public boolean changePassword(String username, String password,Connection connection) throws Exception{
        int result = userDAO.changePassword(username,encrypt(password),connection);
        if (result >0) {
            return true;
        }else{
            return false;
        }
    }

}
