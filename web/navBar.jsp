<%@page import="com.career.path.entities.Intern"%>

<%

    Intern intern1 = (Intern) session.getAttribute("CurrentIntern");
%>
<style><%@include file="css/newStyle.css"%></style>
<nav class="navbar sticky-top navbar-expand-lg navbar-light primary-background" >
    <a class="navbar-brand" href="#"><img src="images/p2c.jpg" height="90px"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="About.jsp">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp">Find Internship</a>
            </li>



            
        </ul>
        <%
            if (intern1 == null) {
        %>

    <div class="dropdown">
  <a class="btn btn-primary button dropdown-toggle"  data-toggle="dropdown" style="color: white;">Login
  <span class="caret"></span></a>
  <ul class="dropdown-menu">
      <li><a class="btn btn-outline-primary" href="Login.jsp">Intern</a>
          <a  class="btn btn-outline-primary" href="Adminlogin.jsp">Admin</a></li>
  </ul>
</div>

        <a href="RegisterIntern.jsp" class="btn btn-primary button">Sign In</a>


    </div>




    <%
    } else {

    %>
    <ul class="navbar-nav ">
        <li class="nav-item">
            <a class="nav-link" href="#"><span class="fa fa-user-circle"></span><%= intern1.getName()%></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
        </li>
    </ul>
    <%

        }
    %>




</nav>





