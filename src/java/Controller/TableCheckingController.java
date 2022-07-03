/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CustomerDBContext;
import Dao.OrderDBContext;
import Dao.Order_itemDBContext;
import Dao.ProductDBContext;
import Dao.TableDBContext;
import Model.Customer;
import Model.Order;
import Model.Product;
import Model.Table;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author ITACHI
 */
public class TableCheckingController extends HttpServlet {

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
        TableDBContext tbt = new TableDBContext();   
        ArrayList<Table> tables = tbt.getTablesByStatus(false);
        HttpSession session = request.getSession();
        session.setAttribute("tables", tables);
        request.getRequestDispatcher("../Table_Checking_4.jsp").forward(request, response);

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
        
    
        
        int table = Integer.parseInt(request.getParameter("table"));
        TableDBContext dbt = new TableDBContext();
        if (table == 4) {
            request.getRequestDispatcher("../Table_Checking_4.jsp").forward(request, response);
        } else if (table == 6) {
            request.getRequestDispatcher("../Table_Checking_6.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("../Table_Checking_10.jsp").forward(request, response);
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
