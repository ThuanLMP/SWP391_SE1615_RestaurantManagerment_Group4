/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class CustomerDBContext extends DBContext {

    public void updateCustomerById(int id, Customer customer) {

        try {
            String sql = "UPDATE [Customer]\n"
                    + "   SET	cname = ?\n"
                    + "		,gmail = ?\n"
                    + "		,cphone = ?\n"
                    + " WHERE cid=?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customer.getName());
            st.setString(2, customer.getGmail());
            st.setString(3, customer.getPhone());
            st.setInt(4, id);
            
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public Customer getCustomerByPhone(String cphone) {

        try {
            String sql = "select cid,cname,gmail,cphone from Customer\n"
                    + "where cphone = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cphone);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("cid"));
                customer.setGmail(rs.getString("gmail"));
                customer.setName(rs.getString("cname"));
                customer.setPhone(cphone);
                return customer;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Customer getCustomerById(int id) {

        try {
            String sql = "select cid,cname,gmail,cphone from Customer\n"
                    + "where cid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("cid"));
                customer.setGmail(rs.getString("gmail"));
                customer.setName(rs.getString("cname"));
                customer.setPhone(rs.getString("cphone"));
                return customer;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void insertCustomer(Customer customer) {

        String sql = "INSERT INTO [Customer] (cid,cname,gmail,cphone)\n"
                + "VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customer.getId());
            st.setString(2, customer.getName());
            st.setString(3, customer.getGmail());
            st.setString(4, customer.getPhone());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "select * from Customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                c.setGmail(rs.getString("gmail"));
                c.setPhone(rs.getString("cphone"));
                customers.add(c);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return customers;
    }

    public static void main(String[] args) {
        CustomerDBContext db = new CustomerDBContext();
        Customer c = new Customer();
        c.setName("mrchekout");
        c.setGmail("mrchecka@gmail.com");
        c.setPhone("01");
        db.updateCustomerById(12, c);

    }
}
