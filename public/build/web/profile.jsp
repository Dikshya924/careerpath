<%-- 
    Document   : profile
    Created on : Oct 14, 2020, 6:24:51 PM
    Author     : Dikshya
--%>

<%@page import="com.career.path.entities.Intern"%>
<%@page import="com.career.path.dao.Categorydao"%>
<%@page import="java.util.ArrayList"%>



<%@page import="com.career.path.entities.Categories"%>

<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="navBar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-4">
                <!--++++++++++++++-------------------Catetories------------------------------+++++++++-->
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
                            All Post
                        </a>
                        
                      <%
                          Categorydao cdao=new Categorydao(ConnectionProvider.getConnection());
                          ArrayList<Categories> list1=cdao.getAllCategorieses();
                          for(Categories cc:list1)
                          {
                              %>
                              <a href="#" onclick="getPost(<%=cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action">
                                   <%= cc.getTitle() %>
                        </a>
                        
                              <%
                          }
                          
                          
                      %>
                        
                    </div>
                </div>
       <!--++++++++++------------------Post-------------------------+++++++++-->
                <div class="col-md-8" >
                    
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3>Loading......</h3>
                    </div>
                    <div class="container-fluid" id="post-container">
                        
                        
                    </div>

                </div>
            </div>
        </div>


        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <!--+----------loading post page------------+-->
        <script>
            function getPost(CID,temp)
            {
                $('.c-link').removeClass('active');
                 $.ajax({
                    url:"loadPage.jsp",
                    data:{cid:CID},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                        
                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef=$('.c-link')[0]
               getPost(0,allPostRef);

            })
        </script>

        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
