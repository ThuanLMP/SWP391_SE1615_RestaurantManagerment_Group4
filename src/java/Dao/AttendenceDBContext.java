/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Attendence;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author win
 */
public class AttendenceDBContext extends DBContext{
    
    public ArrayList<Attendence> getAtten() {
        ArrayList<Attendence> attens = new ArrayList<>();
        try {
            String sql = "select*from [Attendence]";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence atten = new Attendence();
                atten.setEid(rs.getString("eid"));
                atten.setDate(rs.getDate("date"));
                atten.setAtten(rs.getInt("atten")); 
                attens.add(atten);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return attens;
    }
      
    public ArrayList<Attendence> getAttenByEid(String eid) {
        ArrayList<Attendence> attens = new ArrayList<>();
        try {
            String sql = "select*from [Attendence] where eid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence atten = new Attendence();
                atten.setEid(rs.getString("eid"));
                atten.setDate(rs.getDate("date"));
                atten.setAtten(rs.getInt("atten"));     
                attens.add(atten);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return attens;
    }
    
    public static void main(String[] args) {
        AttendenceDBContext a = new AttendenceDBContext();
        ArrayList<Attendence> b = a.getAttenByEid("E03");
        System.out.println(b);
            
    }

//    public void takeAtten(Attendence e) {
//        String sql = "UPDATE Salary \n"
//                + "SET  takeatten =? , enddate=? \n"
//                + "WHERE eid = ?";
//        LocalDate date_raw = java.time.LocalDate.now();
//            Date date = Date.valueOf(date_raw);
//        try {
//        PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, e.getTakeatten()+1);
//            stm.setDate(2,date);
//            stm.setString(3, e.getEid());
//            stm.executeUpdate();
//        } catch (SQLException ex) {
//            System.out.println(ex);
//        }
//    }

    public void takeAtten(String eid) {
        String sql = "insert into Attendence (eid,date,atten) values (?,?,?) ";
        AccountDBContext a = new AccountDBContext();
        LocalDate date_raw = java.time.LocalDate.now();
        Date date = Date.valueOf(date_raw);
         try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, eid);
            st.setDate(2, date);
            st.setInt(3, 1);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public void addAtten(String eid, Date date){
        String sql = "insert into Attendence (eid,date,atten) "
                + "values (?,?,?) ";
         try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,eid);
            st.setDate(2, date);
            st.setInt(3, 1);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
}


