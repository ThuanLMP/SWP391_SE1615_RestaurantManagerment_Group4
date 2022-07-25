/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Dao.EmployeeDBContext;
import Dao.MenuDBContext;
import Model.Employee;
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
public class AddMenuController extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("AddMenu.jsp").forward(request, response);
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
        MenuDBContext emp = new MenuDBContext();
        
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("midAdd"));
        String name = request.getParameter("mnameAdd").trim();
        try{
            double price = Double.parseDouble(request.getParameter("mpriceAdd"));
            Menu e = new Menu(id, name,price);
         session.setAttribute("menuAdd", e);
        if( request.getParameter("midAdd").trim().isEmpty() 
                || request.getParameter("mnameAdd").trim().isEmpty() 
                || request.getParameter("mpriceAdd").trim().isEmpty() ){
            request.setAttribute("messMenuAdd", "Trường nhập không thể trống");
        }else{
            if(emp.checkMid(id) == 1 || emp.checkName(name) == 1){
                request.setAttribute("messMenuAdd", "ID đã tồn tại");
            }else{
                request.setAttribute("messMenuAdd", "Thêm món thành công");
                emp.addMenu(e);                   
                        
            }           
        }
        }catch(Exception ex){
            request.setAttribute("messMenuAdd", "Price must be number");
        }
       
        

        request.getRequestDispatcher("AddMenu.jsp").forward(request, response);
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
