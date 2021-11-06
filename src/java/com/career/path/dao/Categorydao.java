/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.dao;

import com.career.path.entities.Categories;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Categorydao {
    
    private Connection con;

    public Categorydao(Connection con) {
        this.con = con;
    }
    public boolean saveCategories(Categories category)
    {
        boolean f=false;
        try {
            String query="INSERT INTO `categories`(`Title`, `Description`) VALUES(?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1,category.getTitle());
            ps.setString(2, category.getDescription());
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
        }
        return f;
        
    }
    public boolean updateCat(Categories category)
    { 
        boolean f=false;
        try {
            
            String q="UPDATE `categories` SET `Title`=?,`Description`=? WHERE `CID`=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setString(1, category.getTitle());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getCid());
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
        }
        return f;
    }
    public ArrayList<Categories> getAllCategorieses(){
        ArrayList<Categories> list=new ArrayList<>();
        try {
            
            String q="SELECT CID,Title,Description FROM `categories`";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            
            while(set.next())
            {
                int cid=set.getInt("CID");
                String title=set.getString("Title");
                String description=set.getString("Description");
                Categories c=new Categories(cid, title, description);
                list.add(c);
            }
            
            
        } catch (Exception e) {
        
            e.printStackTrace();
        }
        return list;
    }
    
      public ArrayList<Categories> getAllCID(int CID){
       ArrayList<Categories> list=new ArrayList<>();
        try {
            
           
            PreparedStatement ps = con.prepareStatement("Select *from categories where CID=?");
            ps.setInt(1, CID);
            ResultSet set = ps.executeQuery();
            
            while(set.next())
            {
               
                String title=set.getString("Title");
                String description=set.getString("Description");
                Categories c=new Categories(CID, title, description);
                list.add(c);
                
            }
            
            
        } catch (Exception e) {
        
            e.printStackTrace();
        }
        return list;
        
    }
      
      public boolean deleteUser(int id)
      {
        boolean f= false;
          try {
              String q="DELETE FROM `categories` WHERE CID=?";
              PreparedStatement ps = this.con.prepareStatement(q);
               ps.setInt(1, id);
                ps.executeUpdate();
                f=true;
            
          } catch (Exception e) {
          }
        return f;
      
          
      }
    
}
