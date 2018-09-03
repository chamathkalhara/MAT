/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AllowanceDTO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author tajini94
 */
public class AllowanceDAO {
    public ArrayList<AllowanceDTO> getAllAllowance(Connection connection) throws SQLException{
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select * from allowance");
        ArrayList<AllowanceDTO> list = new ArrayList<>();
        
        result.beforeFirst();
        while (result.next()) {
            AllowanceDTO d = new AllowanceDTO(result.getString(1), result.getString(2), result.getString(3), result.getInt(4));
            list.add(d);
        }
        return list;
    }
    
    public String getLastId(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("select Allowance_Id from allowance order by Allowance_Id desc limit 1");
        result.next();
        String id = result.getString("Allowance_Id");

        return id;

    }
    
    public int deleteAllowance(String allowanceId, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeUpdate("delete from allowance where Allowance_Id='" + allowanceId + "'");
    }
}
