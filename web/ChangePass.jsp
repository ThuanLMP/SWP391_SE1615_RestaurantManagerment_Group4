<%-- 
    Document   : ChangePass
    Created on : Jun 6, 2022, 10:10:45 PM
    Author     : ITACHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <% if(session.getAttribute("account") == null){ 
            request.getRequestDispatcher("login").forward(request, response);%>
            <%}else{%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Đổi mật khẩu</h3></div>
                                    <div class="card-body">
                                        <form action="changepass" method="POST" >
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="password" name ="pass" />
                                                <label for="inputEmail">Mật khẩu</label>
                                            </div>
                                            <% if (session.getAttribute("errorpass") != null) { %>
                                            <p style="color: red">${sessionScope.errorpass}</p>
                                            <%} else {%>
                                            <%}%> 


                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" name ="newpass"/>
                                                <label for="inputPassword">Mật khẩu mới</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" name ="re-newpass"/>
                                                <label for="inputPassword">Nhập lại mật khẩu mới</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">

                                                <% if (request.getAttribute("error") != null) { %>
                                                <p style="color: red">${requestScope.error}</p>
                                                <%} else {%>
                                                <%}%> 

                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <div style="margin-left: 100px">
                                                    <button class="btn btn-primary" type="submit">Đổi mật khẩu</button>

                                                </div>
                                                <div style="margin-right: 90px">
                                                    
                                                    <c:if test="${sessionScope.account.user == 'admin'}">
                                                        <a style="width: 120px" class="btn btn-primary" href="home_admin">Quay lại</a>
                                                    </c:if> 
                                                        
                                                    <c:if test="${sessionScope.account.user != 'admin'}">
                                                        <a style="width: 120px" class="btn btn-primary" href="home_employee">Quay lại</a>
                                                    </c:if>
                                                    
                                                </div>
                                            </div>


                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <%}%>
    </body>
</html>