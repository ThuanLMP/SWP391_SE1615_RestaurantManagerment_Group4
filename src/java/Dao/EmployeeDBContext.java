/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Employee;
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
public class EmployeeDBContext extends DBContext {

    public ArrayList<Employee> getEmployees() {
        ArrayList<Employee> emps = new ArrayList<>();
        try {
            String sql = "select * from Employee";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getString("eid"));
                e.setName(rs.getString("ename"));
                e.setGmail(rs.getString("gmail"));
                e.setPhone(rs.getString("ephone"));
                emps.add(e);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return emps;
    }

    public Employee getEmployee(String username) {

        try {
            String sql = "select e.eid,e.username,e.ename,e.gmail,e.ephone,e.rid,r.rname,r.salary \n"
                    + "from Employee e join [Role] r on e.rid = r.rid \n"
                    + "where e.username=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getString("eid"));
                e.setName(rs.getString("ename"));
                e.setGmail(rs.getString("gmail"));
                e.setPhone(rs.getString("ephone"));
                e.setRole(rs.getString("rname"));
                return e;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateEmloyee(Employee e) {
        String rid ="";
        if(e.getRole().equalsIgnoreCase("Manager")){
            rid = "R02";
        }
        if(e.getRole().equalsIgnoreCase("Chef")){
            rid = "R03";
        }
        if(e.getRole().equalsIgnoreCase("Cashier")){
            rid = "R04";
        }
        if(e.getRole().equalsIgnoreCase("Waiter")){
            rid = "R05";
        }
        try {
            String sql = "UPDATE Employee\n"
                    + "SET ename = ?, gmail= ?,ephone= ?,rid =? \n"
                    + "WHERE eid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, e.getName());
            st.setString(2, e.getGmail());
            st.setString(3, e.getPhone());
            st.setString(4, rid);
            st.setString(5, e.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }




    public int checkEid(String id) {
        int result = 0;
        ArrayList<Employee> e = getEmployees();
        for (int i = 0; i < e.size(); i++) {
            if (id.equalsIgnoreCase(e.get(i).getId())) {
                return 1;
            }
        }
        return result;
    }

    public void addEmployee(Employee e, String username, String pass) {
        String rid = "";
        if (e.getRole().equalsIgnoreCase("Manager")) {
            rid = "R02";
        }
        if (e.getRole().equalsIgnoreCase("Chef")) {
            rid = "R03";
        }
        if (e.getRole().equalsIgnoreCase("Cashier")) {
            rid = "R04";
        }
        if (e.getRole().equalsIgnoreCase("Waiter")) {
            rid = "R05";
        }
        String sql = "insert into Employee (eid,username,ename,gmail,ephone,rid) values (?,?,?,?,?,?) ";
        AccountDBContext a = new AccountDBContext();
        a.addAcount(username, pass);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, e.getId());
            st.setString(2, username);
            st.setString(3, e.getName());
            st.setString(4, e.getGmail());
            st.setString(5, e.getPhone());
            st.setString(6, rid);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public ArrayList<Employee> getEmployeesWithRole() {
        ArrayList<Employee> emps = new ArrayList<>();
        try {
            String sql = "select e.eid,e.username,e.ename,e.gmail,e.ephone,e.rid,r.rname,r.salary \n"
                    + "from Employee e join [Role] r on e.rid = r.rid";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getString("eid"));
                e.setName(rs.getString("ename"));
                e.setGmail(rs.getString("gmail"));
                e.setPhone(rs.getString("ephone"));
                e.setRole(rs.getString("rname"));
                emps.add(e);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return emps;
    }
    
    public Employee getEmployeeById(String eid) {

        try {
            String sql = "select e.eid,e.username,e.ename,e.gmail,e.ephone,e.rid,r.rname,r.salary \n"
                    + "from Employee e join [Role] r on e.rid = r.rid \n"
                    + "where e.eid=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getString("eid"));
                e.setName(rs.getString("ename"));
                e.setGmail(rs.getString("gmail"));
                e.setPhone(rs.getString("ephone"));
                e.setRole(rs.getString("rname"));
                return e;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }
    public void deleteEmployee(String id) {
        String sql="delete from Employee where eid= ? "
                + "delete from Salary where eid= ?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, id);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }







    public static void main(String[] args) {
        EmployeeDBContext db = new EmployeeDBContext();
        Employee e = db.getEmployeeById("E01");
        System.out.println(e.getName());
        

    }

}
