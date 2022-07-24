/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Food;
import Model.Import;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ITACHI
 */
public class ImportDBContext extends DBContext {
    /*
      public void insertImport(ArrayList<Import> imports ) {
        String sql = "INSERT INTO Import (fid,iid,date,amount,total)\n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
                for(Import:)                
                st.executeUpdate();
            

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
*/
}
