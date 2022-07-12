/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ManagerDBContext;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;
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
public class HomeAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ManagerDBContext dbm = new ManagerDBContext();
        LocalDate date = java.time.LocalDate.now();
        ArrayList<Order> ordersTodayDone = dbm.getOrdersByDayAndStatus(Date.valueOf(date), "0");
        ArrayList<Order> ordersTodayActive = dbm.getOrdersByDayAndStatus(Date.valueOf(date), "1");
        double revenueToday = 0;

        for (Order o : ordersTodayDone) {
            revenueToday += o.getTotal();
        }
        

        int sumOrderDoneToday = ordersTodayDone.size();
        int sumOrderActive = ordersTodayActive.size();

        //get revenue 12 month.
        ArrayList<Order> ordersOfJan = dbm.getOrdersByDate(Date.valueOf("2022-01-01"), Date.valueOf("2022-02-01"), "0");
        ArrayList<Order> ordersOfFeb = dbm.getOrdersByDate(Date.valueOf("2022-02-01"), Date.valueOf("2022-03-01"), "0");
        ArrayList<Order> ordersOfMar = dbm.getOrdersByDate(Date.valueOf("2022-03-01"), Date.valueOf("2022-04-01"), "0");
        ArrayList<Order> ordersOfApr = dbm.getOrdersByDate(Date.valueOf("2022-04-01"), Date.valueOf("2022-05-01"), "0");
        ArrayList<Order> ordersOfMay = dbm.getOrdersByDate(Date.valueOf("2022-05-01"), Date.valueOf("2022-06-01"), "0");
        ArrayList<Order> ordersOfJun = dbm.getOrdersByDate(Date.valueOf("2022-06-01"), Date.valueOf("2022-07-01"), "0");
        ArrayList<Order> ordersOfJul = dbm.getOrdersByDate(Date.valueOf("2022-07-01"), Date.valueOf("2022-08-01"), "0");
        ArrayList<Order> ordersOfAug = dbm.getOrdersByDate(Date.valueOf("2022-08-01"), Date.valueOf("2022-09-01"), "0");
        ArrayList<Order> ordersOfSep = dbm.getOrdersByDate(Date.valueOf("2022-09-01"), Date.valueOf("2022-10-01"), "0");
        ArrayList<Order> ordersOfOtc = dbm.getOrdersByDate(Date.valueOf("2022-10-01"), Date.valueOf("2022-11-01"), "0");
        ArrayList<Order> ordersOfNov = dbm.getOrdersByDate(Date.valueOf("2022-11-01"), Date.valueOf("2022-12-01"), "0");
        ArrayList<Order> ordersOfDec = dbm.getOrdersByDate(Date.valueOf("2022-12-01"), Date.valueOf("2023-01-01"), "0");

        double revenueOfJan = 0;
        for (Order o : ordersOfJan) {
            revenueOfJan += o.getTotal();
        }

        double revenueOfFeb = 0;
        for (Order o : ordersOfFeb) {
            revenueOfFeb += o.getTotal();
        }

        double revenueOfMar = 0;
        for (Order o : ordersOfMar) {
            revenueOfMar += o.getTotal();
        }

        double revenueOfApr = 0;
        for (Order o : ordersOfApr) {
            revenueOfApr += o.getTotal();
        }

        double revenueOfMay = 0;
        for (Order o : ordersOfMay) {
            revenueOfMay += o.getTotal();
        }

        double revenueOfJun = 0;
        for (Order o : ordersOfJun) {
            revenueOfJun += o.getTotal();
        }

        double revenueOfJul = 0;
        for (Order o : ordersOfJul) {
            revenueOfJul += o.getTotal();
        }

        double revenueOfAug = 0;
        for (Order o : ordersOfAug) {
            revenueOfAug += o.getTotal();
        }

        double revenueOfSep = 0;
        for (Order o : ordersOfSep) {
            revenueOfSep += o.getTotal();
        }

        double revenueOfOtc = 0;
        for (Order o : ordersOfOtc) {
            revenueOfOtc += o.getTotal();
        }

        double revenueOfNov = 0;
        for (Order o : ordersOfNov) {
            revenueOfNov += o.getTotal();
        }

        double revenueOfDec = 0;
        for (Order o : ordersOfDec) {
            revenueOfDec += o.getTotal();
        }
        ArrayList<Double> revenueList = new ArrayList<Double>();
        revenueList.add(revenueToday);
        revenueList.add(revenueOfJan);
        revenueList.add(revenueOfFeb);
        revenueList.add(revenueOfMar);
        revenueList.add(revenueOfApr);
        revenueList.add(revenueOfMay);
        revenueList.add(revenueOfJun);
        revenueList.add(revenueOfJul);
        revenueList.add(revenueOfAug);
        revenueList.add(revenueOfSep);
        revenueList.add(revenueOfOtc);
        revenueList.add(revenueOfNov);
        revenueList.add(revenueOfDec);

        // get sum of BuffeId
        int sumBuffe1 = dbm.getSumByBuffe(1, Date.valueOf("2022-07-01"));
        int sumBuffe2 = dbm.getSumByBuffe(2, Date.valueOf("2022-07-01"));
        int sumBuffe3 = dbm.getSumByBuffe(3, Date.valueOf("2022-07-01"));
        int sumBuffe4 = dbm.getSumByBuffe(4, Date.valueOf("2022-07-01"));

        ArrayList<Integer> sumBfIdList = new ArrayList<>();
        sumBfIdList.add(sumBuffe1);
        sumBfIdList.add(sumBuffe2);
        sumBfIdList.add(sumBuffe3);
        sumBfIdList.add(sumBuffe4);
        
        //get profit
        int sumSalary = dbm.getSumSalary(Date.valueOf("2022-06-01"), Date.valueOf("2022-07-01"));
        int sumImport = dbm.getSumImport(Date.valueOf("2022-06-01"), Date.valueOf("2022-07-01"));
        ArrayList<Order> ordersMonthBefore = dbm.getOrdersByDate(Date.valueOf("2022-06-01"), Date.valueOf("2022-07-01"), "0");
        System.out.println(ordersMonthBefore.size());
        double revenueMonthBefore = 0;
        
        for(Order o:ordersMonthBefore){
            revenueMonthBefore = revenueMonthBefore + o.getTotal();
        }
        
        int profit = (int) revenueMonthBefore-sumImport-sumSalary;
        ArrayList<Integer> profitList = new ArrayList<>();
        profitList.add(profit);
        
        request.setAttribute("profit", profitList);
        request.setAttribute("orderTodayDone", ordersTodayDone);
        request.setAttribute("orderTodayActive", ordersTodayActive);
        request.setAttribute("sumBfId", sumBfIdList);
        request.setAttribute("revenueList", revenueList);
        request.getRequestDispatcher("Home_Admin.jsp").forward(request, response);

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
