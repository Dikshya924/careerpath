<%-- 
    Document   : admin
    Created on : Nov 4, 2020, 4:13:43 PM
    Author     : user
--%>

<%@page import="com.career.path.dao.Categorydao"%>
<%@page import="com.career.path.dao.Postdao"%>
<%@page import="com.career.path.dao.Interndao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.career.path.entities.Categories"%>
<%@page import="com.career.path.entities.Post"%>
<%@page import="com.career.path.helper.ConnectionProvider"%>
<%@page import="com.career.path.entities.Intern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>admin Page</title>

    </head>
    <body>
        <!----------Beginning of nav bar----------------->
        <%@include file="adminNav.jsp" %>


        <!----------End of nav bar----------------->
        <div class="container admin">

            <div class="row mt-3">
                <!--first col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/businessman.png" alt="user">
                            </div>
                            <%Interndao idao=new Interndao(ConnectionProvider.getConnection());
                              List<Intern> lst=idao.getAll();%>
                            <h3><%=lst.size()%></h3>
                            <h3 class="text-uppercase text-muted">Intern</h3>
                        </div>
                    </div>
                </div>
                <!--second col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/admin.png" alt="categories">
                            </div>
                            <%Categorydao cdao=new Categorydao(ConnectionProvider.getConnection());
                              ArrayList<Categories> list1=cdao.getAllCategorieses();%>



                            <h3><%=list1.size()%></h3>
                            <h3 class="text-uppercase text-muted">Categories</h3>
                        </div>
                    </div>
                </div>
                <!--second col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/sticky-notes.png" alt="post">
                            </div>
                            <%
                          Postdao pdao=new Postdao(ConnectionProvider.getConnection());
                          List<Post> list=pdao.getAll();
                        %>
                            <h3><%=list.size()%></h3>
                            <h3 class="text-uppercase text-muted">Internship posted</h3>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#addCategoryModel" >
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/list.png" alt="post">
                            </div>

                            <h3 class="text-uppercase text-muted">Add Categories</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#addPostModel">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/plus.png" alt="post">
                            </div>

                            <h3 class="text-uppercase text-muted">Add post</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#addAdminModel">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/admin.png" alt="user">
                            </div>

                            <h3 class="text-uppercase text-muted">Add Admin</h3>
                        </div>
                    </div>
                </div>
            </div>





            <!-- Add Category modal -->


            <!-- Modal -->
            <div class="modal fade" id="addCategoryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Fill the categories Detail</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="processOperationServlet" method="post" id="add-category-form">
                                <input type="hidden" name="operation" value="addCategory">
                                <div class="form-group">
                                    <input type="text" placeholder="Categories title" class="form-control" name="catTitle" required>
                                </div>
                                <div class="form-group">
                                    <textarea name="catDesc" placeholder="Categories Description" class="form-control" style="height: 300px;" required></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Categories</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!--End Category modal 
            <!-- Modal -->
            <div class="modal fade" id="addAdminModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Fill the  Detail</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="processOperationServlet" method="post" id="add-admin-form">
                                <input type="hidden" name="operation" value="addAdmin">
                                <div class="form-group">
                                    <input type="text" placeholder="Admin name" class="form-control" name="user" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" placeholder="Admin Email" class="form-control" name="mail" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Admin Password" class="form-control" name="pass" required>
                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Add Admin</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!--End Admin modal -->

            <!-- add post modal -->
            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="addPostModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Post An Internship</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="processOperationServlet" method="post" id="add-post-form">
                                <input type="hidden" name="operation" value="addPost">
                                <div class="form-group">
                                    <select class="form-control" name="catSelect">
                                        <option selected disabled>---Select the Category---</option>
                                        <%
                                            Categorydao dao=new Categorydao(ConnectionProvider.getConnection());
                                            ArrayList<Categories> list2=dao.getAllCategorieses();
                                            for(Categories c:list2)
                                            {
                                        %>
                                        <option value="<%= c.getCid() %>"><%=c.getTitle()%></option>
                                        <%
                                    }
                          
                          
                                        %>

                                    </select>
                                </div>



                        </div>

                        <div class="form-group">
                            <input type="text" placeholder="Internship title" class="form-control" name="title" required>

                        </div>
                        <div class="form-group">
                            <textarea placeholder="Requirement" style=" height: 200px;" name="requirement" class="form-control"></textarea>

                        </div>
                        <div class="form-group">
                            <label>Application Dateline</label>
                            <input type="datetime-local" class="form-control" name="dateline" required>

                        </div>
                        <div class="form-group">
                            <textarea placeholder="Responsibilities" style=" height: 200px;" name="responsibilities" class="form-control"></textarea>

                        </div>
                        <div class="form-group">
                            <input type="number" placeholder="no. of position" class="form-control" name="vacancy" required>

                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="Organization Name" class="form-control" name="orgName" required>

                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="About" class="form-control" name="orgAbout" required>

                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="Address" class="form-control" name="orgAddress" required>

                        </div>
                             <div class="form-group">
                            <input type="file" placeholder="logo" class="form-control" name="orgLogo" required>

                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-success">Post Internship</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- end post modal -->
        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--Post js using ajax-->
        <script>
            $(document).ready(function (e) {
                //alert("loaded");
                $("#add-post-form").on("submit", function (event) {
                    //this gets called when form is submitted
                    event.preventDefault();
                    console.log("submitted");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "processOperationServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Posted Successfully", "success");
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


                $("#add-category-form").on("submit", function (event) {
                    //this gets called when form is submitted
                    event.preventDefault();
                    console.log("submitted");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "processOperationServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Posted Successfully", "success");
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
                $("#add-admin-form").on("submit", function (event) {
                    //this gets called when form is submitted
                    event.preventDefault();
                    console.log("submitted");
                    let form = new FormData(this);
                    //now requesting to server

                    $.ajax({
                        url: "processOperationServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Posted Successfully", "success");
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

            })
        </script>
        <!--end post js using ajax-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
