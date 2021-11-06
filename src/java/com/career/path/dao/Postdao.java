/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.dao;

import com.career.path.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class Postdao {

    private Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }

//    +----------------------+++-_------------------------++++
//save in database
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "INSERT INTO `post`(`Ptitle`, `Requirement`, `Dateline`, `Responsibilities`, `vacancyNo`, `CID`, `AdminID`, `OrganizationName`, `About`, `Address`, `Logo`) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            
            pst.setString(1, p.getTitle());
            pst.setString(2, p.getRequirement());
            pst.setString(3, p.getDateline());
            pst.setString(4, p.getResponsibilities());
            pst.setInt(5, p.getVacancy());
            pst.setInt(6, p.getCid());
            pst.setInt(7, p.getSno());
            pst.setString(8,p.getOrgName());
            pst.setString(9,p.getOrgAbout());
            pst.setString(10, p.getOrgAddress());
            pst.setString(11, p.getOrgLogo());
           
            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

//+-----------------------------------------------------+-------------------------------------
    //get all the post
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        try {

            PreparedStatement ps = con.prepareStatement("Select *from post order by pdate desc limit 6");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("Pid");
       
                String title = rs.getString("Ptitle");
                String requirement = rs.getString("Requirement");
                String date = rs.getString("Dateline");
                String responsibilities = rs.getString("Responsibilities");
                int vacancy = rs.getInt("vacancyNo");
                int Cid = rs.getInt("CID");
                int Sno = rs.getInt("AdminID");
                Timestamp pdate = rs.getTimestamp("pdate");
                String Orgname=rs.getString("OrganizationName");
                String OrgAbout=rs.getString("About");
                String OrgAddress=rs.getString("Address");
                String OrgLogo=rs.getString("Logo");
                Post p=new Post(pid, title, requirement, date, responsibilities, vacancy, Cid, Sno, pdate, Orgname, OrgAbout, OrgAddress, OrgLogo);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

//+------------------------------------------------+++++++++++++++++++________________________________
       //get all the post
    public List<Post> getAll() {
        List<Post> list = new ArrayList<>();
        try {

            PreparedStatement ps = con.prepareStatement("Select *from post order by pdate desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("Pid");
                String title = rs.getString("Ptitle");
                String requirement = rs.getString("Requirement");
                String date = rs.getString("Dateline");
                String responsibilities = rs.getString("Responsibilities");
                int vacancy = rs.getInt("vacancyNo");
                int Cid = rs.getInt("CID");
                int Sno = rs.getInt("AdminID");
                Timestamp pdate = rs.getTimestamp("pdate");
                String Orgname=rs.getString("OrganizationName");
                String OrgAbout=rs.getString("About");
                String OrgAddress=rs.getString("Address");
                String OrgLogo=rs.getString("Logo");
                Post post = new Post(pid, title, requirement, date, responsibilities, vacancy, Cid, Sno, pdate, Orgname, OrgAbout, OrgAddress, OrgLogo);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    //+------------------------------------------------+++++++++++++++++++________________________________
//post intern vacancy by cid
    public List<Post> getPostByCid(int CID) {
        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement ps = con.prepareStatement("Select *from post where CID=?");
            ps.setInt(1, CID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("Pid");
                String title = rs.getString("Ptitle");
                String requirement = rs.getString("Requirement");
                String date = rs.getString("Dateline");
                String responsibilities = rs.getString("Responsibilities");
                int vacancy = rs.getInt("vacancyNo");
                int Sno = rs.getInt("AdminID");
                Timestamp pdate = rs.getTimestamp("pdate");
                String Orgname=rs.getString("OrganizationName");
                String OrgAbout=rs.getString("About");
                String OrgAddress=rs.getString("Address");
                String OrgLogo=rs.getString("Logo");
                Post post = new Post(pid, title, requirement, date, responsibilities, vacancy, CID, Sno, pdate, Orgname, OrgAbout, OrgAddress, OrgLogo);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public Post getPostByPid(int PostId) {
        Post p = null;
        String q = "select * from post where Pid=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, PostId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int pid = rs.getInt("Pid");
                
                String title = rs.getString("Ptitle");
                String requirement = rs.getString("Requirement");
                String date = rs.getString("Dateline");
                String responsibilities = rs.getString("Responsibilities");
                int vacancy = rs.getInt("vacancyNo");
                int cid = rs.getInt("CID");
                int Sno = rs.getInt("AdminID");
                Timestamp pdate = rs.getTimestamp("pdate");
                String Orgname=rs.getString("OrganizationName");
                String OrgAbout=rs.getString("About");
                String OrgAddress=rs.getString("Address");
                String OrgLogo=rs.getString("Logo");
                p = new Post(pid, title, requirement, date, responsibilities, vacancy, cid, Sno, pdate, Orgname, OrgAbout, OrgAddress, OrgLogo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;

    }
     public boolean deletePost(int id)
      {
        boolean f= false;
          try {
              String q="DELETE FROM `post` WHERE Pid=?";
              PreparedStatement ps = this.con.prepareStatement(q);
               ps.setInt(1, id);
                ps.executeUpdate();
                f=true;
            
          } catch (Exception e) {
          }
        return f;
      
          
      }
     public boolean UpdatePost(Post post)
    { 
        boolean f=false;
        try {
            
            String q="UPDATE `post` SET `Ptitle`=?,`Requirement`=?,`Dateline`=?,`Responsibilities`=?,`vacancyNo`=?,`OrganizationName`=?,`Address`=? WHERE Pid=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getRequirement());
            
            ps.setString(3, post.getDateline());
            ps.setString(4, post.getResponsibilities());
            ps.setInt(5, post.getVacancy());
            ps.setString(6,post.getOrgName());
            
            ps.setString(7,post.getOrgAddress());
            
            ps.setInt(8,post.getPid());
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
        }
        return f;
    }
}
