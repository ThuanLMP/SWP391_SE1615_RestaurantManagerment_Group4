/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.MenuDBContext;
import Model.Menu;
import java.io.IOException;
import java.io.PrintWriter;
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
public class UpdateMenuController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("mid")) ;
            session.setAttribute("menuId", id);
//        String username1 = (String)session.getAttribute("userU");
        MenuDBContext op = new MenuDBContext();
        Menu o = op.getMenu(id);
        session.setAttribute("menuUpdate", o);
        request.getRequestDispatcher("UpdateMenu.jsp").forward(request, response);
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
        Menu e = (Menu)session.getAttribute("menuUpdate");
        MenuDBContext mp = new MenuDBContext();
        String name = request.getParameter("mnameUpdate").trim();
        try{
            double price = Double.parseDouble(request.getParameter("mpriceUpdate"));
            if( request.getParameter("mpriceUpdate").isEmpty() 
                || request.getParameter("mnameUpdate").trim().isEmpty()  ){
            request.setAttribute("messMenuUpdate", "Input is not null");
        }
        else{
            request.setAttribute("messMenuUpdate", "Update Menu successful");
            Menu e1 = new Menu(e.getMid(), name, price);
            mp.updateMenu(e1);
            session.setAttribute("menuUpdate", null);
            Menu e2 = mp.getMenu(e.getMid());
            session.setAttribute("menuUpdate", e2);
        }
        }catch(Exception ex){
            request.setAttribute("messMenuUpdate", "Price is not double");
        }        
        request.getRequestDispatcher("UpdateMenu.jsp").forward(request, response);
    }




    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
