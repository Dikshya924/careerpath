/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.career.path.servlets;

import com.career.path.dao.Postdao;
import com.career.path.entities.Message;
import com.career.path.entities.Post;
import com.career.path.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author user
 */
public class updatePost extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String requirement = request.getParameter("requirement");
            String dateline = request.getParameter("dateline");
            String responsibilities = request.getParameter("responsibility");
             int position = Integer.parseInt(request.getParameter("vacancy"));
            String name = request.getParameter("orgName");
            String address = request.getParameter("location");
       
            
            
            Post p=new Post(id, title, requirement, dateline, responsibilities, position, name, address);
            Postdao dao=new Postdao(ConnectionProvider.getConnection());
            boolean ans=dao.UpdatePost(p);
            if(ans){
               Message msg= new Message("Updated Suceessfully", "success", "alert-success");
               HttpSession s= request.getSession();
               s.setAttribute("msg", msg);
               response.sendRedirect("ViewPost.jsp");
            }
            else{
                Message msg= new Message("Update error", "error", "alert-danger");
               HttpSession s= request.getSession();
               s.setAttribute("msg", msg);
               response.sendRedirect("ViewPost.jsp");
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
