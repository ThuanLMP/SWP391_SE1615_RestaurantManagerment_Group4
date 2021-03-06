<%-- 
    Document   : EditProfile
    Created on : Jun 7, 2022, 2:45:43 PM
    Author     : ITACHI
--%>


<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                background: rgb(99, 39, 120)
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }


        </style>
        <%  Employee emp = (Employee) request.getAttribute("employee");%>
    </head>

    <body>
        <% if (session.getAttribute("account") == null) {
        request.getRequestDispatcher("login").forward(request, response);%>
        <%} else {%>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="mt-5 text-center">
                        <form action="../profile" method="GET">
                            <button class="btn btn-primary profile-button" type="submit">Quay l???i</button>
                        </form>

                    </div>
                </div>
                <div class="col-md-8 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Ch???nh s???a th??ng tin</h4>
                        </div>

                        <form action="edit" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">T??n</label> 
                                    <input type="text" maxlength="50" class="form-control" placeholder="Full name" name="name" value="<%=emp.getName()%>"  required>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">S??? ??i???n tho???i</label>
                                    <input type="text" inputmode=numeric pattern="\d*" class="form-control" placeholder="Enter phone number" name="phone"  value="<%=emp.getPhone()%>" required>
                                </div>

                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="Email" maxlength="50" class="form-control" placeholder="Enter email" name="gmail" value="<%=emp.getGmail()%>" required>
                                </div>
                                <div class="col-md-12">

                                </div>
                            </div>
                            <div class="row mt-3">

                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button> </div>
                            <%
                                String mess = (String) session.getAttribute("mess");
                                if (mess != null) {%>
                            <p style="color: red; font-size: 16px" ><%=mess%></p>
                            <%}
                            %>
                        </form>

                    </div>
                </div>
                <div class="col-md-1">

                </div>
            </div>
        </div>


        <%}%>
    </body>

</html>