/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.helper;

/**
 *
 * @author Dikshya
 */
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            // driver class load
            if(con==null){
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pathtocareer","root","");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
