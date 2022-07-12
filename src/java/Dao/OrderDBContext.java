/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Customer;
import Model.Order;
import Model.Table;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class OrderDBContext extends DBContext {

    public void updateOrderById(Order order) {

        try {
            String sql = "UPDATE [Order]\n"
                    + "   SET [tid] = ?\n"
                    + "      ,[total] = ?\n"
                    + " WHERE oid=?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order.getTable().getId());
            st.setDouble(2, order.getTotal());
            st.setInt(3, order.getId());
           
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
    
    public void updateStatusOrderById(String id){
        try {
            String sql = "UPDATE [Order]\n"
                    + "   SET isStatus = ?\n"
                    + " WHERE oid=?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, false);
            st.setString(2, id);          
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Order> getOrders() {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select * from [Order]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("oid"));
                Table tb = new Table();
                tb.setId(rs.getString("tid"));
                o.setTable(tb);
                Customer c = new Customer();
                c.setId(rs.getInt("cid"));
                o.setCustomer(c);
                o.setDate(rs.getDate("date"));
                o.setTime(rs.getTime("time"));
                o.setIsStatus(rs.getBoolean("isStatus"));
                o.setTotal(rs.getDouble("total"));
                orders.add(o);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return orders;
    }

    public Order getOrderByTableId(String tid) {
        Order o = new Order();
        try {
            String sql = "select*from [Order] where tid= ? and isStatus=1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                o.setId(rs.getInt("oid"));
                Table tb = new Table();
                tb.setId(rs.getString("tid"));
                o.setTable(tb);
                Customer c = new Customer();
                c.setId(rs.getInt("cid"));
                o.setCustomer(c);
                o.setDate(rs.getDate("date"));
                o.setTime(rs.getTime("time"));
                o.setIsStatus(rs.getBoolean("isStatus"));
                o.setTotal(rs.getDouble("total"));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return o;
    }

    public void insertOrder(Order order) {
        String sql = "INSERT INTO [Order] (oid,cid,tid,time,date,isStatus,total)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order.getId());
            st.setInt(2, order.getCustomer().getId());
            st.setString(3, order.getTable().getId());
            st.setDate(5, order.getDate());
            st.setTime(4, order.getTime());
            st.setBoolean(6, order.getIsStatus());
            st.setDouble(7, order.getTotal());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        OrderDBContext db = new OrderDBContext();
        Order o = db.getOrderByTableId("S01");
        System.out.println(o.getCustomer().getId());
    }
}
