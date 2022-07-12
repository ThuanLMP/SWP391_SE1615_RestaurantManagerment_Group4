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
        String tableId = (String) request.getParameter("id");
        
        // get Order by id Table
        OrderDBContext dbo = new OrderDBContext();
        Order order = dbo.getOrderByTableId(tableId);
        
        
        // get Order Items by id Order
        Order_itemDBContext dboi = new  Order_itemDBContext();
        ArrayList<Product> products = dboi.getProductsByOrderId(order.getId());
        
        ProductDBContext dbp = new ProductDBContext();
        
         ArrayList<Product> productsForm = dbp.getProducts();

        for (int i = 0; i < productsForm.size(); i++) {
            for (int j = 0; j < products.size(); j++) {

                if (productsForm.get(i).getId() == (products.get(j).getId())) {
                    productsForm.get(i).setAmount(products.get(j).getAmount());
                    productsForm.get(i).setSumPrice(products.get(j).getSumPrice());
                }
            }
        }
        
        // get Customer by id Order
        CustomerDBContext dbc = new CustomerDBContext();
        Customer customer = dbc.getCustomerById(order.getCustomer().getId());
        // load data to session
         HttpSession session = request.getSession();
         session.setAttribute("order_pay",order);
         session.setAttribute("products_pay", productsForm );
         session.setAttribute("customer_pay", customer);
        
        // send to payment.jsp
        
        request.getRequestDispatcher("Payment.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String orderId = request.getParameter("orderId");
       String tableId = request.getParameter("tableId");
        System.out.println(orderId);
        System.out.println(tableId);
       OrderDBContext dbo = new OrderDBContext();
       TableDBContext dbt = new TableDBContext();
       
       dbt.updateStatusTable(tableId,"1");
       dbo.updateStatusOrderById(orderId);
       
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
