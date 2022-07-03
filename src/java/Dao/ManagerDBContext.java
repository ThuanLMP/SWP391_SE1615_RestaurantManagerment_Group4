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
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class ManagerDBContext extends DBContext {
    public ArrayList<Order> getOrdersByDay(Date Date) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select*from [Order] \n"
                    + "where [date] = ? ";
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
                orders.add(o);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return orders;
    }
}
