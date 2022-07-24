/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AttendenceDBContext;
import Dao.SalaryDBContext;
import Model.Attendence;
import Model.Salary;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 *
 * @author ITACHI
 */
public class AttendenceController extends HttpServlet {

    
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String eid = (String)session.getAttribute("eid");
        LocalDate date_raw = java.time.LocalDate.now();
        Date date = Date.valueOf(date_raw);
        session.setAttribute("today", date);
        AttendenceDBContext sd = new AttendenceDBContext();
        ArrayList<Attendence> s = sd.getAttenByEid(eid);
        
        
        if(s.isEmpty() == false){
            session.setAttribute("attenEmp",s.get(s.size()-1).getDate());
            session.setAttribute("listAtten", s);
        }else{
            session.setAttribute("attenEmp",null);
        }
        
        request.getRequestDispatcher("Home_Employee.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String eid = request.getParameter("eid");
        SalaryDBContext sb = new SalaryDBContext();
        AttendenceDBContext sd = new AttendenceDBContext();
        
        sb.addDayWork(eid);
        sd.takeAtten(eid);
        
        sb.addDayWork(eid);
        LocalDate date_raw = java.time.LocalDate.now();
        Date date = Date.valueOf(date_raw);
        ArrayList<Attendence> s = sd.getAttenByEid(eid);
        session.setAttribute("listAtten", s);
        session.setAttribute("attenEmp",date);
        request.getRequestDispatcher("Home_Employee.jsp").forward(request, response);
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
