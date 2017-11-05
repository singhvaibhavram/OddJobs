package oddjobs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MOhit Sharma
 */
public class Test {
    public String  test(String string){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/oddjobs","root","mohit");
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("select * from user");
                String s = ""; 
                while(rs.next()){
                    s += rs.getString("name");
                    s += " | ";
                }
                rs.close();
                statement.close();
                con.close();
                return s;
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
                return ex.toString();
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return ex.toString();
        }
       
    }
}
