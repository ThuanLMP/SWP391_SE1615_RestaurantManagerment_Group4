/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EmployeeDBContext;
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
public class UpdateEmployeeController extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String eid = request.getParameter("eid");
        
        EmployeeDBContext emp = new EmployeeDBContext();
        Employee e = emp.getEmployeeById(eid);
        session.setAttribute("accUpdate", e);
        request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
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
        Employee e = (Employee)session.getAttribute("accUpdate");
        EmployeeDBContext emp = new EmployeeDBContext();
        String name = request.getParameter("nameUpdate").trim();
        String email = request.getParameter("emailUpdate").trim();
        String phone = request.getParameter("phoneUpdate");
        String role = request.getParameter("ridUpdate");
        if( request.getParameter("nameUpdate").trim().isEmpty() 
                || request.getParameter("emailUpdate").trim().isEmpty() 
                || request.getParameter("phoneUpdate").isEmpty() ){
            request.setAttribute("messUpdate", "Trường nhập không thể trống");
        }
        else{
            request.setAttribute("messUpdate", "Cập nhật thành công");
            Employee e1 = new Employee(e.getId(), name, email, phone, role);
            emp.updateEmloyee(e1);
            session.setAttribute("accUpdate", null);
            Employee e2 = emp.getEmployeeById(e.getId());
            session.setAttribute("accUpdate", e2);
        }
        
   
        
        request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
