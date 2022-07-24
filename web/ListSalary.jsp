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
        <title>Restaurant Management -  Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <% if(session.getAttribute("account") == null){ 
            request.getRequestDispatcher("login").forward(request, response);%>
            <%}else{%>

             
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home_admin">Restaurant-Admin</a>
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
                        <li><a class="dropdown-item" href="#!">Profile</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="changepass">Change Password</a></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Quản lý danh sách</div>
                            <a class="nav-link" href="listOr">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách hóa đơn
                            </a>
                            <a class="nav-link" href="listEmp">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách nhân viên
                            </a>
                             <a class="nav-link" href="listAcc">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách tài khoản
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý tài chính</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                                Doanh thu
                            </a>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-coins"></i></div>
                                Lợi nhuận
                            </a>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-credit-card"></i></div>
                                Chi phí
                            </a>
                             <a class="nav-link" href="listSalary">
                                <div class="sb-nav-link-icon"><i class="fas fa-money-bill"></i></div>
                                Lương chưa thanh toán
                            </a>
                            <a class="nav-link" href="listSalP">
                                <div class="sb-nav-link-icon"><i class="fas fa-money-bill"></i></div>
                                Lương đã thanh toán
                            </a>
                            <div class="sb-sidenav-menu-heading">Khác</div>
                           
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Nhập hàng
                            </a>
                            <a class="nav-link" href="feedback">
                                <div class="sb-nav-link-icon"><i class="fas fa-comment"></i></div>
                                Phản hồi
                            </a>
                           
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ADMIN
                    </div>
                </nav>
            </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ADMIN
                    </div>
                </nav>
            </div>


            <div id="layoutSidenav_content">
                <main>                    
                    <div class="card-body">                      
                                <table id="datatablesSimple"  >                               
                                    <hr>
                                    <thead>
                                        <tr>
                                            <th>Sid</th>
                                            <th>Eid</th>
                                            <th>Name</th>
                                            <th>Day work</th>
                                            <th>Date</th>
                                            <th>Total salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Sid</th>
                                            <th>Eid</th>
                                            <th>Name</th>
                                            <th>Day work</th>
                                            <th>Date</th>
                                            <th>Total salary</th>
                                            <th>Payment</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                    <c:forEach items="${listSal}" var="e">
                                        <tr>      
                                            <td>${e.sid}</td>
                                            <td>${e.employee.id}</td>
                                            <td>${e.employee.name}</td>
                                            <td>${e.daywork}</td>
                                            <td>${e.date}</td>
                                            <td>${e.totalSalary/1000}K</td>
                                        </tr>
                                    </c:forEach>
                                        
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
       <%}%>
    </body>

</html>


