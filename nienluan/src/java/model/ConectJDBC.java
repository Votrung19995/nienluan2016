/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;

/**
 *
 * @author Vo
 */
public class ConectJDBC {
    public String username;
    public String db;
    public String password;
    public Connection cnn;
    public String host;
    public PreparedStatement ps;
    public ResultSet rs;

    public ConectJDBC() {
        this.username ="root";
        this.db ="nienluan";
        this.password ="";
        this.host="localhost";
        cnn=null;
    }
    public boolean Kn(){
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            cnn=DriverManager.getConnection("jdbc:mysql://"+this.host+ ":"+3306+"/"+this.db,this.username,password);
            return true;
        }
        catch(Exception e)
            {
//            
                return false;
            }
        }
    public void closeConect() throws SQLException{
        ps.close();
        cnn.close();
        
    }
}
