<%-- 
    Document   : viewApplicant
    Created on : Mar 19, 2021, 8:20:04 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>

<%@page import="com.career.path.entities.application"%>
<%@page import="com.career.path.dao.applicationdao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%

    admin ad = (admin) session.getAttribute("CurrentAdmin");
    if (ad == null) {
        session.setAttribute("msg", "invalid user");
        response.sendRedirect("AdminLogin.jsp");
        return;
    } 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
      <%@include file="adminNav.jsp" %>
     
            <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                <th>Applicant ID</th>
                <th>Intern Name</th>
                <th>Email</th>
                <th>PID</th>
                <th>Organization Name</th>
                <th>Internship title</th>
                <th>Applied On</th>
                <th>CV</th>
                <th>Download</th>
                

                </tr>
                </thead>
                
              <%
                   int Postid=Integer.parseInt(request.getParameter("id"));
                  
                  applicationdao adao=new applicationdao(ConnectionProvider.getConnection());
                  ArrayList<application> list=adao.getapplicantByID(Postid);
                  for(application app:list)
                  {
                  %>
                  
                  <tr>
                  <td><%=app.getApplicantId()%></td>
                  <td><%=app.getUsername()%></td>
                  <td><%=app.getEmail()%></td>
                  <td><%=app.getPid()%></td>
                  <td><%=app.getOrgName()%></td>
                  <td><%=app.getPtitle()%></td>
                  <td><%=app.getApplydate()%></td>
                  <td><%=app.getCv()%></td>
                  <th><a href="Download?filename=<%=app.getCv()%>">Download Cv</a>
                  
                   </tr>

               
                  <%
                      }
                  %>
                
                    
               
            </table>




    </body>
</html>
