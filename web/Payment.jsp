<%-- 
    Document   : Payment
    Created on : Jul 12, 2022, 9:17:36 AM
    Author     : ITACHI
--%>

<%@page import="Model.Order"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
        <link href=" https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src=”js/scripts.js”></script>
        <style>
            .shopping-cart {
                padding-bottom: 50px;
                font-family: 'Montserrat', sans-serif;
            }

            .shopping-cart.dark {
                background-color: #f6f6f6;
            }

            .shopping-cart .content {
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
                background-color: white;
            }

            .shopping-cart .block-heading {
                padding-top: 50px;
                margin-bottom: 40px;
                text-align: center;
            }

            .shopping-cart .block-heading p {
                text-align: center;
                max-width: 420px;
                margin: auto;
                opacity: 0.7;
            }

            .shopping-cart .dark .block-heading p {
                opacity: 0.8;
            }

            .shopping-cart .block-heading h1,
            .shopping-cart .block-heading h2,
            .shopping-cart .block-heading h3 {
                margin-bottom: 1.2rem;
                color: #3b99e0;
            }

            .shopping-cart .items {
                margin: auto;
            }

            .shopping-cart .items .product {
                margin-bottom: 20px;
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .shopping-cart .items .product .info {
                padding-top: 0px;
                text-align: center;
            }

            .shopping-cart .items .product .info .product-name {
                font-weight: 600;
            }

            .shopping-cart .items .product .info .product-name .product-info {
                font-size: 14px;
                margin-top: 15px;
            }

            .shopping-cart .items .product .info .product-name .product-info .value {
                font-weight: 400;
            }

            .shopping-cart .items .product .info .quantity .quantity-input {
                margin: auto;
                width: 80px;
            }

            .shopping-cart .items .product .info .price {
                margin-top: 15px;
                font-weight: bold;
                font-size: 22px;
            }



            .shopping-cart .summary {
                border-top: 2px solid #5ea4f3;
                background-color: #f7fbff;
                height: 100%;
                padding: 30px;
            }

            .shopping-cart .summary h3 {
                text-align: center;
                font-size: 1.3em;
                font-weight: 600;
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .shopping-cart .summary .summary-item:not(:last-of-type) {
                padding-bottom: 10px;
                padding-top: 10px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }

            .shopping-cart .summary .text {
                font-size: 1em;
                font-weight: 600;
            }

            .shopping-cart .summary .price {
                font-size: 1em;
                float: right;
            }

            .shopping-cart .summary button {
                margin-top: 20px;
            }

            .all-value {
                height: 120px;
                padding-top: 7px;
            }

            .money {
                height: 15px;
            }

            .select-table {
                width: 100px;
                height: 30px;
                margin: 10px;
                background-color: antiquewhite;
                border-radius: 5px;
            }

            .cash {
                display: none;
            }

            .banking{
                display: none;
            }

            .agri{
                display: none;
            }
            .mb{
                display: none;
            }
            .tp{
                display: none;
            }
            .vcb{
                display: none;
            }
            .bidv{
                display: none;
            }
            .momo{
                display: none;
            }


            @media (min-width: 768px) {
                .shopping-cart .items .product .info {
                    padding-top: 25px;
                    text-align: left;
                }

                .shopping-cart .items .product .info .price {
                    font-weight: bold;
                    font-size: 22px;
                    top: 17px;
                }

                .shopping-cart .items .product .info .quantity {
                    text-align: center;
                }

                .shopping-cart .items .product .info .quantity .quantity-input {
                    padding: 1px 10px;
                    text-align: center;
                }

                .quantity {
                    margin-bottom: 2px;
                }
            }
        </style>
        <%

            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products_pay");
            Customer customer = (Customer) session.getAttribute("customer_pay");
            Order order = (Order) session.getAttribute("order_pay");

        %>
    </head>

    <body>

        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Thanh toán</h2>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-7">
                                <div class="summary">
                                    <h3>Hóa đơn</h3>
                                    Hóa đơn: <%=order.getId()%> <br>
                                    Khách hàng: <%=customer.getName()%><br>
                                    Bàn: <%=order.getTable().getId()%> 
                                    <div class="summary-item row">
                                        <span class="text col-md-4">Món ăn</span>
                                        <span class="amount col-md-3">Số lượng</span>
                                        <span class="price col-md-5">Tổng tiền</span>
                                    </div>


                                    <div class="summary-item row">
                                        <span class="text col-md-4">Lẩu 1</span>
                                        <span id="amount-1" class="amount col-md-3"><%=products.get(0).getAmount()%></span>
                                        <span id="price-1" class="price col-md-5"><%= (int) products.get(0).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Lẩu 2</span>
                                        <span id="amount-2" class="amount col-md-3"><%=products.get(1).getAmount()%></span>
                                        <span id="price-2" class="price col-md-5"><%= (int) products.get(1).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Lẩu 3</span>
                                        <span id="amount-3" class="amount col-md-3"><%=products.get(2).getAmount()%></span>
                                        <span id="price-3" class="price col-md-5"><%= (int) products.get(2).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Lẩu 4</span>
                                        <span id="amount-4" class="amount col-md-3"><%=products.get(3).getAmount()%></span>
                                        <span id="price-4" class="price col-md-5"><%= (int) products.get(3).getSumPrice()%> VND</span>
                                    </div>


                                    <div class="summary-item row">
                                        <span class="text col-md-4">Khoai tây</span>
                                        <span id="amount-5" class="amount col-md-3"><%=products.get(4).getAmount()%></span>
                                        <span id="price-5" class="price col-md-5"><%= (int) products.get(4).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Salat rau</span>
                                        <span id="amount-6" class="amount col-md-3"><%=products.get(5).getAmount()%></span>
                                        <span id="price-6" class="price col-md-5"><%= (int) products.get(5).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Cánh gà</span>
                                        <span id="amount-7" class="amount col-md-3"><%=products.get(6).getAmount()%></span>
                                        <span id="price-7" class="price col-md-5"><%= (int) products.get(6).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Đùi gà</span>
                                        <span id="amount-13" class="amount col-md-3"><%=products.get(7).getAmount()%></span>
                                        <span id="price-13" class="price col-md-5"><%= (int) products.get(7).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Cocacola</span>
                                        <span id="amount-8" class="amount col-md-3"><%=products.get(8).getAmount()%></span>
                                        <span id="price-8" class="price col-md-5"><%= (int) products.get(8).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Pepsi</span>
                                        <span id="amount-9" class="amount col-md-3"><%=products.get(9).getAmount()%></span>
                                        <span id="price-9" class="price col-md-5"><%= (int) products.get(9).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Aquafina</span>
                                        <span id="amount-10" class="amount col-md-3"><%=products.get(10).getAmount()%></span>
                                        <span id="price-10" class="price col-md-5"><%= (int) products.get(10).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Beer</span>
                                        <span id="amount-11" class="amount col-md-3"><%=products.get(11).getAmount()%></span>
                                        <span id="price-11" class="price col-md-5"><%= (int) products.get(11).getSumPrice()%> VND</span>
                                    </div>

                                    <div class="summary-item row">
                                        <span class="text col-md-4">Tổng tiền</span>
                                        <span id="amount-12" class="amount col-md-3"></span>
                                        <span id="demo" class="price col-md-5"><%= (int) order.getTotal()%> VND</span>

                                    </div>
                                    <div class="summary-item row">
                                        <span class="text col-md-4">Giảm giá</span>
                                        <span id="amount-12" class="amount col-md-3"></span>
                                        <span id="demo" class="price col-md-5">0 VND</span>
                                    </div>
                                    <div class="summary-item row">
                                        <span class="text col-md-4">Thanh toán</span>
                                        <span id="amount-12" class="amount col-md-3"></span>
                                        <span id="demo" class="price col-md-5"><%= (int) order.getTotal()%> VND</span>
                                    </div>

                                    <div class="mt-3">
                                        <a type="button" href="home/table_checking" class="btn btn-primary btn-lg btn-block">Quay lại</a>
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-12 col-lg-5">
                                <h3 class="mt-5 ml-5">Hình thức thanh toán</h3>

                                <div class="mt-5 ml-4">
                                    <button type="button" class="btn btn-secondary" onclick="click01()">Tiền mặt</button>
                                    <button type="button" class="btn btn-success" onclick="click02()">Chuyển khoản</button>
                                    <button type="button" class="btn btn-danger" onclick="click03()">Quẹt thẻ</button>
                                </div>

                                <div class="banking mt-5 ml-4" id="banking">
                                    <button type="button" class="btn btn-warning" onclick="agri()">Agri</button>
                                    <button type="button" class="btn btn-info" onclick="mb()">MB</button>
                                    <button type="button" class="btn btn-primary" onclick="tp()">TP</button>
                                    <button type="button" class="btn btn-dark" onclick="vcb()">VCB</button>
                                    <button type="button" class="btn btn-warning" onclick="bidv()">BIDV</button>
                                    <button type="button" class="btn btn-info" onclick="momo()">MOMO</button>

                                    <div class="mt-5 ml-5 agri" id="agri">
                                        Ngân hàng: Agribank <br>
                                        STK: 8803205094131 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>

                                    <div class="mt-5 ml-5 mb" id="mb">
                                        Ngân hàng: MB Bank <br>
                                        STK: 0388684080 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>

                                    <div class="mt-5 ml-5 tp" id="tp">
                                        Ngân hàng: TP Bank <br>
                                        STK: 190123333 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>

                                    <div class="mt-5 ml-5 vcb" id="vcb">
                                        Ngân hàng: VietComBank <br>
                                        STK: 211205094131 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>

                                    <div class="mt-5 ml-5 bidv" id="bidv">
                                        Ngân hàng: BIDV <br>
                                        STK: 1293122222 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>

                                    <div class="mt-5 ml-5 momo" id="momo">
                                        Ví điện tử: MOMO <br>
                                        STK: 0388684080 <br>
                                        Tên: TRAN VAN THUAN <br>
                                    </div>
                                </div>



                                <div class="cash"  id="cash">
                                    <div class="input-group input-group-sm mb-3 mt-3">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Số tiền nhận</span>
                                        <input type="number" step="1000" id="inputCash" value="<%= (int) order.getTotal()%>" min="<%=order.getTotal()%>" onchange="caculateCash()"  class="form-control" aria-label="Sizing example input"
                                               aria-describedby="inputGroup-sizing-sm">
                                        <input type="hidden" id="total"  value="<%=(int) order.getTotal()%>" >
                                    </div>
                                    Số tiền trả lại:           
                                    <div id="check">

                                    </div>

                                </div>

                                <form action="payment" method="POST">
                                    <div class="mt-5">
                                        <input type="hidden" value="<%=order.getId()%>" name="orderId">
                                        <input type="hidden" value="<%=order.getTable().getId()%>" name="tableId">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">Hoàn thành</button>
                                    </div>
                                </form>




                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <script>

            function caculateCash() {

                var x = document.getElementById("inputCash").value;
                var y = document.getElementById("total").value;

                document.getElementById("check").innerHTML = 1 * x - 1 * y + " &ensp; VND";
            }
            function click01() {
                document.getElementById("cash").style.display = 'block';
                document.getElementById("banking").style.display = 'none';
            }
            function click02() {
                document.getElementById("cash").style.display = 'none';
                document.getElementById("banking").style.display = 'block';
            }
            function click03() {
                document.getElementById("cash").style.display = 'none';
                document.getElementById("banking").style.display = 'none';
            }
            function agri() {
                document.getElementById("agri").style.display = 'block';
                document.getElementById("mb").style.display = 'none';
                document.getElementById("tp").style.display = 'none';
                document.getElementById("vcb").style.display = 'none';
                document.getElementById("bidv").style.display = 'none';
                document.getElementById("momo").style.display = 'none';
            }
            function mb() {
                document.getElementById("agri").style.display = 'none';
                document.getElementById("mb").style.display = 'block';
                document.getElementById("tp").style.display = 'none';
                document.getElementById("vcb").style.display = 'none';
                document.getElementById("bidv").style.display = 'none';
                document.getElementById("momo").style.display = 'none';
            }
            function tp() {
                document.getElementById("agri").style.display = 'none';
                document.getElementById("mb").style.display = 'none';
                document.getElementById("tp").style.display = 'block';
                document.getElementById("vcb").style.display = 'none';
                document.getElementById("bidv").style.display = 'none';
                document.getElementById("momo").style.display = 'none';
            }
            function vcb() {
                document.getElementById("agri").style.display = 'none';
                document.getElementById("mb").style.display = 'none';
                document.getElementById("tp").style.display = 'none';
                document.getElementById("vcb").style.display = 'block';
                document.getElementById("bidv").style.display = 'none';
                document.getElementById("momo").style.display = 'none';
            }
            function bidv() {
                document.getElementById("agri").style.display = 'none';
                document.getElementById("mb").style.display = 'none';
                document.getElementById("tp").style.display = 'none';
                document.getElementById("vcb").style.display = 'none';
                document.getElementById("bidv").style.display = 'block';
                document.getElementById("momo").style.display = 'none';
            }
            function momo() {
                document.getElementById("agri").style.display = 'none';
                document.getElementById("mb").style.display = 'none';
                document.getElementById("tp").style.display = 'none';
                document.getElementById("vcb").style.display = 'none';
                document.getElementById("bidv").style.display = 'none';
                document.getElementById("momo").style.display = 'block';
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </body>


</html>