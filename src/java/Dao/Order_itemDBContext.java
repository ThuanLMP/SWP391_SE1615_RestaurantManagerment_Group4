/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Order;
import Model.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class Order_itemDBContext extends DBContext {

    public void deleteOrderItemsByOrderId(int orderId) {
        String sql = "DELETE FROM [Order_Items]\n"
                + "      WHERE oid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void insertOrderItems(Order order, ArrayList<Product> products) {
        String sql = "INSERT INTO Order_Items (oid, mid,amount,sumPrice)\n"
                + "VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (Product p : products) {
                st.setInt(1, order.getId());
                st.setInt(2, p.getId());
                st.setInt(3, p.getAmount());
                st.setDouble(4, p.getSumPrice());
                st.executeUpdate();
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Product> getProductsByOrderId(int oid) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select*from Order_Items where oid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("mid"));
                product.setAmount(rs.getInt("amount"));
                product.setSumPrice(rs.getDouble("sumPrice"));
                products.add(product);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return products;
    }

    public static void main(String[] args) {
        Order_itemDBContext db = new Order_itemDBContext();
        ArrayList<Product> p = db.getProductsByOrderId(34);
        for (Product pro : p) {
            System.out.println(pro.getSumPrice());
        }
    }

}
