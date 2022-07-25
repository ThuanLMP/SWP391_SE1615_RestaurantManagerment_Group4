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
public class Rate {
    int rateid;
    Customer cus;
    String tid;
    int star;
    Date date;
    String comment;

    public Rate() {
    }

    public Rate(int rateid, Customer cus, String tid, int star, Date date, String comment) {
        this.rateid = rateid;
        this.cus = cus;
        this.tid = tid;
        this.star = star;
        this.date = date;
        this.comment = comment;
    }

    public int getRateid() {
        return rateid;
    }

    public void setRateid(int rateid) {
        this.rateid = rateid;
    }

    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    
    
    
}



