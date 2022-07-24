/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author win
 */
public class Attendence {
    String eid;
    Date date;
    int atten;

    public Attendence() {
    }

    public Attendence(String eid, Date date, int atten) {
        this.eid = eid;
        this.date = date;
        this.atten = atten;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }
   

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAtten() {
        return atten;
    }

    public void setAtten(int atten) {
        this.atten = atten;
    }
    
    
}


