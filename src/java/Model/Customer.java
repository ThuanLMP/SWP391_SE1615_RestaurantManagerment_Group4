/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ITACHI
 */
public class Customer {
    private int id;
    private String name;
    private String gmail;
    private String phone;

    public Customer(int id, String name, String gmail, String phone) {
        this.id = id;
        this.name = name;
        this.gmail = gmail;
        this.phone = phone;
    }

    public Customer() {
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

   
    
}
