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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MOhit Sharma
 */
public class User {
    
    private int id;
    private String name;
    private String email;
    private String phone;
    private boolean permission;
    
    public User(String name) {
        this.name = name;
    }
    
    public User() {
        
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPermission(boolean permission) {
        this.permission = permission;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    public String getEmail(){
        return this.email;
    }
    
    public String getPhone(){
        return this.phone;
    }

    public int getId() {
        return id;
    }

    public boolean isPermission() {
        return permission;
    }
    
    public String getName() {
        return this.name;
    }
}
