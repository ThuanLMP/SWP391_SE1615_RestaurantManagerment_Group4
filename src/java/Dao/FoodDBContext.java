/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Food;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ITACHI
 */
public class FoodDBContext extends DBContext {
    public ArrayList<Food> getFoods() {
        
        
        ArrayList<Food> foods = new ArrayList<>();
        try {
            String sql = "select*from Food";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {              
                Food food = new Food();
                food.setId(rs.getString("fid"));
                food.setName(rs.getString("fname"));
                food.setPrice(rs.getInt("fprice"));
                foods.add(food);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foods;
    }
    
    
    public void insertFood(Food food) {
        String sql = "INSERT INTO Food (fid, fname,fprice)\n"
                + "VALUES (?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
                st.setString(1,food.getId());
                st.setString(2,food.getName());
                st.setInt(3, food.getPrice());
                
                st.executeUpdate();
            

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        FoodDBContext db = new FoodDBContext();
        Food f = new Food();
        f.setName("Kẹo");
        f.setId("T07");
        f.setPrice(10000);
        db.insertFood(f);
    }
}
