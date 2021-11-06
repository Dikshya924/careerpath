/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.dao;
import com.career.path.entities.Intern;
import com.career.path.entities.Post;
import jakarta.servlet.annotation.MultipartConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Dikshya
 */
@MultipartConfig
public class Interndao {
    private Connection con;

    public Interndao(Connection con) {
        this.con = con;
    }
    public boolean saveIntern(Intern intern)
    {
        boolean f=false;
        try {
            String query="INSERT INTO `internregister`( `Username`, `Email`, `Password`) VALUES (?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, intern.getName());
            ps.setString(2, intern.getEmail());
            ps.setString(3, intern.getPassword());
            ps.executeUpdate();
            f=true;
            
        } catch (Exception e) {
        }
        
        return f;
    }
    //GETTING USER BY email and password
    public Intern getInternByEmailAndPassword(String email,String password){
        Intern intern=null;
        try {
            String query="select * from internregister where Email=? and Password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                intern=new Intern();
                intern.setSno(rs.getInt("Sno"));
                 intern.setName(rs.getString("Username"));
                 intern.setEmail(rs.getString("Email"));
                 intern.setPassword(rs.getString("Password"));
                intern.setDateTime(rs.getTimestamp("rdate").toString());
                
                
                 
                 
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return intern;
        
      
    }
    
    
    //getting intern by id
     public Intern getInternID(int sno){
        Intern intern=null;
        try {
            String query="select * from internregister where Sno=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, sno);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                intern=new Intern();
                intern.setSno(rs.getInt("Sno"));
                 intern.setName(rs.getString("Username"));
                 intern.setEmail(rs.getString("Email"));
                 intern.setPassword(rs.getString("Password"));
                intern.setDateTime(rs.getTimestamp("rdate").toString());
                
                
                 
                 
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return intern;
        
      
    }
   public void Intern()
   {
       
   }
  //select all 
   public List<Intern> getAll(){
       List<Intern> list = new ArrayList<>();
       try {
           String s="select * from internregister";
           PreparedStatement p=con.prepareStatement(s);
           ResultSet rs=p.executeQuery(s);
           while(rs.next()){
               int sno=rs.getInt("Sno");
               String fname=rs.getString("Username");
               String mail=rs.getString("Email");
               String pass=rs.getString("Password");
               String date=rs.getString("rdate");
         
               
               Intern intern=new Intern(sno, fname, mail, pass, date);
               list.add(intern);
           }
           
           
       } catch (Exception e) {
           e.printStackTrace();
       }
        return list;
   }
   
}
