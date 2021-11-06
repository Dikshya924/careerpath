<%-- 
    Document   : Login
    Created on : Oct 13, 2020, 12:17:11 PM
    Author     : Dikshya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <title>Register|Intern</title>
        
    </head>
    <body>

        <%@include file="navBar.jsp" %>
        <main class="d-flex align-items-center" style="height: 100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h1>Register</h1>

                            </div>

                            <div class="card-body">
                                <form id="reg" action="#" method="POST">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" name="user" onkeyup="validation()" autocomplete="off" class="form-control"  id="exampleInputUsername" placeholder="Enter your full name" required>
                                        <span id="username"></span>
                                       
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email"  class="form-control" autocomplete="off" id="exampleInputEmail1" onkeydown="validation()" aria-describedby="emailHelp" placeholder="Enter email" required>
                                          <span id="email"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    
                                         
                                    </div>
                                     <div class="form-group">
                                        <label for="exampleInputPassword">Re-Enter Password</label>
                                        <input type="password" name="check_password" class="form-control" id="exampleInputPassword" onkeyup="validation()"  placeholder="Password" required>
                                    
                                         <span id="check"></span>
                                    </div>

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                        <label class="form-check-label" for="exampleCheck1">Accept terms and conditions</label>

                                    </div>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>please wait</h4>
                                    </div>
                                    <button id="register" type="submit" class="btn btn-primary align-items-center">Register</button>
                                </form>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Login.jsp">Already have an account? Login here</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
    <!--javascript-->
    <script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">
        function validation(){
            var reg=document.getElementById("reg");
            var email=document.getElementById("exampleInputEmail1").value;
            var user=document.getElementById("exampleInputUsername").value;
            var pass=document.getElementById("exampleInputPassword1").value;
            var cpass=document.getElementById("exampleInputPassword").value;
            var mail=document.getElementById("email");
            var username=document.getElementById("username");
            var password=document.getElementById("check");
            var patternEmail= /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            var patternUsername= /^[A-Z]+[a-z ]+[A-Za-z]/;
            if(email.match(patternEmail)){
                reg.classList.add("valid");
                reg.classList.remove("invalid");
                mail.innerHTML= "your email address in valid.";
                mail.style.color="#00ff00";
            }
            else{
                 reg.classList.remove("valid");
                reg.classList.add("invalid");
                mail.innerHTML= "your email address in invalid.";
                mail.style.color="#ff0000";
            }
             if(user.match(patternUsername)){
                reg.classList.add("invalid");
                reg.classList.remove("valid");
                username.innerHTML= "your Username in valid.";
                username.style.color="#00ff00";
            }
            else{
                reg.classList.add("invalid");
                reg.classList.remove("valid");
                username.innerHTML= "your Username in invalid.";
                username.style.color="#ff0000";
            }
            if(pass!=cpass){
                reg.classList.add("valid");
                reg.classList.remove("invalid");
                password.innerHTML="password doesnot matched";
                password.style.color="#ff0000";
                
            }
            else{
                 reg.classList.remove("valid");
                reg.classList.add("invalid");
                password.innerHTML= "password  matched";
                password.style.color="#00ff00";
            }
        }
        
    </script>

  
    <script>
        $(document).ready(function ()
        {
            console.log("loaded....")
            $('#reg').on('submit', function (event)
            {
                event.preventDefault();
                let form = new FormData(this);
                $("#register").hide();
                $("#loader").show();
                $.ajax({
                    url: "InternReg",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {

                        $("#register").show();
                        $("#loader").hide();

                        if (data.trim() == 'Registered')
                        {
                            swal("Registered Sucessfully.")
                                    .then((value) => {
                                        window.location = "Login.jsp"
                                    });
                        } else {
                            swal("email already exist!!!");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $("#register").show();
                        $("#loader").hide();
                        swal("Something went wrong try again");

                    },
                    processData: false,
                    contentType: false

                });
            });
        });
    </script>


    <!--javascript-->
</body>
</html>
