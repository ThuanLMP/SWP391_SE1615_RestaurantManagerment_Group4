/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AccountDBContext;
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
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        request.setAttribute("oldUser", request.getParameter("user"));
        String username = request.getParameter("user").trim();
        String password = request.getParameter("pass");
        AccountDBContext dao = new AccountDBContext();
        session.setAttribute("userr", username);
        session.setAttribute("passs", password);
        Account a = dao.login(username, password);

        //if account is not exist
        if (a == null) {
            request.setAttribute("mess", "Tài khoản hoặc mật khẩu không chính xác");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            //if it is not sql error
            if (a.getPass() != null) {
                session.setAttribute("account", a);
                int checkAdmin = dao.checkAdmin(username);
                //if account is admin
                if (checkAdmin == 1) {
                    response.sendRedirect("home_admin");
                } else {
                    EmployeeDBContext em = new EmployeeDBContext();
                    Employee s = em.getEmployee(username);
                    String eid = s.getId();
                    session.setAttribute("eid", eid);
                    response.sendRedirect("home_employee");
                }
            }
            //if it is sql error
            if (a.getUser().equalsIgnoreCase("error") && a.getPass() == null) {
                request.setAttribute("mess", "Lỗi, hãy liên hệ với admin để sửa chữa vấn đề này");
                

                request.getRequestDispatcher("Login.jsp").forward(request, response);
                
            }
        }

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
