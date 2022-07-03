/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ITACHI
 */
public class AccountDBContext extends DBContext {
     public Account login(String user, String pass) {
        try {
            String sql = "select * from Account where username=? and password=?";
            PreparedStatement st=connection.prepareStatement(sql);            
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs=st.executeQuery();
            while(rs.next()) {
                return new Account(
                        rs.getString(1),
                        rs.getString(2));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    

    
    
    public int checkAdmin(String user){
        if(user.equalsIgnoreCase("admin")){
            return 1;
        }else{
            return 0;
        }
    }
    public void changePass(String pass, String user){
        String sql="update Account sett password = ? where username = ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, user);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        AccountDBContext dao = new AccountDBContext();
        Account a = new Account();
        a = dao.login("admin","admin");
        System.out.println(a);
    }
}
