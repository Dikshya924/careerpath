/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.dao;
import com.career.path.entities.admin;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class admindao {
    private Connection con;

    public admindao(Connection con) {
        this.con = con;
    }
public boolean saveAdmin(admin ad){
    boolean f=false;
    try {
        String sql="INSERT INTO `admin`(`Username`, `Email`, `Password`) VALUES(?,?,?)";
        PreparedStatement ps=this.con.prepareStatement(sql);
            ps.setString(1,ad.getUsername());
            ps.setString(2, ad.getEmail());
            ps.setString(3, ad.getPassword());
            ps.executeUpdate();
            f=true;
        
        
    } catch (Exception e) {
    }
        return f;
    
} 
//getting admin by email and password
public admin getAdminByEmailAndPassword(String email,String password){
        admin ad=null;
        try {
            String query="select * from admin where Email=? and Password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                ad=new admin();
                ad.setAdminid(rs.getInt("AdminID"));
                ad.setUsername(rs.getString("Username"));
                ad.setEmail(rs.getString("Email"));
                ad.setPassword(rs.getString("Password"));
               
                
                 
                 
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ad;
        
      
    }
    public boolean updatePassword(admin ad)
    { 
        boolean f=false;
        try {
            
            String q="UPDATE `admin` SET `Password`=? WHERE `AdminID`=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setString(1, ad.getPassword());
            ps.setInt(2, ad.getAdminid());
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
        }
        return f;
    }
    
    
}
