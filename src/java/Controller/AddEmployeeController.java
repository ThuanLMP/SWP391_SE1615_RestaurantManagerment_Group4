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
public class AddEmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("AddEmployee.jsp").forward(request, response);

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
        EmployeeDBContext emp = new EmployeeDBContext();

        HttpSession session = request.getSession();
        String id = request.getParameter("idAdd");
        String user = request.getParameter("userAdd").trim();
        String pass = request.getParameter("passAdd");
        String re_pass = request.getParameter("re-passAdd");;;
        String name = request.getParameter("nameAdd").trim();
        String email = request.getParameter("emailAdd").trim();
        String phone = request.getParameter("phoneAdd").trim();
        String rid = request.getParameter("ridAdd").trim();
        Employee e = new Employee(id, name, email, phone, rid);
        session.setAttribute("accAdd", e);
        if (id.trim().isEmpty()
                || request.getParameter("userAdd").trim().isEmpty()
                || request.getParameter("passAdd").isEmpty()
                || request.getParameter("re-passAdd").isEmpty()
                || request.getParameter("nameAdd").trim().isEmpty()
                || request.getParameter("emailAdd").trim().isEmpty()
                || request.getParameter("phoneAdd").trim().isEmpty()
                || request.getParameter("ridAdd").trim().isEmpty()) {
            request.setAttribute("messAdd", "Input is not null");
        } else {
            if (pass.equalsIgnoreCase(re_pass) == false) {
                request.setAttribute("messAdd", "Re-Password is not same Password");
            } else {
                if (emp.checkEid(id) == 1) {
                    request.setAttribute("messAdd", "Id is exist");
                } else {
                    request.setAttribute("messAdd", "Add Employee successful");
                    emp.addEmployee(e, user, pass);

                }
            }
        }

        request.getRequestDispatcher("AddEmployee.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
