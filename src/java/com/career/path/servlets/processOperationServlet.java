/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.servlets;

import com.career.path.dao.Categorydao;
import com.career.path.dao.Postdao;
import com.career.path.dao.admindao;
import com.career.path.entities.Categories;
import com.career.path.entities.Intern;
import com.career.path.entities.Message;
import com.career.path.entities.Post;
import com.career.path.entities.admin;
import com.career.path.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 *
 * @author user
 */
@MultipartConfig
public class processOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String op=request.getParameter("operation");
           if(op.trim().equals("addCategory"))
           {    
               //fetching category data
               
               String title=request.getParameter("catTitle");
               String discription=request.getParameter("catDesc");
               
               Categories category=new Categories(title, discription);
               
               // save in category database
               
                Categorydao dao=new Categorydao(ConnectionProvider.getConnection());
                if(dao.saveCategories(category))
                {
                   out.print("done");
                }
                else{
                    out.print("error");
                }
                 
               
           }
           else if(op.trim().equals("addPost"))
           {
               int cid=Integer.parseInt(request.getParameter("catSelect"));
               String title=request.getParameter("title");
               String requirement=request.getParameter("requirement");
               String responsibilities=request.getParameter("responsibilities");
               String dateline=request.getParameter("dateline");
               int position=Integer.parseInt(request.getParameter("vacancy"));
               String name=request.getParameter("orgName");
               String about=request.getParameter("orgAbout");
               String address=request.getParameter("orgAddress");
               Part logo=request.getPart("orgLogo");
             
               //getting current user id
               HttpSession session=request.getSession();
               admin ad=(admin) session.getAttribute("CurrentAdmin");
              // out.println(part.getSubmittedFileName());
              // out.print(dateline);
               Post p=new Post(title, requirement, dateline, responsibilities, position, cid, ad.getAdminid(), name, about, address, logo.getSubmittedFileName());
               Postdao pdao=new Postdao(ConnectionProvider.getConnection());
               String path=request.getRealPath("images") + File.separator + "logo" + File.separator + logo.getSubmittedFileName();
               System.out.println(path); 
               // uploading code
               try {
                   FileOutputStream fos=new FileOutputStream(path);
                   InputStream is=logo.getInputStream();
                   
                   //reading data
                   byte[] data=new byte[is.available()];
                   is.read(data);
                   
                   //writing the data
                   
                   fos.write(data);
                   fos.close();
                   
               } catch (Exception e) {
                   e.printStackTrace();
               }
              
               if(pdao.savePost(p))
              {
                  out.println("done");
              }
              else{
                   out.println("error");
              }
               
               
              
             }
           else if(op.trim().equals("addAdmin"))
           {    
               //fetching admin data
               
               String Email=request.getParameter("mail");
               String Password=request.getParameter("pass");
               String Username=request.getParameter("user");
               
              admin ad=new admin(Email, Password, Username);
               
               // save in admin database
               
                admindao dao=new admindao(ConnectionProvider.getConnection());
                if(dao.saveAdmin(ad))
                {
                   out.print("done");
                }
                else{
                    out.print("error");
                }
                 
               
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
