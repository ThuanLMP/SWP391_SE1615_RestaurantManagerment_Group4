/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CustomerDBContext;
import Dao.RateDBContext;
import Dao.TableDBContext;
import Model.Customer;
import Model.Rate;
import Model.Table;
import java.io.IOException;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 *
 * @author ITACHI
 */
public class RatingStarController extends HttpServlet {

   

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TableDBContext tb = new TableDBContext();
        ArrayList<Table> table = tb.getAllTables();
        HttpSession session = request.getSession();
        session.setAttribute("listTable", table);
        
        request.getRequestDispatcher("RatingStar.jsp").forward(request, response);
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
        RateDBContext rd = new RateDBContext();
        CustomerDBContext cd = new CustomerDBContext();
        int rid = rd.lastRateid()+1;
        String tid = request.getParameter("tid");
        try{
            String cphone = request.getParameter("cphone");
            Customer cus = cd.getCustomerByPhone(cphone);
            
            int star = Integer.parseInt(request.getParameter("rating"));
            System.out.println(star);
            LocalDate date_raw = java.time.LocalDate.now();
            Date date = Date.valueOf(date_raw);
            String cmt = request.getParameter("comment");
            int rateid;
            if(cus != null){
                rd.addRate(new Rate(rid,cus ,tid, star, date, cmt));
                request.setAttribute("messRate", "Cảm ơn vì những đánh giá của bạn");   
            }else{
                request.setAttribute("messRate", "Số điện thoại không tồn tại");
            }                
        }catch(Exception e){
            request.setAttribute("messRate", "Bạn chưa chọn sao");
        }
        
        request.getRequestDispatcher("RatingStar.jsp").forward(request, response);
        
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
