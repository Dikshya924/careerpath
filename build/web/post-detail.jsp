 <%-- 
    Document   : post-detail.jsp
    Created on : Nov 9, 2020, 4:35:49 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.career.path.entities.Intern"%>
<%@page import="com.career.path.entities.Message"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.entities.Post"%>
<%@page import="com.career.path.dao.Postdao"%>
<%@page import="com.career.path.entities.application"%>
<%@page import="com.career.path.dao.applicationdao"%>
<%@page import="java.text.*"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<%

   Intern intern = (Intern) session.getAttribute("CurrentIntern");
    if (intern == null) {
         Message msg=new Message("Please Login","error","alert-danger");
          HttpSession s=request.getSession();
         s.setAttribute("msg", msg);
        response.sendRedirect("Login.jsp");
         return;
    } 
%>

<% 
   int Postid=Integer.parseInt(request.getParameter("post_id"));
   Postdao d=new Postdao(ConnectionProvider.getConnection());
   Post p=d.getPostByPid(Postid);

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title><%=p.getTitle()%></title>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <div class="row">
            <div class="col-md-8 mt-4">
                <div class="card" style="max-width: 1000px;">
                    <div class="card-body">

                        <div class="data align-items-center "  style="display: flex;">
                            <img class="card-img-left" src="images/logo/<%=p.getOrgLogo()%>" alt="orglogo" style="width: 100px;height: 100px;">
                            <h2 style="margin-left: 300px;"><%=p.getTitle()%></h2>

                        </div>
                        <br>
                        <div class="card-footer text-center text-muted bg-white" style="display: flex; justify-content: space-between;" >
                            <b><%=p.getOrgName()%></b>
                            <b><%=p.getOrgAddress()%></b>
                            <b>Apply Before: <%=p.getDateline()%></b>


                        </div>


                    </div>
                </div>
                <div class="body mt-4 ml-5">
                    <h2>About the Organization</h2>
                    <p><%=p.getOrgAbout()%></p>
                    <br>
                    <hr>
                    <br>
                    <h2>Requirement</h2>
                    <p><%=p.getRequirement()%></p>
                    <br>
                    <hr>
                    <br>
                    <h2>Responsibilities</h2>
                    <p><%=p.getResponsibilities()%></p>
                </div>
            </div>
            <div class="col-md-4 mt-4">
                <div class="card ">
                    <div class="card-body">
                        <h2 class="text-center">Internship Overview</h2>
                        <pre>
 <h4>Posted Date: <%= DateFormat.getDateInstance().format(p.getDateTime()) %></h4>
 <h4>Location:    <%=p.getOrgAddress()%></h4>
 <h4>Vacancy:     <%=p.getVacancy()%></h4>
 <h4>Dateline:    <%=p.getDateline()%></h4>

                        </pre>
 <%
     
     int Sno=intern.getSno();
     
     applicationdao adao=new applicationdao(ConnectionProvider.getConnection());
     application app=adao.getApplicantsbyId(Sno, Postid);
     if(app==null){
 %>
                        <a class="btn btn-outline-primary" href="#" data-toggle="modal" data-target="#Apply-Modal" >Apply Now</a>
                   <%
                       }
else{
%>
<h4 style="color: green; font-style: italic">applied</h4>
<%
}
                   %>
                    </div>
                </div>
            </div>

        </div>




        <!-- Modal -->
        <div class="modal fade" id="Apply-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" id="main">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Send Your Resume</h5>
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form method="post" action="ApplicationSave" id="applyForm" enctype="multipart/form-data" class="form-disable">
                            <input type="hidden" value="<%=p.getPid()%>" name="pid">
                            <input type="hidden" value="<%=p.getOrgName()%>" name="orgname">
                            <input type="hidden" value="<%=p.getTitle()%>" name="title">



                            <div class="input-group mb-3">

                                <div class="custom-file">
                                    <input type="file" accept=".pdf" name="Cv" required>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type='submit' class="btn btn-primary" value='Submit' id='btClickMe'/>

                            </div>
                            <p id="msg"></p>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>

        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script>
             $("#applyForm").on("submit", function (event) {
                    //this gets called when form is submitted
                    event.preventDefault();
                    console.log("submitted");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "ApplicationSave",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Applied", "Thank you for applying for the internship", "success");
                            } else {
                             swal("error!", "Something went wrong. Try again!!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("error!", "Something went wrong. Try again!!", "error");

                        },
                        processData: false,
                        contentType: false

                    })
                })
        </script>
    </body>
</html>
