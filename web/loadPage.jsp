<%-- 
    Document   : loadPage
    Created on : Nov 9, 2020, 9:59:14 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.entities.Post"%>
<%@page import="com.career.path.dao.Postdao"%>
<%@page import="com.career.path.entities.Intern"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Internships</title>
    </head>
    <body>
        <div class="container-fluid ">
            <div class="row">
                <%
                    Postdao dao=new Postdao(ConnectionProvider.getConnection());
                    int cid=Integer.parseInt(request.getParameter("cid"));
                    List<Post> posts=null;
                    if(cid==0){
                        posts=dao.getAllPost();
                    }
                    else{
                        posts=dao.getPostByCid(cid);
                    }
                    if(posts.size()==0)
                    {
                        out.print("<h3 class='display-3 text-center'>No vacancy available in this category</h3>");
                    }
                 
                    for(Post p:posts){
                %>
                <div class="col-md-12 mt-4">
                    <div class="card" style="max-width: 1000px;">
                        <div class="card-body">

                            <div class="data align-items-center"  style="display: flex; justify-content: space-between;">
                                <img class="card-img-left" src="images/logo/<%=p.getOrgLogo()%>" alt="orglogo" style="width: 100px;height: 100px;">
                                <b><%=p.getTitle()%></b>
                                <a href="post-detail.jsp?post_id=<%=p.getPid()%> "class="btn btn-outline-primary" style="height: 50px;" >View detail</a>

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

    </body>
</html>
