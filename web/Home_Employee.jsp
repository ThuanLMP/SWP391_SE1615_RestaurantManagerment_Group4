<%-- 
    Document   : HomeEmployee
    Created on : Jun 1, 2022, 3:40:21 PM
    Author     : ITACHI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Quản lý nhà hàng -  Nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <style>
        img{
            float:right;
            height: 250px;
        }

</style>
    <body class="sb-nav-fixed" style="background: #212529">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Restaurant-Employee</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profile">Profile</a></li>
                        
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav" >
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Đặt bàn và Mua hàng</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách đặt bàn
                            </a>
                            <a class="nav-link" href="listOr">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách mua hàng
                            </a>
                            <div class="sb-sidenav-menu-heading">Menu Management</div>
                            <a class="nav-link" href="listMenu">
                                <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                                Menu
                            </a>
                            <div class="sb-sidenav-menu-heading">Other</div>
                            
                            <a class="nav-link" href="atten">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Điểm danh
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        EMPLOYEE
                    </div>
                </nav>
            </div>
            
            <div  id="layoutSidenav_content" style="margin-left: 225px;margin-right: 225px;margin-top:20px ;padding-left: 0px;background-color: white "  >
                <main>
                    <div >
                        <img  src="assets/img/quanlau.jpg" >
                        </div>
                    <div >
                        
                        <div style ="width: 400px">
                    <c:if test="${sessionScope.emp != null}">
                        <div class="container-fluid px-4">
                        <h1 class="mt-4">Xin chào ${sessionScope.emp.name}</h1>                        
                    </div>
                            <p style="padding-left: 25px;">Mã nhân viên: ${sessionScope.emp.id}</p> 
                        </c:if>
                    <c:if test="${sessionScope.eid != null}" var="a" >
                        <p style="padding-left: 25px;"> Hôm nay (Năm/Tháng/Ngày) : ${sessionScope.today}</p> 
                        <br/>
                    <form action="home_employee" method="post">
                        <input name="eid" value="${sessionScope.eid}" type="hidden">
                        <c:if test="${sessionScope.attenEmp == sessionScope.today}">
                            <button class="btn btn-primary" style="background: black;margin-left: 25px" disabled >Đã điểm danh</button>
                        </c:if>
                        <c:if test="${sessionScope.attenEmp != sessionScope.today}">
                            <button class="btn btn-primary" style="background: black;margin-left: 25px" type="submit">Điểm danh</button>
                        </c:if>
                    
                    </form>
                        </div>
                    </c:if>
                        
                    </div>


                      <br/>
                      <hr/>
                      <div class="row" style="margin-left: 30px ">
                            <div class="col-xl-3 col-md-6">
                                <form action="home/order" method="GET"> 
                                    <div class="card bg-warning text-white mb-4">
                                        <input class="card-body btn-warning" type="submit" value="Gọi món cho khách hàng"/>
                                    </div>
                                    
                                </form>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <form action="home/table_checking" method="GET"> 
                                    <div class="card bg-warning text-white mb-4">
                                        <input class="card-body btn-warning" type="submit" value="Thông tin bàn ăn"/>
                                    </div>
                                    
                                </form>
                            </div>
                            
                        </div>
                        <p style="padding-left: 25px;">Những ngày bạn đã điểm danh trong tháng này: </p> 
                    <c:set var="count" value="0"/>
                    <div class="card-body" >                      
                                <table id="datatablesSimple"   >                                  
                                    
                                    <thead>
                                        <tr>
                                            <th>Stt</th>
                                            <th>Thời gian</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Stt</th>
                                            <th>Thời gian</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:if test="${sessionScope.listAtten != null}">
                                    <c:forEach items="${listAtten}" var="a">   
                                         
                                        <c:set var="count" value="${count + 1}" />
                                        <tr>    
                                             <td><c:out value="${count}"/></td>                                       
                                            <td>${a.date}<td>
                                        </tr> 
                                    </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                    
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Website edit by Team 4</div>
                            <div>
                                <a href="#">Contact FB</a>
                                &middot;
                                <a href="#">Soure code GitHub</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
                    
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>



