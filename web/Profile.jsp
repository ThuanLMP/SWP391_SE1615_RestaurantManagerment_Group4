<%-- 
    Document   : Profile
    Created on : Jun 7, 2022, 12:22:07 AM
    Author     : ITACHI
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                background: -webkit-linear-gradient(left, #3931af, #00c6ff);
            }

            .emp-profile {
                padding: 3%;
                margin-top: 3%;
                margin-bottom: 3%;
                border-radius: 0.5rem;
                background: #fff;
            }

            .profile-img {
                text-align: center;

            }


            .profile-img img {
                width: 70%;
                height: 100%;
                border-radius: 5%;
            }

            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
            }

            .profile-img .file input {
                position: absolute;
                opacity: 0;
                right: 0;
                top: 0;
            }

            .profile-head h5 {
                color: #333;
            }

            .profile-head h6 {
                color: #0062cc;
            }

            .profile-edit-btn {
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                color: #6c757d;
                cursor: pointer;
            }

            .proile-rating {
                font-size: 12px;
                color: #818182;
                margin-top: 5%;
            }

            .proile-rating span {
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }

            .profile-head .nav-tabs {
                margin-bottom: 5%;
            }

            .profile-head .nav-tabs .nav-link {
                font-weight: 600;
                border: none;
            }

            .profile-head .nav-tabs .nav-link.active {
                border: none;
                border-bottom: 2px solid #0062cc;
            }

            .profile-work {
                padding: 14%;
                margin-top: -15%;
            }

            .profile-work p {
                font-size: 12px;
                color: #818182;
                font-weight: 600;
                margin-top: 10%;
            }

            .profile-work a {
                text-decoration: none;
                color: #495057;
                font-weight: 600;
                font-size: 14px;
            }

            .profile-work ul {
                list-style: none;
            }

            .profile-tab label {
                font-weight: 600;
            }

            .profile-tab p {
                font-weight: 600;
                color: #0062cc;
            }
        </style>

        <%  Employee emps = (Employee) request.getAttribute("employee");%>
    </head>

    <body>
        <div class="container emp-profile">

            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
                             alt="" />                       
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5>

                            <%=emps.getName()%>
                        </h5>
                        <h6>
                            <%=emps.getRole()%>
                        </h6>
                        <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                   aria-controls="home" aria-selected="true">Thông tin</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-md-2">

                    <form action="profile/edit" method="GET" >
                        <input type="hidden" name="name" value="<%=emps.getName()%>"/>
                        <input type="hidden" name="gmail" value="<%=emps.getGmail()%>" />
                        <input type="submit" class="profile-edit-btn" value="Edit Profile" />
                    </form>

                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <p>WORK LINK</p>
                        <a href="">Link FaceBook</a><br />
                        <a href="">Link Zalo</a><br />
                        <a href="">Link IG</a>
                        <p>SKILLS</p>
                        <a href="">Word</a><br />
                        <a href="">Excel</a><br />
                        <a href="">Powpoint</a><br />
                        <a href="">Vip</a><br />
                        <a href="">PHP, .Net</a><br />
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=emps.getName()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Vị trí</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=emps.getRole()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=emps.getGmail()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p><%=emps.getPhone()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Sở thích</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Yêu Code Java :v</p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Experience</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Hourly Rate</label>
                                </div>
                                <div class="col-md-6">
                                    <p>10$/hr</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Total Projects</label>
                                </div>
                                <div class="col-md-6">
                                    <p>230</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>English Level</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Availability</label>
                                </div>
                                <div class="col-md-6">
                                    <p>6 months</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Your Bio</label><br />
                                    <p>Your detail description</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="accept-order">
                <form action="home_employee" method="GET">
                    <input class="btn btn-primary btn-lg btn-block" type="submit" value="Quay lại"/>
                </form> 
            </div>
        </div>

    </body>

</html>