/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Customer;
import Model.Rate;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author win
 */
public class RateDBContext extends DBContext{
    public ArrayList<Rate> getRates() {
        ArrayList<Rate> rates = new ArrayList<>();
        try {
            String sql = " select e.cid,e.cname,e.gmail,e.cphone,r.rateid,r.tid,r.star,r.date,r.comment "
                    + "from Customer e join Rate r on e.cid = r.cid";
            PreparedStatement stm = connection.prepareStatement(sql);           
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Rate rate = new Rate();
                rate.setRateid(rs.getInt("rateid"));
                rate.setTid(rs.getString("tid"));
                rate.setCus(new Customer(rs.getInt("cid"),rs.getString("cname"),rs.getString("gmail"),rs.getString("cphone")));
                rate.setStar(rs.getInt("star"));
                rate.setDate(rs.getDate("date"));
                rate.setComment(rs.getString("comment"));
                rates.add(rate);                
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return rates;
    }
    
    public int lastRateid() {
        int max = 0;
        ArrayList<Rate> rates = getRates();
        if(rates != null){
            for (int i = 0; i < rates.size(); i++) {
                if(rates.get(i).getRateid() > max){
                    max = rates.get(i).getRateid();
                }
            }
        }
        return max;
    }
    
    public void addRate(Rate rate) {
        String sql = "insert into Rate (rateid,cid,tid,star,date,comment) values (?,?,?,?,?,?) ";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, rate.getRateid());
            st.setInt(2, rate.getCus().getId());
            st.setString(3, rate.getTid());
            st.setInt(4, rate.getStar());
            st.setDate(5, rate.getDate());
            st.setString(6, rate.getComment());
            st.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex);
        }
        
    }
    
    public static void main(String[] args) {
        RateDBContext rb = new RateDBContext();
        ArrayList<Rate> a = rb.getRates();
        System.out.println(a );
       
    }
}



