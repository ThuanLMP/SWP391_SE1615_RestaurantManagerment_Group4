<%-- 
    Document   : Import
    Created on : Jul 19, 2022, 1:56:03 PM
    Author     : ITACHI
--%>


<%@page import="Model.Food"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <%
            ArrayList<Food> foods = (ArrayList<Food>) request.getAttribute("foods");

        %>
    </head>
    <body class="sb-nav-fixed">
        <% if(session.getAttribute("account") == null){ 
            request.getRequestDispatcher("login").forward(request, response);%>
            <%}else{%>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home_admin">Nhà hàng-Admin</a>
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
                           
                            <a class="nav-link" href="import">
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
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Nhập hàng</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Nhà hàng 1988</li>
                        </ol>
                        <div>
                            Đồ nhập: 
                            <select>
                                <%for (Food f : foods) {%>
                                <option><%=f.getName()%></option>
                                <%}%>

                            </select>
                            Số lượng: 
                            <input type="number" value="0"/>
                            Tiền:
                            <input type="number" value="0"/>
                            <button>Thêm mặt hàng</button>
                            <button>Tạo loại hàng mới</button>
                        </div>

                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Table ID</th>
                                    <th>Thời gian</th>
                                    <th>Tổng tiền</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Table ID</th>
                                    <th>Thời gian</th>
                                    <th>Tổng tiền</th>
                                </tr>
                            </tfoot>

                            <tbody>
                                
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
        <script>

        </script>
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

