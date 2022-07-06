/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Table;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class TableDBContext extends DBContext {

    public ArrayList<Table> getAllTables() {
        ArrayList<Table> tables = new ArrayList<>();
        try {
            String sql = "select * from [Table]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table table = new Table();
                table.setId(rs.getString("tid"));
                table.setSeat(rs.getInt("seats"));
                table.setStatus(rs.getBoolean("status"));
                tables.add(table);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return tables;
    }

    public ArrayList<Table> getTablesBySeat(int seats) {
        ArrayList<Table> tables = new ArrayList<>();
        try {
            String sql = "select * from [Table] where seats = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seats);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table table = new Table();
                table.setId(rs.getString("tid"));
                table.setSeat(rs.getInt("seats"));
                table.setStatus(rs.getBoolean("status"));
                tables.add(table);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return tables;
    }

    public ArrayList<Table> getTablesByStatus(boolean a) {
        ArrayList<Table> tables = new ArrayList<>();
        try {
            String sql = "select * from [Table] where status = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, a);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Table table = new Table();
                table.setId(rs.getString("tid"));
                table.setSeat(rs.getInt("seats"));
                table.setStatus(rs.getBoolean("status"));
                tables.add(table);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return tables;
    }

    public void updateStatusTable(String id, String status) {
        try {
            String sql = "UPDATE [Table]\n"
                    + "SET status = ?\n"
                    + "where tid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Table getTableById(String id) {
        Table table = new Table();
        try {
            String sql = "select * from [Table] where tid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                table.setId(id);
                table.setSeat(rs.getInt("seats"));
                table.setStatus(rs.getBoolean("status"));
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return table;

    }

    public static void main(String[] args) {
        TableDBContext db = new TableDBContext();
        db.updateStatusTable("S01", "0");
    }
}
