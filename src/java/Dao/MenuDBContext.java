/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Menu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author win
 */
public class MenuDBContext extends DBContext{

    public ArrayList<Menu> getMenu() {
        ArrayList<Menu> emps = new ArrayList<>();
        try {
            String sql = "select * from Menu";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Menu e = new Menu();
                e.setMid(rs.getInt("mid"));
                e.setMname(rs.getString("mname"));
                e.setPrice(rs.getDouble("price"));
                emps.add(e);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return emps;
    }

    public Menu getMenu(int id) {
        try {
            String sql = "select * from Menu where mid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Menu e = new Menu();
                e.setMid(rs.getInt("mid"));
                e.setMname(rs.getString("mname"));
                e.setPrice(rs.getDouble("price"));
                return e;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateMenu(Menu e) {
        String sql = "UPDATE	Menu \n"
                + "SET  mname  = ?,price=? \n"
                + "WHERE mid = ?";
        try {
        PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, e.getMname());
            stm.setDouble(2, e.getPrice());
            stm.setInt(3, e.getMid());
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int checkMid(int id) {
        int result = 0;
        ArrayList<Menu> e = getMenu();
        for (int i = 0; i < e.size(); i++) {
            if(id == e.get(i).getMid()){
                return 1;
            }           
        }
        return result;
    }

    public int checkName(String name) {
        int result = 0;
        ArrayList<Menu> e = getMenu();
        for (int i = 0; i < e.size(); i++) {
            if(name.equalsIgnoreCase(e.get(i).getMname())){
                return 1;
            }           
        }
        return result;
    }

    public void addMenu(Menu e) {
        String sql = "insert into Menu (mid,mname,price) values (?,?,?) ";
         try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, e.getMid());
            st.setString(2, e.getMname());
            st.setDouble(3, e.getPrice());
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        MenuDBContext mn = new MenuDBContext();
        mn.deleteMenu(9);
    }

    public void deleteMenu(int id) {
        String sql="delete from Menu where mid=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }

    
    
}


