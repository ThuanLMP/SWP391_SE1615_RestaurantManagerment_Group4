<%-- 
    Document   : editOrder
    Created on : Jun 30, 2022, 12:08:19 AM
    Author     : ITACHI
--%>

<%@page import="java.util.Deque"%>
<%@page import="Model.Customer"%>
<%@page import="Model.Product"%>
<%@page import="Model.Table"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>

    <head>
        <title>Edit Order</title>
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
            .customer{
                text-align: center;

            }
            input{
                margin-bottom: 5px;
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
            
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
            Customer customer = (Customer) session.getAttribute("customer");
            Deque<Table> tables = (Deque<Table>) session.getAttribute("tables");
        
        %>
    </head>

    <body>

        <main class="page">
            <form action="editOrder" method="POST">
                <section class="shopping-cart dark">

                    <div class="container">
                        <div class="block-heading">
                            <h2>Edit Order</h2>
                        </div>
                        <div class="content">
                            <div class="row">
                                <div class="col-md-12 col-lg-7">
                                    <div class="table">

                                        <select class="select-table" name="table">
                                            <% for (Table t : tables) {%>
                                            <option><%=t.getId()%></option>
                                            <%}%>
                                        </select>
                                        <div class="customer">

                                            Tên &ensp; : <input required type="text" value="<%=customer.getName()%>" maxlength="50" name="name" pattern="[a-z]{1,15}"/> <br>
                                            Gmail : <input required  id="gmail" value="<%=customer.getGmail()%>" maxlength="50" type="email" name="gmail"/> <br>
                                            SDT &ensp; :   <input required  type="text" value="<%=customer.getPhone()%>" maxlength="20" inputmode=numeric pattern="\d*" name="phone"/>
                                        </div>

                                    </div>

                                    <div class="items">

                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">

                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Món chính</a>
                                                                    <div class="product-info">
                                                                        <div>Lẩu 1: <span class="value">120k</span></div>
                                                                        <div>Lẩu 2: <span class="value">150k</span></div>
                                                                        <div>Lẩu 3: <span class="value">200k</span></div>
                                                                        <div>Lẩu 4: <span class="value">400k</span></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 quantity">
                                                                <label for="quantity">Số lượng</label>
                                                                <input id="quantity-0" type="number" min="0" max="1000" maxlength="3" name="buffe1" value="<%=products.get(0).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calBf1()" class="form-control quantity-input">
                                                                <input id="quantity-1" type="number" min="0" max="1000" maxlength="3" name="buffe2" value="<%=products.get(1).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calBf2()" class="form-control quantity-input">
                                                                <input id="quantity-2" type="number" min="0" max="1000" maxlength="3" name="buffe3" value="<%=products.get(2).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calBf3()" class="form-control quantity-input">
                                                                <input id="quantity-3" type="number" min="0" max="1000" maxlength="3" name="buffe4" value="<%=products.get(3).getAmount()%>"
                                                                        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calBf4()" class="form-control quantity-input">
                                                            </div>
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Thành tiền</a>
                                                                    <div class="all-value">
                                                                        <p class="money" id="bf-1"><%=products.get(0).getAmount()*120%>.000 VND</p>
                                                                        <p class="money" id="bf-2"><%=products.get(1).getAmount()*150%>.000 VND</p>
                                                                        <p class="money" id="bf-3"><%=products.get(2).getAmount()*200%>.000 VND</p>
                                                                        <p class="money" id="bf-4"><%=products.get(3).getAmount()*400%>.000 VND</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">

                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Món phụ</a>
                                                                    <div class="product-info">
                                                                        <div>Khoai tây chiên: <span class="value">20k</span>
                                                                        </div>
                                                                        <div>Salat rau: <span class="value">30k</span></div>
                                                                        <div>Cánh gà chiên: <span class="value">35k</span></div>
                                                                        <div>Đùi gà chiên: <span class="value">40k</span></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 quantity">
                                                                <label for="quantity">Số lượng</label>
                                                                <input id="quantity-4" type="number" min="0" max="1000" maxlength="3" name="potato" value="<%=products.get(4).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calTm1()" class="form-control quantity-input">
                                                                <input id="quantity-5" type="number" min="0" max="1000" maxlength="3" name="salat" value="<%=products.get(5).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calTm2()" class="form-control quantity-input">
                                                                <input id="quantity-6" type="number" min="0" max="1000" maxlength="3" name="chickenW" value="<%=products.get(6).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calTm3()" class="form-control quantity-input">
                                                                <input id="quantity-7" type="number" min="0" max="1000" maxlength="3" name="chickenT" value="<%=products.get(7).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calTm4()" class="form-control quantity-input">
                                                            </div>
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Thành tiền</a>
                                                                    <div class="all-value">
                                                                        <p class="money" id="tm-1"><%=products.get(4).getAmount()*20%>.000 VND</p>
                                                                        <p class="money" id="tm-2"><%=products.get(5).getAmount()*30%>.000 VND</p>
                                                                        <p class="money" id="tm-3"><%=products.get(6).getAmount()*35%>.000 VND</p>
                                                                        <p class="money" id="tm-4"><%=products.get(7).getAmount()*40%>.000 VND</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">

                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Nước uống</a>
                                                                    <div class="product-info">
                                                                        <div>Cocacola: <span class="value">15k</span></div>
                                                                        <div>Pepsi: <span class="value">15k</span></div>
                                                                        <div>Aquafina: <span class="value">10k</span></div>
                                                                        <div>Beer: <span class="value">12k</span></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 quantity">
                                                                <label for="quantity">Số lượng</label>
                                                                <input id="quantity-8" type="number" min="0" max="1000" maxlength="3" name="cocacola" value="<%=products.get(8).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calDr1()" class="form-control quantity-input">
                                                                <input id="quantity-9" type="number" min="0" max="1000" maxlength="3" name="pepsi" value="<%=products.get(9).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calDr2()" class="form-control quantity-input">
                                                                <input id="quantity-10" type="number" min="0" max="1000" maxlength="3" name="aquafina" value="<%=products.get(10).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calDr3()" class="form-control quantity-input">
                                                                <input id="quantity-11" type="number" min="0" max="1000" maxlength="3" name="beer" value="<%=products.get(11).getAmount()%>"
                                                                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                       onchange="calDr4()" class="form-control quantity-input">
                                                            </div>
                                                            <div class="col-md-4 product-name">
                                                                <div class="product-name">
                                                                    <a href="#">Thành tiền</a>
                                                                    <div class="product-info">
                                                                        <p class="money" id="dr-1"><%=products.get(8).getAmount()*15%>.000 VND</p>
                                                                        <p class="money" id="dr-2"><%=products.get(9).getAmount()*15%>.000 VND</p>
                                                                        <p class="money" id="dr-3"><%=products.get(10).getAmount()*10%>.000 VND</p>
                                                                        <p class="money" id="dr-4"><%=products.get(11).getAmount()*12%>.000 VND</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                                                    
                                    <div class="accept-order">
                                        <a class="btn btn-primary btn-lg btn-block" href="home/table_checking">Quay lại</a>
                                    </div>
                                                                    
                                </div>

                                <div class="col-md-12 col-lg-5">
                                    <div class="summary">
                                        <h3>Summary</h3>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Sản phẩm</span>
                                            <span class="amount col-md-3">Số lượng</span>
                                            <span class="price col-md-5">Tổng</span>
                                        </div>


                                        <div class="summary-item row">
                                            <span class="text col-md-4">Lẩu 1</span>
                                            <span id="amount-1" class="amount col-md-3"><%=products.get(0).getAmount()%></span>
                                            <span id="price-1" class="price col-md-5"><%=products.get(0).getAmount()*120%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Lẩu 2</span>
                                            <span id="amount-2" class="amount col-md-3"><%=products.get(1).getAmount()%></span>
                                            <span id="price-2" class="price col-md-5"><%=products.get(1).getAmount()*150%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Lẩu 3</span>
                                            <span id="amount-3" class="amount col-md-3"><%=products.get(2).getAmount()%></span>
                                            <span id="price-3" class="price col-md-5"><%=products.get(2).getAmount()*200%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Lẩu 4</span>
                                            <span id="amount-4" class="amount col-md-3"><%=products.get(3).getAmount()%></span>
                                            <span id="price-4" class="price col-md-5"><%=products.get(3).getAmount()*400%>.000 VND</span>
                                        </div>


                                        <div class="summary-item row">
                                            <span class="text col-md-4">Khoai tây</span>
                                            <span id="amount-5" class="amount col-md-3"><%=products.get(4).getAmount()%></span>
                                            <span id="price-5" class="price col-md-5"><%=products.get(4).getAmount()*20%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Salat rau</span>
                                            <span id="amount-6" class="amount col-md-3"><%=products.get(5).getAmount()%></span>
                                            <span id="price-6" class="price col-md-5"><%=products.get(5).getAmount()*30%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Cánh gà</span>
                                            <span id="amount-7" class="amount col-md-3"><%=products.get(6).getAmount()%></span>
                                            <span id="price-7" class="price col-md-5"><%=products.get(6).getAmount()*35%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Đùi gà</span>
                                            <span id="amount-13" class="amount col-md-3"><%=products.get(7).getAmount()%></span>
                                            <span id="price-13" class="price col-md-5"><%=products.get(7).getAmount()*40%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Cocacola</span>
                                            <span id="amount-8" class="amount col-md-3"><%=products.get(8).getAmount()%></span>
                                            <span id="price-8" class="price col-md-5"><%=products.get(8).getAmount()*15%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Pepsi</span>
                                            <span id="amount-9" class="amount col-md-3"><%=products.get(9).getAmount()%></span>
                                            <span id="price-9" class="price col-md-5"><%=products.get(9).getAmount()*15%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Aquafina</span>
                                            <span id="amount-10" class="amount col-md-3"><%=products.get(10).getAmount()%></span>
                                            <span id="price-10" class="price col-md-5"><%=products.get(10).getAmount()*10%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Beer</span>
                                            <span id="amount-11" class="amount col-md-3"><%=products.get(11).getAmount()%></span>
                                            <span id="price-11" class="price col-md-5"><%=products.get(11).getAmount()*12%>.000 VND</span>
                                        </div>

                                        <div class="summary-item row">
                                            <span class="text col-md-4">Tổng</span>
                                            <span id="amount-12" class="amount col-md-3"></span>
                                            <span id="demo" class="price col-md-5">0</span>
                                        </div>


                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="calSum()">Tính tiền</button>



                                        <div class="All Orders">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block">Checkout</button>
                                        </div>




                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>



                </section>

            </form>

        </main>
    </body>
    <script>

        

        function calSum() {
            var a = document.getElementById("quantity-0").value;
            var a1 = a * 120;
            var b = document.getElementById("quantity-1").value;
            var b1 = b * 150;
            var c = document.getElementById("quantity-2").value;
            var c1 = c * 200;
            var d = document.getElementById("quantity-3").value;
            var d1 = d * 400;
            var e = document.getElementById("quantity-4").value;
            var e1 = e * 20;
            var f = document.getElementById("quantity-5").value;
            var f1 = f * 30;
            var g = document.getElementById("quantity-6").value;
            var g1 = g * 35;
            var h = document.getElementById("quantity-7").value;
            var h1 = h * 40;
            var j = document.getElementById("quantity-8").value;
            var j1 = j * 15;
            var k = document.getElementById("quantity-9").value;
            var k1 = k * 15;
            var l = document.getElementById("quantity-10").value;
            var l1 = l * 10;
            var m = document.getElementById("quantity-11").value;
            var m1 = m * 12;

            var sum = a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1 + j1 + k1 + l1 + m1;


            document.getElementById("demo").innerHTML = sum + ".000 VND";
        }

        //Tính tiền cho buffe lẩu.
        function calBf1() {
            var x = document.getElementById("quantity-0").value;
            var t = 120 * x;
            document.getElementById("bf-1").innerHTML = 120 * x + ".000 VND";
            document.getElementById("amount-1").innerHTML = x;
            document.getElementById("price-1").innerHTML = 120 * x + ".000 VND";


        }
        function calBf2() {
            var x = document.getElementById("quantity-1").value;
            document.getElementById("bf-2").innerHTML = 150 * x + ".000 VND";
            document.getElementById("amount-2").innerHTML = x;
            document.getElementById("price-2").innerHTML = 150 * x + ".000 VND";

        }
        function calBf3() {
            var x = document.getElementById("quantity-2").value;
            document.getElementById("bf-3").innerHTML = 200 * x + ".000 VND";
            document.getElementById("amount-3").innerHTML = x;
            document.getElementById("price-3").innerHTML = 200 * x + ".000 VND";

        }
        function calBf4() {
            var x = document.getElementById("quantity-3").value;
            document.getElementById("bf-4").innerHTML = 400 * x + ".000 VND";
            document.getElementById("amount-4").innerHTML = x;
            document.getElementById("price-4").innerHTML = 400 * x + ".000 VND";

        }
        // Tính tiền cho tráng miệng.

        //Tính tiền khoai tây chiên
        function calTm1() {
            var x = document.getElementById("quantity-4").value;
            document.getElementById("tm-1").innerHTML = 20 * x + ".000 VND";
            document.getElementById("amount-5").innerHTML = x;
            document.getElementById("price-5").innerHTML = 20 * x + ".000 VND";

        }
        //Tính tiền salat rau
        function calTm2() {
            var x = document.getElementById("quantity-5").value;
            document.getElementById("tm-2").innerHTML = 30 * x + ".000 VND";
            document.getElementById("amount-6").innerHTML = x;
            document.getElementById("price-6").innerHTML = 30 * x + ".000 VND";

        }
        //Tính tiền cánh gà chiên
        function calTm3() {
            var x = document.getElementById("quantity-6").value;
            document.getElementById("tm-3").innerHTML = 35 * x + ".000 VND";
            document.getElementById("amount-7").innerHTML = x;
            document.getElementById("price-7").innerHTML = 35 * x + ".000 VND";

        }
        //Tính tiền đùi gà chiên
        function calTm4() {
            var x = document.getElementById("quantity-7").value;
            document.getElementById("tm-4").innerHTML = 40 * x + ".000 VND";
            document.getElementById("amount-13").innerHTML = x;
            document.getElementById("price-13").innerHTML = 40 * x + ".000 VND";

        }

        //Tính tiền nước uống

        //Tính tiền Beer
        function calDr1() {
            var x = document.getElementById("quantity-8").value;
            document.getElementById("dr-1").innerHTML = 15 * x + ".000 VND";
            document.getElementById("amount-8").innerHTML = x;
            document.getElementById("price-8").innerHTML = 15 * x + ".000 VND";

        }
        //Tính tiền Aquafina
        function calDr2() {
            var x = document.getElementById("quantity-9").value;
            document.getElementById("dr-2").innerHTML = 10 * x + ".000 VND";
            document.getElementById("amount-9").innerHTML = x;
            document.getElementById("price-9").innerHTML = 10 * x + ".000 VND";

        }
        //Tính tiền Cocacola
        function calDr3() {
            var x = document.getElementById("quantity-10").value;
            document.getElementById("dr-3").innerHTML = 15 * x + ".000 VND";
            document.getElementById("amount-10").innerHTML = x;
            document.getElementById("price-10").innerHTML = 15 * x + ".000 VND";

        }
        //Tính tiền Pepsi
        function calDr4() {
            var x = document.getElementById("quantity-11").value;
            document.getElementById("dr-4").innerHTML = 12 * x + ".000 VND";
            document.getElementById("amount-11").innerHTML = x;
            document.getElementById("price-11").innerHTML = 12 * x + ".000 VND";

        }


    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>