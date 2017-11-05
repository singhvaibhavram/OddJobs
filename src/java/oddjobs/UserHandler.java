/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oddjobs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MOhit Sharma
 */
public class UserHandler {
    private String TableName = "user";
    private DatabaseHelper databaseHelper;
    private String sql;
    public UserHandler() {
        databaseHelper = new DatabaseHelper();
    }
    
    public List<User> getAllUser(){
        sql = "Select * from " + TableName;
        ResultSet rs = databaseHelper.getQueryResult(sql);
        databaseHelper.close();
        List<User> users = new ArrayList<>();
        if(rs != null) {
            try {
                while(rs.next()) {
                    User user = getUserFromResultSet(rs);
                    if(user != null) {
                        users.add(user);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserHandler.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }
        
        return users;
    }
    
    public User getUserFromResultSet(ResultSet rs) {
        User user = new User();
        try{
            user.setId(rs.getInt("id"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setPermission(rs.getBoolean("permission"));
            user.setPhone(rs.getString("phone"));
            
        }catch(Exception e) {
            System.out.println(e);
            return null;
        }
        return user;
    }
    
    public String test() {
        ResultSet rs = databaseHelper.getQueryResult("sds");
        try {
            String s = "";
            while(rs.next()){
                s += getUserFromResultSet(rs).getName();
            }
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(UserHandler.class.getName()).log(Level.SEVERE, null, ex);
            return ex.toString();
        }
        
    }
}
