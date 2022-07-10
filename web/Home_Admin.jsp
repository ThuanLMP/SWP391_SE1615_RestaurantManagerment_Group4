<%-- 
    Document   : HomeAdmin
    Created on : May 31, 2022, 1:21:53 PM
    Author     : ITACHI
--%>

<%@page import="Model.Order"%>
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
            ArrayList<Double> revenueList = (ArrayList<Double>) request.getAttribute("revenueList");
            ArrayList<Integer> sumBfIdList = (ArrayList<Integer>) request.getAttribute("sumBfId");
            ArrayList<Order> orderTodayDone = (ArrayList<Order>) request.getAttribute("orderTodayDone");
            ArrayList<Order> orderTodayActive = (ArrayList<Order>) request.getAttribute("orderTodayActive");
        %>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Restaurant-Admin</a>
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
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">List Management</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                List Order
                            </a>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                List Employee
                            </a>
                            <div class="sb-sidenav-menu-heading">Cash Management</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                                Revenue
                            </a>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-coins"></i></div>
                                Profit
                            </a>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-credit-card"></i></div>
                                Expenses
                            </a>
                            <div class="sb-sidenav-menu-heading">Orther</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Account
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Import
                            </a>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-comment"></i></div>
                                Feedback
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
                        <h1 class="mt-4">Home-Management</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Restaurant</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Doanh thu hôm nay</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=revenueList.get(0) / 100000%> triệu VND</h3>

                                        <div class="small text-white"> </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Lợi nhuận tháng này</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3>20</h3>
                                        <div class="small text-white"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Hóa đơn đã thanh toán hôm nay</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=orderTodayDone.size()%></h3>
                                        <div class="small text-white"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Bàn đang hoạt động</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=orderTodayActive.size()%></h3>
                                        <div class="small text-white"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        Biểu đồ doanh thu
                                    </div>
                                    <canvas id="bar-chart" width="800" height="450"></canvas>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        Biểu đồ khách hàng
                                    </div>
                                    <canvas id="pie-chart" width="800" height="450"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách hóa đơn đã thanh toán hôm nay
                            </div>
                            <div class="card-body">
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
                                        <% for(Order o:orderTodayDone){ %>
                                        <tr>
                                            <th><%=o.getId()%></th>
                                            <th><%=o.getTable().getId()%></th>
                                            <th><%=o.getTime()%></th>
                                            <th><%=o.getTotal()%></th>
                                        </tr>                                            
                                        <%   
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
            new Chart(document.getElementById("bar-chart"), {
                type: 'bar',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [
                        {
                            label: "Doanh thu (triệu VND)",
                            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#c21323", "#c15850", "#c49840", "#c42050", "#c45110", "#c23850", "#c45320"],
                            data: [<%=revenueList.get(1) / 1000000%>,<%=revenueList.get(2) / 1000000%>, <%=revenueList.get(3) / 1000000%>, <%=revenueList.get(4) / 1000000%>, <%=revenueList.get(5) / 1000000%>, <%=revenueList.get(6) / 1000000%>, <%=revenueList.get(7) / 1000000%>, <%=revenueList.get(8) / 1000000%>, <%=revenueList.get(9) / 1000000%>, <%=revenueList.get(10) / 1000000%>, <%=revenueList.get(11) / 1000000%>, <%=revenueList.get(12) / 1000000%>]
                        }
                    ]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: 'Doanh thu năm 2022'
                    }
                }
            });

            new Chart(document.getElementById("pie-chart"), {
                type: 'pie',
                data: {
                    labels: ["Buffet 120k", "Buffet 150k", "Buffet 200k", "Buffet 400k"],
                    datasets: [{
                            label: "Population (millions)",
                            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9"],
                            data: [<%=sumBfIdList.get(0)%>, <%=sumBfIdList.get(1)%>, <%=sumBfIdList.get(2)%>, <%=sumBfIdList.get(3)%>]
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Biểu đồ sở thích của khách hàng tháng 7'
                    }
                }
            });

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
