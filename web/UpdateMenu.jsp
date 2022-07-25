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
            <a class="navbar-brand ps-3" href="home_employee">Restaurant-Employee</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                       
                        <li><a class="dropdown-item" href="changepass">Đổi mật khẩu</a></li>
                        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
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
                             <a class="nav-link" href="listMenu">
                                <div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
                                Danh sách món ăn
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
                <section style="background-color: #eee;">
  <div class="container py-5">

    <div class="row">
     
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
              <h4>Cập nhật món ăn</h4>
             <c:if test ="${sessionScope.menuUpdate != null}" >
             <form action="updateMenu" method="POST" >
                   <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">ID</p>
              </div>
              <div class="col-sm-9">
                  <input class="text-muted mb-0" type="text" name="midUpdate" value ="${sessionScope.menuUpdate.mid}" readonly maxlength="15"/>
              </div>
            </div>
                 <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Tên</p>
              </div>
              <div class="col-sm-9">
                  <input class="text-muted mb-0" type="text" name="mnameUpdate" value ="${sessionScope.menuUpdate.mname}" maxlength="15"/>
              </div>
            </div>
                 <hr>
                 <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Giá</p>
              </div>
              <div class="col-sm-9">
                  <input class="text-muted mb-0" type="text" name="mpriceUpdate" value ="${sessionScope.menuUpdate.price}" maxlength="15"/>
              </div>
            </div>
                 
               <% if(request.getAttribute("messMenuUpdate") != null){ %>
                <p style="color: red">${requestScope.messMenuUpdate}</p>
            <%}else{%>
            <%}%>
            <div style="margin-left: 240px; margin-top: 30px">
                <button class="btn btn-primary" type="submit">Cập nhật</button>
            </div>
            
             </form>
                  </c:if>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>
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



