/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;



import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class Order {

    int id;
    ArrayList<Product> products = new ArrayList<>();
    Date date;
    Time time;
    Customer customer;
    Table table;
    Boolean isStatus;
    double total;

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public Boolean getIsStatus() {
        return isStatus;
    }

    public void setIsStatus(Boolean isStatus) {
        this.isStatus = isStatus;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", products=" + products + ", date=" + date + ", time=" + time + ", customer=" + customer + ", table=" + table + ", isStatus=" + isStatus + ", total=" + total + '}';
    }

   
}
