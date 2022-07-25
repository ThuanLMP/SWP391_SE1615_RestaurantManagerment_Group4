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
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ITACHI
 */
public class EditOrderTableController extends HttpServlet {

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
        
        String tid = request.getParameter("id");

        OrderDBContext dbo = new OrderDBContext();
        Order_itemDBContext dboi = new Order_itemDBContext();
        CustomerDBContext dbc = new CustomerDBContext();
        TableDBContext dbt = new TableDBContext();
        ProductDBContext dbp = new ProductDBContext();

        Order order = dbo.getOrderByTableId(tid);
        ArrayList<Product> products = dboi.getProductsByOrderId(order.getId());
        Customer customer = dbc.getCustomerById(order.getCustomer().getId());
        Table tb = dbt.getTableById(tid);
        ArrayList<Table> tbs = dbt.getTablesByStatus(true);
        Deque<Table> tables = new LinkedList<>();
        
        for (Table t : tbs) {
            tables.add(t);
        }
        
        tables.addFirst(tb);
        
        ArrayList<Product> productsForm = dbp.getProducts();

        for (int i = 0; i < productsForm.size(); i++) {
            for (int j = 0; j < products.size(); j++) {

                if (productsForm.get(i).getId() == (products.get(j).getId())) {
                    productsForm.get(i).setAmount(products.get(j).getAmount());

                }
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("tables", tables);
        session.setAttribute("order", order);
        session.setAttribute("products", productsForm);
        session.setAttribute("customer", customer);
        request.getRequestDispatcher("Edit_Order.jsp").forward(request, response);
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
        Deque<Table> tables = (Deque<Table>) session.getAttribute("tables");
    
        String table_after = request.getParameter("table");
        String table_before = tables.poll().getId();
        
        Customer customer_before = (Customer) session.getAttribute("customer");
        Order order_before = (Order) session.getAttribute("order");
        
        //Update Table 
        TableDBContext dbt = new TableDBContext();
        if (!table_before.equals(table_after)) {

            dbt.updateStatusTable(table_after, "0");
            dbt.updateStatusTable(table_before, "1");
        }
        
        //Update Customer
        String nameCustomer = request.getParameter("name").trim();
        
        if (nameCustomer.isEmpty()) {
            session.setAttribute("messedit", "Vui lòng nhập tên khách hàng");
            
            
            response.sendRedirect("editOrder?id="+table_before);
        }
        else{
               String gmailCustomer = request.getParameter("gmail").trim();
        String phoneCustomer = request.getParameter("phone").trim();
        
        Customer customer_after = new Customer();
        customer_after.setName(nameCustomer);
        customer_after.setGmail(gmailCustomer);
        customer_after.setPhone(phoneCustomer);
        
        CustomerDBContext dbc = new CustomerDBContext();
        dbc.updateCustomerById(customer_before.getId(), customer_after);
        
        
        //update Order
        int amountBuffe1 = Integer.parseInt(request.getParameter("buffe1"));
        int amountBuffe2 = Integer.parseInt(request.getParameter("buffe2"));
        int amountBuffe3 = Integer.parseInt(request.getParameter("buffe3"));
        int amountBuffe4 = Integer.parseInt(request.getParameter("buffe4"));
        int amountPotato = Integer.parseInt(request.getParameter("potato")); // lấy số lượng khoai tây chiên
        int amountSalat = Integer.parseInt(request.getParameter("salat")); // lấy số lượng salat
        int amountChickenWing = Integer.parseInt(request.getParameter("chickenW")); // lấy số lượng của món cánh gà
        int amountChickenThighs = Integer.parseInt(request.getParameter("chickenT")); // lấy số lượng của đùi gà 
        int amountCocacola = Integer.parseInt(request.getParameter("cocacola"));
        int amountPepsi = Integer.parseInt(request.getParameter("pepsi"));
        int amountAquafina = Integer.parseInt(request.getParameter("aquafina"));
        int amountBeer = Integer.parseInt(request.getParameter("beer"));
        
        ProductDBContext dbp = new ProductDBContext();
        ArrayList<Product> products = dbp.getProducts();
        
        // Add amount to Products
        products.get(0).setAmount(amountBuffe1);
        //products.get(0).setSumPrice(products.get(0).getAmount()*products.get(0).getPrice());
        //System.out.println(products.get(0).getSumPrice());
        products.get(1).setAmount(amountBuffe2);
        products.get(2).setAmount(amountBuffe3);
        products.get(3).setAmount(amountBuffe4);

        products.get(4).setAmount(amountPotato);
        products.get(5).setAmount(amountSalat);
        products.get(6).setAmount(amountChickenWing);
        products.get(7).setAmount(amountChickenThighs);

        products.get(8).setAmount(amountCocacola);
        products.get(9).setAmount(amountAquafina);
        products.get(10).setAmount(amountBeer);
        products.get(11).setAmount(amountPepsi);
        
        ArrayList<Product> product_items = new ArrayList<>();
        for (Product p : products) {
            p.setSumPrice(p.getAmount() * p.getPrice());
            if (p.getAmount() != 0) {
                product_items.add(p);
            }
        }
        
        double total=0;
        for (Product p1 : product_items) {
            total = total + p1.getSumPrice();           
        }
        OrderDBContext dbo = new OrderDBContext();
        Order order_after = new Order();
        order_after.setId(order_before.getId());
        Table table = new Table();
        table.setId(table_after);
        order_after.setTable(table);
        order_after.setTotal(total);
        
        dbo.updateOrderById(order_after);
        
        Order_itemDBContext dboi = new Order_itemDBContext();
        dboi.deleteOrderItemsByOrderId(order_before.getId());
        dboi.insertOrderItems(order_after, product_items);
        
        session.removeAttribute("tables");
        session.removeAttribute("order");
        session.removeAttribute("products");
        session.removeAttribute("customer");
        response.sendRedirect("home/table_checking");
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
