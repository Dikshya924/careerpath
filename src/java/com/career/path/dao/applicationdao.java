/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.dao;

import com.career.path.entities.Intern;
import com.career.path.entities.application;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class applicationdao {

    private Connection con;

    public applicationdao(Connection con) {
        this.con = con;
    }

    public boolean saveapplication(application app) {
        boolean f = false;
        try {
            String q = "INSERT INTO `applicants`(`Sno`, `Username`, `Email`, `CV`,`Pid`, `OrganizationName`, `Ptitle`)values(?,?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, app.getSno());
            ps.setString(2, app.getUsername());
            ps.setString(3, app.getEmail());
            ps.setString(4, app.getCv());
            ps.setInt(5, app.getPid());
            ps.setString(6, app.getOrgName());
            ps.setString(7, app.getPtitle());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();

        }
        return f;

    }
     public application getApplicantsbyId(int sno, int pid){
        application ap=null;
        try {
            String query="select * from applicants where Sno=? and Pid=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, sno);
            ps.setInt(2, pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                ap=new application();
                 ps.setInt(1, ap.getSno());
            ps.setString(2, ap.getUsername());
            ps.setString(3, ap.getEmail());
            ps.setString(4, ap.getCv());
            ps.setInt(5, ap.getPid());
            ps.setString(6, ap.getOrgName());
            ps.setString(7, ap.getPtitle());
                
                 
                 
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ap;
        
      
    }
    


   
    public ArrayList<application> getAll() {
        ArrayList<application> list = new ArrayList<>();
        try {

            PreparedStatement ps = this.con.prepareStatement("SELECT * FROM `applicants`");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int AppliciantID = rs.getInt("ApplicantID");
                int Sno = rs.getInt("Sno");
                String Username = rs.getString("Username");
                String Email = rs.getString("Email");
                int Pid = rs.getInt("Pid");
                String orgName = rs.getString("OrganizationName");
                String title = rs.getString("Ptitle");
                String cv = rs.getString("CV");
                Timestamp applydate = rs.getTimestamp("ApplyDate");
                application app = new application(AppliciantID, Sno, Username, Email, cv, applydate, Pid, orgName, title);
                list.add(app);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<application> getapplicantByID(int Pid) {
        ArrayList<application> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM `applicants`  where `Pid`=?";
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setInt(1, Pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int AppliciantID = rs.getInt("ApplicantID");
                int Sno = rs.getInt("Sno");
                String Username = rs.getString("Username");
                String Email = rs.getString("Email");
                String orgName = rs.getString("OrganizationName");
                String title = rs.getString("Ptitle");
                String cv = rs.getString("CV");
                Timestamp applydate = rs.getTimestamp("ApplyDate");
                application app = new application(AppliciantID, Sno, Username, Email, cv, applydate, Pid, orgName, title);
                list.add(app);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
