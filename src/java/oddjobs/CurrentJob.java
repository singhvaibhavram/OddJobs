/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oddjobs;

/**
 *
 * @author MOhit Sharma
 */
public class CurrentJob {
    private int id;
    private int job_id;
    private int job_giver;
    private int job_taker;
    private boolean status;

    public void setId(int id) {
        this.id = id;
    }

    public void setJob_giver(int job_giver) {
        this.job_giver = job_giver;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public void setJob_taker(int job_taker) {
        this.job_taker = job_taker;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public int getId() {
        return id;
    }

    public int getJob_giver() {
        return job_giver;
    }

    public int getJob_id() {
        return job_id;
    }

    public int getJob_taker() {
        return job_taker;
    }
    
}
