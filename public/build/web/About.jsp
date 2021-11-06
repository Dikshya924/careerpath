<%-- 
    Document   : About
    Created on : Nov 12, 2020, 8:24:33 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>About Us</title>
        <style>

            .right{
                position: absolute;
                top: 8px;
                right: 16px;
                font-size: 20px;


            }
            .about-img{
                opacity: 0.5;

            }
            .bottom{
                position: absolute;
                bottom: 100px;
                left: 30px;
                font-size: 70px;
                font-weight: bold;
            }
            p{
                margin: 50px;
                font-family: sans-serif;
                font-size: 20px;
            }

        </style>


    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <div class="container-fluid" style="position:  relative;" >
            <img src="images/p2c.png" class="img-fluid about-img" alt="alt"/>
            <div class="right">
                <a href="index.jsp">HOME</a>
                |
                <a href="#" style="color: black;">ABOUT</a>
            </div>
            <h1 class="bottom display-3">About Us</h1>
        </div>
        <h3 class="text-center mt-3 mb-5"> WHO WE ARE</h3>
        <p class="text-center">
            Path to Career P. Ltd is a business enterprise which has been designed and formulate, foresee the challenges of fresh graduates. 
            Path to Career not only set requirements of hiring industry for job seekers but also works in the direction of preparing fresher to be corporate ready.
            The gap between the Industry & academic circles is ever widening day by day and though “Bridging the Gap” has become the buzzword. Our experienced and highly qualified 
            team would hand-hold the students and helps them bridge this gap.
        </p>
        <h3 class="text-center mt-3 mb-5">Our Purpose</h3>
        <p class="text-center">
            The purpose of designing Path to Career P. Ltd. is to give the freshers a platform for finding a right and a 
            satisfactory job according to their qualification and skills. Path to Career P. Ltd. not only connects the freshers 
            with the corporate, companies, training but it also provides job portal for job seekers to submit their CV and apply 
            for job posting and employer can select best employees from available candidates. This is basically a job portal where 
            freshers can apply for jobs and employer post jobs and select prospective applicant. Path to Career P. Ltd is prepared 
            to provide all categories of job and help to get various type of job. The main purpose of Path to Career P. Ltd is to provide
            the facility to job seekers for getting a quick job.
            So, it enables applicants to search for jobs in a convenient manner and to enable employers to find suitable candidates.
            
        </p>
        <h3 class="text-center mt-3 mb-5">Our Team</h3>
        <div class="row mt-5 mb-5 ml-5">
            <div class="col-md-4">
                <div class="card text-center" style="border: none;max-width: 400px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
                    <img class="card-img-top" src="images/sanju.jpg">
                    <div class="card-body">
                        <h3 class="card-title">Sanju Bajracharya</h3>
                        <p>CEO</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center" style="border: none;max-width: 400px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
                    <img class="card-img-top" src="images/sanju.jpg" >
                    <div class="card-body">
                        <h3 class="card-title">Sanju Bajracharya</h3>
                        <p>CEO</p> 
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center" style="border: none;max-width: 400px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
                    <img class="card-img-top" src="images/sanju.jpg" >
                    <div class="card-body">
                        <h3 class="card-title">Sanju Bajracharya</h3>
                        <p>CEO</p> 
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
    
</html>
