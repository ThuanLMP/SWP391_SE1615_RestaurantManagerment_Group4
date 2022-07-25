/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AccountDBContext;
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
public class ChangePassController extends HttpServlet {

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
        session.removeAttribute("errorpass");
        request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
       
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
        session.removeAttribute("errorpass");   
        String user = (String) session.getAttribute("userr");
        String pass = request.getParameter("pass");
        String newpass = request.getParameter("newpass");
        String re_newpass = request.getParameter("re-newpass");

        if (re_newpass.equalsIgnoreCase(newpass) && pass.equalsIgnoreCase((String) session.getAttribute("passs"))) {
            AccountDBContext a = new AccountDBContext();
            a.changePass(newpass, user);
            String er = "Đổi mật khẩu thành công";
            request.setAttribute("error", er);
            
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
            session.setAttribute("passs", newpass);
        } else if (pass.equalsIgnoreCase((String) session.getAttribute("passs")) == false) {
            String er = "Mật khẩu không đúng";
            session.setAttribute("errorpass", er);
            //request.setAttribute("error", er);
            response.sendRedirect("ChangePass.jsp");
            //request.getRequestDispatcher("Changepass.jsp").forward(request, response);
        } else if (re_newpass.equalsIgnoreCase(newpass) == false) {
            String er = "Mật khẩu mới cần trùng với nhập lại mật khẩu";
            request.setAttribute("error", er);
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
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
