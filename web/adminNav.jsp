<%@page import="com.career.path.entities.Intern"%>
<%@page import="com.career.path.entities.admin"%>

<%

    admin add = (admin) session.getAttribute("CurrentAdmin");
    if (add == null) {
        session.setAttribute("msg", "invalid user");
        response.sendRedirect("Adminlogin.jsp");
        return;
    } 
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="images/p2c.jpg" height="90px"/>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="admin.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            View Data
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="viewIntern.jsp">Intern</a>
                            <a class="dropdown-item" href="ViewCategories.jsp">Categories</a>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ViewPost.jsp">Internship Posted</a>


                        </div>
                    </li>

                </ul>
                <ul class="navbar-nav ">
                    <li class="nav-item">
                        <div class="dropdown">
                            <button class="btn btn-primary-outline dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%=add.getUsername()%>
                            </button>
                             <div class="dropdown-menu dropdown-menu-right">
                               
                                <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
                                 <a class="dropdown-item" href="LogoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
                             
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </body>

</html>







