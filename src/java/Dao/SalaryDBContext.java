/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Employee;
import Model.Salary;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class SalaryDBContext extends DBContext{

    public ArrayList<Salary> getSalaryUnPaid() {
        ArrayList<Salary> salarys = new ArrayList<>();
        try {
            String sql = "select e.eid,e.ename,e.gmail,e.ephone,e.rid,s.date,s.daywork,s.sid,s.totalsalary  "
                    + "from Employee e join Salary s on e.eid = s.eid where s.date > GETDATE() ";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Salary salary = new Salary();
                salary.setSid(rs.getInt("sid"));
                salary.setDate(rs.getDate("date"));
                salary.setDaywork(rs.getInt("daywork"));
                salary.setTotalSalary(rs.getInt("totalsalary"));
                salary.setEmployee(new Employee(rs.getString("eid"),
                        rs.getString("ename"),rs.getString("gmail"),rs.getString("ephone"),rs.getString("rid")));
                salarys.add(salary);                
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return salarys;
    }
    
    public ArrayList<Salary> getSalaryPaid() {
        ArrayList<Salary> salarys = new ArrayList<>();        
        try {
            String sql = "select e.eid,e.ename,e.gmail,e.ephone,e.rid,s.date,s.daywork,s.sid,s.totalsalary  "
                    + "from Employee e join Salary s on e.eid = s.eid where s.date < GETDATE() ";
            PreparedStatement stm = connection.prepareStatement(sql);            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Salary salary = new Salary();
                salary.setSid(rs.getInt("sid"));
                salary.setDate(rs.getDate("date"));
                salary.setDaywork(rs.getInt("daywork"));
                salary.setTotalSalary(rs.getInt("totalsalary"));
                salary.setEmployee(new Employee(rs.getString("eid"),
                        rs.getString("ename"),rs.getString("gmail"),rs.getString("ephone"),rs.getString("rid")));
                salarys.add(salary);                
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return salarys;
    }
    
    public int maxSid(){
        int max = 0;
        try{
           String sql = "select MAX(sid) from Salary"; 
           PreparedStatement stm = connection.prepareStatement(sql);           
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
               max = rs.getInt("");
           }
        }catch(Exception ex){
            System.out.println(ex);
        }
        return max;
    }
    
    public void addSalaryUnPaid(Employee e){
        String sql = "insert into Salary (sid,eid,daywork,date,totalsalary) "
                + "values (?,?,?,convert(date,DATEADD(d,-1, DATEADD(mm, DATEDIFF(mm, 0 ,GETDATE())+1, 0))),?) ";
         try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,maxSid()+1);
            st.setString(2, e.getId());
            st.setInt(3, 0);
            st.setInt(4, 0);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public Double takeSalary(String eid){
        double role = 0;
        try {
            String sql = " select salary from Employee e join [Role] r on e.rid = r.rid where e.eid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);   
            stm.setString(1, eid);
            ResultSet rs = stm.executeQuery();            
            while (rs.next()) {
                role = rs.getDouble("salary");   
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return role;
    }
    
    public void addDayWork(String eid){
        try {
            String sql = "UPDATE Salary\n"
                    + "SET daywork = daywork+1,totalsalary = (daywork+1)* ? "
                    + "WHERE eid = ? and date = convert(date,DATEADD(d,-1, DATEADD(mm, DATEDIFF(mm, 0 ,GETDATE())+1, 0)))";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1,takeSalary(eid));
            st.setString(2, eid);
            
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    
    
    public static void main(String[] args) {
        SalaryDBContext sd = new SalaryDBContext();
        ArrayList<Salary> s = sd.getSalaryPaid();
        sd.addDayWork("E01");
    }
    
}


