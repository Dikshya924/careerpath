<%-- 
    Document   : viewIntern
    Created on : Nov 20, 2020, 11:19:00 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.career.path.entities.admin"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.dao.Interndao"%>
<%@page import="java.util.List"%>




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
                    <th>Sno</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>rdate</th>
                  
                    
                    <th>Delete</th>

                </tr>
            </thead>
            <%
                          Interndao cdao=new Interndao(ConnectionProvider.getConnection());
                          List<Intern> list1=cdao.getAll();
                          for(Intern ii:list1)
                          {
            %>
            <tbody>
            <tr>
                <td><%=ii.getSno()%></td>
                <td><%=ii.getName()%></td>
                <td><%=ii.getEmail()%></td>
                <td><%=ii.getDateTime()%></td>
                
                
                <td>
                    <button class="btn btn-outline-danger">Delete</button>
                </td>



            </tr>
            </tbody>

            <%}
            %>

        </table>

     
        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <script src="js/myjs.js" type="text/javascript"></script>
        
       
    </body>
</html>
