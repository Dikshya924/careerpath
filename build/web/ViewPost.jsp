<%-- 
    Document   : viewIntern
    Created on : Nov 20, 2020, 11:19:00 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.career.path.entities.admin"%>
<%@page import="com.career.path.entities.Message"%>
<%@page import="com.career.path.entities.Post"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.dao.Postdao"%>
<%@page import="java.util.List"%>


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
        <title>View Posts</title>
    </head>
    <body>
        <%@include file="adminNav.jsp" %>
        <table class="table table-bordered">
            <%
                     Message m=(Message)session.getAttribute("msg");
                      if(m!=null){
            %>
            <div class="alert <%=m.getCssClass()%>" role="alert" style="float: right; width: 200px;">
                <%= m.getContent()%>
            </div>
            <%
                session.removeAttribute("msg");
                    }
            %>
            <thead class="thead-dark">
                <tr>
                    <th>PostID</th>
                    <th>Internship Title</th>
                    <th>Requirement</th>
                    <th>Dateline</th>
                    <th>Responsibilities</th>
                    <th>Vacancy No</th>
                    <th>Admin ID</th>
                    <th>Category ID</th>
                    <th>Organization Name</th>
                    <th>Location</th>
                    <th>About</th>
                    <th>Applicants</th>
                    <th>Update</th>
                    <th>Delete</th>

                </tr>
            </thead>
            <%
                          Postdao pdao=new Postdao(ConnectionProvider.getConnection());
                          List<Post> list1=pdao.getAll();
                          for(Post pp:list1)
                          {
            %>
            <tr>
                <td><%=pp.getPid()%></td>

                <td><%=pp.getTitle()%></td>
                <td><%=pp.getRequirement()%></td>
                <td><%=pp.getDateline()%></td>
                <td><%=pp.getResponsibilities()%></td>
                <td><%=pp.getVacancy()%></td>

                <td><%=pp.getSno()%></td>
                <td><%=pp.getCid()%></td>
                <td><%=pp.getOrgName()%></td>
                <td><%=pp.getOrgAddress()%></td>
                <td><%=pp.getOrgAbout()%></td>
                <td><a href="viewApplicant.jsp?id=<%=pp.getPid()%>" class="btn btn-outline-primary">Applicants</a></td>
                <td><a href="updatePost?id=<%=pp.getPid()%>" class="btn btn-outline-primary btnEdit" data-toggle="modal" >Update</a></td>
                <td><a href="DeletePost?id=<%=pp.getPid()%>"  class="btn btn-outline-danger">Delete</a></td>
                </td>



            </tr>

            <%
                }
            %>

        </table>


        <!--beginning of update post modal-->
        <div class="modal fade" id="updateCatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update the data carefully</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="updatePost" method="POST">


                            <div class="form-group">

                                <input type="hidden" class="form-control" id="exampleInputSno" name="id">

                            </div>


                            <div class="form-group">
                                <label for="exampleInputTitle">Internship Title</label>
                                <input type="text" class="form-control" id="exampleInputTitle" name="title" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputRequirement">Requirement</label>
                                <textarea cols="10" rows="6" class="form-control" id="exampleInputRequirement" name="requirement"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputDateLine">Dateline</label>
                                <input type="text" class="form-control" id="exampleInputDateLine" name="dateline">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputResponsibility">Responsibility</label>
                                <textarea cols="10" rows="6" class="form-control" id="exampleInputResponsibility" name="responsibility" ></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputVacancy">Vacancy No</label>
                                <input type="text" class="form-control" id="exampleInputVacancy" name="vacancy">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputName">Organization Name</label>
                                <input type="text" class="form-control" id="exampleInputName" name="orgName">

                            </div>

                            <div class="form-group">
                                <label for="exampleInputLocation">Location</label>
                                <input type="text" class="form-control" id="exampleInputLocation" name="location">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!--end of update post modal-->

      

        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <script>
            $(document).ready(function () {
                $('.btnEdit').on('click', function () {
                    $('#updateCatModal').modal('show');
                    $tr = $(this).closest('tr');
                    var data = $tr.children("td").map(function () {
                        return $(this).text();
                    }).get();
                    console.log(data);
                    $('#exampleInputSno').val(data[0]);

                    $('#exampleInputTitle').val(data[1]);
                    $('#exampleInputRequirement').val(data[2]);
                    $('#exampleInputDateLine').val(data[3]);
                    $('#exampleInputResponsibility').val(data[4]);
                    $('#exampleInputVacancy').val(data[5]);

                    $('#exampleInputName').val(data[8]);
                    $('#exampleInputLocation').val(data[9]);
                });


            });
        </script>
       

    </body>
</html>
