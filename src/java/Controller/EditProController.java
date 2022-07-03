/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EmployeeDBContext;
import Model.Account;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ITACHI
 */
public class EditProController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = new Account();
        acc = (Account) session.getAttribute("account");
        EmployeeDBContext db = new EmployeeDBContext();
        Employee e = db.getEmployee(acc.getUser());
        request.setAttribute("employee", e);
        request.getRequestDispatcher("../EditProfile.jsp").forward(request, response);
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
        
        String name = request.getParameter("name").trim();
        String gmail = request.getParameter("gmail").trim();
        String phone = request.getParameter("phone").trim();
        
        HttpSession session = request.getSession();
        Account acc = new Account();
        acc = (Account) session.getAttribute("account");
        
        EmployeeDBContext db = new EmployeeDBContext();
        Employee e = db.getEmployee(acc.getUser());
        
        Employee newEmp = new Employee();
        newEmp.setId(e.getId());
        newEmp.setName(name);
        newEmp.setPhone(phone);
        newEmp.setGmail(gmail);
        
        EmployeeDBContext dbe = new EmployeeDBContext();
        dbe.updateEmloyee(newEmp);
        String mess;
        Employee check = db.getEmployee(acc.getUser());
        if (check.getName().trim().equals(name) && check.getGmail().trim().equals(gmail) && check.getPhone().trim().equals(phone)) {
            mess = "Save Succefull";
        } else {
            mess = "Save Fail";
        }
        
        session.setAttribute("mess", mess);
        
        response.sendRedirect("../profile/edit");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
