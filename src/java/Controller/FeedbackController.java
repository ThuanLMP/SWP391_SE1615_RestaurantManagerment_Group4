/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Dao.RateDBContext;
import Model.Rate;
import java.io.IOException;
import java.io.PrintWriter;
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
public class FeedbackController extends HttpServlet {


   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RateDBContext rd = new RateDBContext();
        ArrayList<Rate> rate = rd.getRates();
        HttpSession session = request.getSession();
        session.setAttribute("listRate",rate);
        double average_star = 0;
        for (int i = 0; i < rate.size(); i++) {
            average_star += rate.get(i).getStar();
        }
        average_star = average_star/ rate.size();
        average_star = Math.round(100.0 * average_star)/100.0;
        session.setAttribute("aveStar",average_star);
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
