<%-- 
    Document   : viewIntern
    Created on : Nov 20, 2020, 11:19:00 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.career.path.entities.admin"%>
<%@page import="com.career.path.entities.Categories"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.dao.Categorydao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.career.path.entities.Message"%>

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
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>CID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>edit</th>
                    
                    

                </tr>
            </thead>
            <%
                          Categorydao cdao=new Categorydao(ConnectionProvider.getConnection());
                          ArrayList<Categories> list1=cdao.getAllCategorieses();
                          for(Categories cc:list1)
                          {
            %>
            <tr>
                <td><%=cc.getCid()%></td>
                <td><%=cc.getTitle()%></td>
                <td><%=cc.getDescription()%></td>

                <td><a href="editCategories?id=<%=cc.getCid()%>" class="btn btn-outline-primary btnEdit" data-toggle="modal" data-target="#updateCatModal">Edit</a>

                </td>
<!--                <td><a href="DeleteCat?id=<%=cc.getCid()%>" class="btn btn-outline-primary">Delete</a>-->

                </td>
                
                


            </tr>

            <%}
            %>

        </table>
        <!--begin of update categories modal-->
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

                        <form action="editCategories" id="update-categories" method="POST">
                            <div class="form-group">

                                <input type="hidden" class="form-control" id="exampleInputSno" name="id">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputTitle">Title</label>

                                <input type="text" class="form-control" id="exampleInputTitle" name="title" >

                            </div>

                            <div class="form-group">
                                <label for="exampleInputDescription">Description</label>
                                <textarea rows="10" cols="30" class="form-control" id="exampleInputDescription" name="desc" ></textarea>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of update categories modal-->

        <!--+----------------------------+--------------------------------+--------------------------------+-->

      


        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.btnEdit').on('click', function () {

                    $tr = $(this).closest('tr');
                    var data = $tr.children("td").map(function () {
                        return $(this).text();
                    }).get();
                    console.log(data);
                    $('#exampleInputSno').val(data[0]);
                    $('#exampleInputTitle').val(data[1]);
                    $('#exampleInputDescription').val(data[2]);

                });
               
            });
        </script>
<!--        <script>
             $("#update-categories").on("submit", function (event) {
                    //this gets called when form is submitted
                    event.preventDefault();
                    console.log("submitted");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "editCategories",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Updated Successfully", "success");
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
        </script>-->
      
                

    </body>
</html>
