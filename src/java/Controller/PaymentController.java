/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CustomerDBContext;
import Dao.OrderDBContext;
import Dao.Order_itemDBContext;
import Model.Customer;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
public class PaymentController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get table id 
        String tableId = (String) request.getParameter("table");
        // get Order by id Table
        OrderDBContext dbo = new OrderDBContext();
        Order order = dbo.getOrderByTableId(tableId);
        
        // get Order Items by id Order
        Order_itemDBContext dboi = new  Order_itemDBContext();
        ArrayList<Product> products = dboi.getProductsByOrderId(order.getId());
        // get Customer by id Order
        CustomerDBContext dbc = new CustomerDBContext();
        Customer customer = dbc.getCustomerById(order.getCustomer().getId());
        // load data to session
         HttpSession session = request.getSession();
         session.setAttribute("order_pay",order);
         session.setAttribute("products_pay", products );
         session.setAttribute("customer_pay", customer);
        // send to payment.jsp
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
