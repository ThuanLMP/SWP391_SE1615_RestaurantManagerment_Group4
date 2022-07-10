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
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class ManagerDBContext extends DBContext {

    public int getSumByBuffe(int buffeId, Date date) {
        int sumBuffe = 0;

        try {
            String sql = "select SUM(amount) as sum from [Order] o join Order_Items oi on o.oid = oi.oid\n"
                    + "where o.date >= ? and oi.mid=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, date);
            st.setInt(2, buffeId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                sumBuffe = rs.getInt("sum");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return sumBuffe;
    }

    public ArrayList<Order> getOrdersByDayAndStatus(Date Date, String status) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select*from [Order] \n"
                    + "where [date] = ? and isStatus = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, Date);
            st.setString(2, status);
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

    public ArrayList<Order> getOrdersByDate(Date startDate, Date endDate, String status) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select*from [Order]\n"
                    + "where date >= ? and date < ? and [isStatus] = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, startDate);
            st.setDate(2, endDate);
            st.setString(3, status);
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

    public static void main(String[] args) {
        ManagerDBContext db = new ManagerDBContext();
       int sum = db.getSumByBuffe(1,Date.valueOf("2022-07-01"));
        System.out.println(sum);
    }
}
