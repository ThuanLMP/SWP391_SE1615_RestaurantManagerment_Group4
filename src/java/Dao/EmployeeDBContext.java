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

    public void updateEmloyee(Employee emp) {

        try {
            String sql = "UPDATE Employee\n"
                    + "SET ename = ?, gmail= ?,ephone= ?\n"
                    + "WHERE eid = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, emp.getName());
            st.setString(2, emp.getGmail());
            st.setString(3, emp.getPhone());
            st.setString(4, emp.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        EmployeeDBContext db = new EmployeeDBContext();
        Employee e = new Employee();
        e.setId("E01");
        e.setName("check");
        e.setGmail("check");
        e.setPhone("0999999");
        db.updateEmloyee(e);
        //ArrayList<Employee> emps = db.getEmployees();
        //for(Employee e:emps){
        //    System.out.println(e.getName());
        //}

    }

}
