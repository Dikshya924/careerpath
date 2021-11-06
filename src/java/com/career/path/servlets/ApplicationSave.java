/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.servlets;

import com.career.path.dao.applicationdao;
import com.career.path.entities.Intern;
import com.career.path.entities.Message;
import com.career.path.entities.application;
import com.career.path.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;

/**
 *
 * @author user
 */
@MultipartConfig
public class ApplicationSave extends HttpServlet {
     private Connection con;

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
            int pid = Integer.parseInt(request.getParameter("pid"));
            String orgname = request.getParameter("orgname");

            String title = request.getParameter("title");
            Part cv = request.getPart("Cv");
            HttpSession session = request.getSession();
            Intern intern = (Intern) session.getAttribute("CurrentIntern");
            // out.println(part.getSubmittedFileName());
          
            
            applicationdao adao = new applicationdao(ConnectionProvider.getConnection());
            application app=new application(intern.getSno(), intern.getName(),intern.getEmail(),cv.getSubmittedFileName(), pid, orgname, title);
            String path = request.getRealPath("CV") + File.separator + cv.getSubmittedFileName();

            // uploading code
            try {
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = cv.getInputStream();

                //reading data
                byte[] data = new byte[is.available()];
                is.read(data);

                //writing the data
                fos.write(data);
                fos.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
           
          
             if(adao.saveapplication(app)){
                out.print("done");
                
            }
           else{
               
               out.print("error");
                   
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
