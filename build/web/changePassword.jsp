<%-- 
    Document   : changePassword
    Created on : Jun 16, 2021, 5:35:01 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.career.path.entities.admin"%>

<%

    admin ad = (admin) session.getAttribute("CurrentAdmin");
    if (ad == null) {
        session.setAttribute("msg", "invalid user");
        response.sendRedirect("Adminlogin.jsp");
        return;
    } 
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    </head>
    <body>
        <%@include file="adminNav.jsp" %>
        <main class="d-flex align-items-center" style="height: 80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h4>Change Password</h4>

                            </div>

                            <div class="card-body">
                                <form id="form" action="passwordUpdate.jsp">

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Current Password</label>
                                        <input type="password" class="form-control" name="current" id="exampleInputPassword1" placeholder="Current Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="newpass"> New Password</label>
                                        <input type="password" class="form-control" id="newpass" placeholder="New Password" name="npass" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="cpass"> Re-Enter Password</label>
                                        <input type="password" class="form-control" id="cpass" placeholder="Re-enter Password" name="cpass" onkeyup="checkPassword()" required>
                                        <span id="error"></span>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <script>
            function checkPassword() {
                var form = document.getElementById("form");
                var npass = document.getElementById("newpass").value;
                var cpass = document.getElementById("cpass").value;
                if (npass != cpass) {
                    form.classList.add("valid");
                    form.classList.remove("invalid");
                    error.innerHTML = "password doesnot matched";
                    error.style.color = "#ff0000";

                } else {
                    form.classList.remove("valid");
                    form.classList.add("invalid");
                    error.innerHTML = "password  matched";
                    error.style.color = "#00ff00";
                }
            }
          
        </script>
        
    </body>
</html>
