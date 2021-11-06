<%-- 
    Document   : index
    Created on : Oct 12, 2020, 5:57:12 PM
    Author     : Dikshya
--%>

<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.career.path.dao.Categorydao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.career.path.entities.Post"%>
<%@page import="com.career.path.dao.Postdao"%>
<%@page import="java.util.List"%>



<%@page import="com.career.path.entities.Categories"%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>P2C|Homepage</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="navBar.jsp"%>

        <div class="container-fluid">

            <img src="images/p2c.png"  class="img-fluid" alt="Responsive image" width="100%"/>
            <h1 class="text-center mt-5">How It Works?</h1>
            <div class="row mt-5 mb-5">
                <div class="col-md-4">
                    <div class="card text-center" style="border: none;">
                        <img class="card-img-top" src="images/user.png" style="max-width: 100px; max-height: 100px; margin-left: 40%;"/>
                        <div class="card-body">
                            <h3 class="card-title">Create Account</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid ut labore et dolore magna aliqua.</p> 
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="border: none;">
                        <img class="card-img-top" src="images/job-seeker.png" style="max-width: 100px; max-height: 100px; margin-left: 40%;">
                        <div class="card-body">
                            <h3 class="card-title">Search Desired Internship</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid ut labore et dolore magna aliqua.</p> 
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center" style="border: none;">
                        <img class="card-img-top" src="images/file.png" style="max-width: 100px; max-height: 100px; margin-left: 40%;">
                        <div class="card-body">
                            <h3 class="card-title">Send Your Resume</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid ut labore et dolore magna aliqua.</p> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <h1 style="text-align: center; font-weight: bold;">Browse top Categories</h1>
                <br>
                <div class="row mb-3 mt-3">
                    <%
                         Categorydao cdao=new Categorydao(ConnectionProvider.getConnection());
                         ArrayList<Categories> list1=cdao.getAllCategorieses();
                         for(Categories cc:list1)
                         {
                    %>
                    <div class="col-md-4" >
                        <div class="card text-center mb-3" style="border: 1px solid blue;">
                           
                            <div class="card-body">
                                <h5 class="card-title"><%=cc.getTitle()%></h5>

                            </div>
                        </div>
                    </div>

                    <%
                }
                          
                          
                    %>




                </div>
                   
              
                    <h1 class="text-center">Recent Jobs</h1>
                    <div class="row" style="background-color: #ededed;">
                        <%
                        Postdao pd=new Postdao(ConnectionProvider.getConnection());
                        List<Post> posts=null;
                        posts=pd.getAllPost();
                       for(Post p:posts)
                       {
                           %>
                           <div class="col-md-6 mb-5 mt-4">
                            <div class="card" style="max-width: 1000px;">
                        <div class="card-body">

                            <div class="data align-items-center"  style="display: flex; justify-content: space-between;">
                                <img class="card-img-left" src="images/logo/<%=p.getOrgLogo()%>" alt="orglogo" style="width: 100px;height: 100px;">
                                <b><%=p.getTitle()%></b>
                                <a href="post-detail.jsp?post_id=<%=p.getPid()%> "class="btn btn-outline-primary" style="height: 50px;" >View Details</a>

                            </div>
                            <br>
                            <div class="card-footer text-center text-muted" style="display: flex; justify-content: space-between;" >
                                <b><%=p.getOrgName()%></b>
                                <b><%=p.getOrgAddress()%></b>
                                <b>Apply Before:  <%=p.getDateline()%></b>


                            </div>


                        </div>
                    </div>
                           </div>
                           <%
                       }
                        %>
                       
                    </div>
                       

            </div>
            
            <%@include file="footer.jsp" %>
            <script
                src="https://code.jquery.com/jquery-3.5.1.min.js"
                integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script>
                $(document).ready(function () {

                })
            </script>

            <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
