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
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ITACHI
 */
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TableDBContext db = new TableDBContext();
        ArrayList<Table> tables = db.getTablesByStatus(true);
        request.setAttribute("tables", tables);
        request.getRequestDispatcher("../Order.jsp").forward(request, response);
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
        
        ProductDBContext dbp = new ProductDBContext();
        String table_draw = request.getParameter("table");
        TableDBContext dbt = new TableDBContext();
        dbt.updateStatusTable(table_draw,"0");
        Table tb = dbt.getTableById(table_draw);
        int seat = tb.getSeat();

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

        /*
        //Check get data
        System.out.println(amountBuffe1);
        System.out.println(amountBuffe2);
        System.out.println(amountBuffe3);
        System.out.println(amountBuffe4);
        System.out.println(amountPotato);
        System.out.println(amountSalat);
        System.out.println(amountChickenWing);
        System.out.println(amountChickenThighs);
        System.out.println(amountCocacola);
        System.out.println(amountPepsi);
        System.out.println(amountAquafina);
        System.out.println(amountBeer);
         */
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

        // Caculate sum price of products
        //check add product amount
        /*
        for (Product p : products) {
            System.out.println(p.getAmount());
        }
         */
        // Get data Customer from website
        String nameCustomer = request.getParameter("name").trim();
        String gmailCustomer = request.getParameter("gmail").trim();
        String phoneCustomer = request.getParameter("phone").trim();

        //Check get input Customer
        /*
        System.out.println(nameCustomer);
        System.out.println(gmailCustomer);
        System.out.println(phoneCustomer);
         */
        CustomerDBContext dbc = new CustomerDBContext();

        Customer customerCheckPhone = dbc.getCustomerByPhone(phoneCustomer);
        Customer customer = new Customer();

        ArrayList<Customer> customers = dbc.getCustomers();

        if (customerCheckPhone == null) {
            customer.setId(customers.size() + 1);
            customer.setName(nameCustomer);
            customer.setPhone(phoneCustomer);
            customer.setGmail(gmailCustomer);
            dbc.insertCustomer(customer);

        } else {
            customer = dbc.getCustomerByPhone(phoneCustomer);
        }

        //Get time now
        LocalDate date = java.time.LocalDate.now();
        LocalTime time = java.time.LocalTime.now();

        //Test date and time
        /*
        System.out.println(date);
        System.out.println(time);
         */
        OrderDBContext dbo = new OrderDBContext();
        ArrayList<Order> orders = dbo.getOrders();
        int size = orders.size();
        int lastOrderId = orders.get(size - 1).getId();

        Order order = new Order();
        order.setId(lastOrderId + 1);
        order.setCustomer(customer);
        order.setTable(tb);
        order.setProducts(products);
        order.setIsStatus(true);
        order.setDate(Date.valueOf(date));
        order.setTime(Time.valueOf(time));

        

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
        
        order.setTotal(total);
        dbo.insertOrder(order);
        Order_itemDBContext dboi = new Order_itemDBContext();
        dboi.insertOrderItems(order, product_items);
        response.sendRedirect("../home/table_checking");
        
       
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
