/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oddjobs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MOhit Sharma
 */
public class DatabaseHelper {

    private Connection con;
    private Statement statement;
    
    public DatabaseHelper() {
    }
    
    private Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost/oddjobs","root","mohit");
                return con;
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private Statement getStatement() throws SQLException {
        statement = getConnection().createStatement();
        return statement;
    }
    
    
    //Call this function to get query result;
    public ResultSet getQueryResult(String Query){
        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/oddjobs","root","mohit");
               Statement statement = con.createStatement();
               rs = statement.executeQuery("select * from user");
               return rs;
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean insertJob(Job job) {
        ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/oddjobs","root","mohit");
               Statement statement = con.createStatement();
               String sql = "Insert into job_add(name,category,description,user_id,start_date,end_date,price) values("
                       + job.getName() + ","
                       + job.getCategory() + ","
                       + job.getDescription() + ","
                       + "2" + ","
                       + job.getStart_date() + ","
                       + job.getEnd_date() + ","
                       + job.getPrice()
                       + ")";
               rs = statement.executeQuery(sql);
               if(rs != null) {
                   return true;
               }
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void close(){
        try {
            con.close();
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
