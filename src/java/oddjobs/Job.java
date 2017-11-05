/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oddjobs;

import java.sql.Date;

/**
 *
 * @author MOhit Sharma
 */
public class Job {
    private int id;
    private String name;
    private String category;
    private String description;
    private int user_id;
    private String start_date;
    private String end_date;
    private int price;
    private boolean permission;

    public void setCategory(String category) {
        this.category = category;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
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

    public void setPrice(int price) {
        this.price = price;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isPermission() {
        return permission;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public String getEnd_date() {
        return end_date;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getStart_date() {
        return start_date;
    }

    public int getUser_id() {
        return user_id;
    }
    
}
