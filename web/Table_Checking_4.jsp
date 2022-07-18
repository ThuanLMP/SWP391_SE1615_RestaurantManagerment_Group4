<%-- 
    Document   : ListOrders
    Created on : Jun 6, 2022, 3:14:03 PM
    Author     : ITACHI
--%>

<%@page import="Model.Order"%>
<%@page import="Model.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>Table_4</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <%
            ArrayList<Table> tables = (ArrayList<Table>) session.getAttribute("tables");
        %>
    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <div class="container">
            <div>
                <form action="order" method="GET">
                    <button type="submit" class="btn btn-info">Quay lại Order</button>
                </form>

            </div>

            <div class="ml-5">
                <h1 class="mt-4">List Table</h1>
                <form action="../home/table_checking" method="POST">
                    <div class="table">
                        <select name="table" class="select-table">
                            <option value="4">Bàn 4 người</option>
                            <option value="6">Bàn 6 người</option>
                            <option value="10">Bàn 10 người</option>
                        </select>
                        <input type="submit" value="Tìm kiếm"/>
                    </div>
                </form>

            </div>
            <div class="row mb-3">
                
                <div class="mt-5 content-1 mr-4">

                    <div class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Basic Plan -->

                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 1
                                </h4>

                            </div>

                            <div class="col-12 col-md-4">

                                <p>ID:S01</p>
                                <%
                                    int check01 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S01") && t.isStatus() == false) {
                                            check01 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check01 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>




                            </div>

                            <div class="col-12 col-md-4 text-center edit">
                                  <%
                                    int check011 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S01") && t.isStatus() == false) {
                                            check011 = 1;
                                %>

                                <form action="../editOrder" method="GET">
                                    <input name="id" value="S01" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S01" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check011 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>


                            </div>

                        </div>

                    </div>



                    <div class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Pro Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 2
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S02</p>
                                <%
                                    int check02 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S02") && t.isStatus() == false) {
                                            check02 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check02 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">

                                <%
                                    int check021 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S02") && t.isStatus() == false) {
                                            check021 = 1;
                                %>

                                <form action="../editOrder" method="GET">
                                    <input name="id" value="S02" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                 <form action="../payment" method="GET">
                                    <input name="id" value="S02" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>


                                <% }
                                    }
                                    if (check021 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>

                            </div>
                        </div>

                    </div>



                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 3
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S03</p>
                                <%
                                    int check03 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S03") && t.isStatus() == false) {
                                            check03 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check03 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <%
                                    int check031 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S03") && t.isStatus() == false) {
                                            check031 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S03" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S03" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check031 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>

                            </div>
                        </div>
                    </div>

                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 4
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S04</p>
                                <%
                                    int check04 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S04") && t.isStatus() == false) {
                                            check04 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check04 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <%
                                    int check041 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S04") && t.isStatus() == false) {
                                            check041 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S04" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S04" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check041 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 5
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S05</p>
                                <%
                                    int check05 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S05") && t.isStatus() == false) {
                                            check05 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check05 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                               <%
                                    int check051 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S05") && t.isStatus() == false) {
                                            check051 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S05" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                 <form action="../payment" method="GET">
                                    <input name="id" value="S05" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check051 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="mt-5 content-1">
                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Basic Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 6
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S06</p>
                                <%
                                    int check06 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S06") && t.isStatus() == false) {
                                            check06 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check06 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                               <%
                                    int check061 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S06") && t.isStatus() == false) {
                                            check061 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S06" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S06" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check061 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>

                    </div>



                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Pro Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 7
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S07</p>
                                <%
                                    int check07 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S07") && t.isStatus() == false) {
                                            check07 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check07 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                               <%
                                    int check071 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S07") && t.isStatus() == false) {
                                            check071 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S07" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S07" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check071 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>

                    </div>



                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 8
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S08</p>
                                <%
                                    int check08 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S08") && t.isStatus() == false) {
                                            check08 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check08 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <%
                                    int check081 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S08") && t.isStatus() == false) {
                                            check081 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S08" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                 <form action="../payment" method="GET">
                                    <input name="id" value="S08" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check081 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 9
                                </h4>
                            </div>
                            <div class="col-12 col-md-4">
                                <p>ID:S09</p>
                                <%
                                    int check09 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S09") && t.isStatus() == false) {
                                            check09 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check09 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% } %>

                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <%
                                    int check091 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S09") && t.isStatus() == false) {
                                            check091 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S09" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                 <form action="../payment" method="GET">
                                    <input name="id" value="S09" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check091 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div
                        class="d-style btn btn-brc-tp border-2 bgc-white btn-outline-blue btn-h-outline-blue btn-a-outline-blue w-100 my-2 py-3 shadow-sm">
                        <!-- Premium Plan -->
                        <div class="row align-items-center">
                            <div class="col-12 col-md-4">
                                <h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
                                    Bàn 10
                                </h4>
                            </div>

                            <div class="col-12 col-md-4">
                                <p>ID:S10</p>
                                <%
                                    int check10 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S10") && t.isStatus() == false) {
                                            check10 = 1;
                                %>

                                <p>Hoạt động</p>

                                <% }
                                    }
                                    if (check10 == 0) { %>
                                <p>Trạng thái: Trống</p>
                                <% }%>

                            </div>

                            <div class="col-12 col-md-4 text-center">
                                <%
                                    int check101 = 0;
                                    for (Table t : tables) {
                                        if (t.getId().equals("S10") && t.isStatus() == false) {
                                            check101 = 1;
                                %>

                                  <form action="../editOrder" method="GET">
                                    <input name="id" value="S10" type="hidden"/>
                                    <input type="submit" value="Chỉnh sửa" class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1" />
                                </form>

                                <form action="../payment" method="GET">
                                    <input name="id" value="S10" type="hidden"/>
                                    <input class="f-n-hover btn btn-warning btn-raised px-4 py-25 w-100 text-600" type="submit" value="Thanh toán" />
                                </form>

                                <% }
                                    }
                                    if (check101 == 0) { %>
                                <a href="../editOrder"
                                   class="f-n-hover btn btn-success btn-raised px-4 py-25 w-100 text-600 mb-1">Booking
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <style type="text/css">
            body {
                margin-top: 20px;
                background-color: #e4e6e9;
                color: #41464d;
            }

            .btn:not(:disabled):not(.disabled) {
                cursor: pointer;
            }


            .btn-a-brc-tp:not(.disabled):not(:disabled).active,
            .btn-brc-tp,
            .btn-brc-tp:focus:not(:hover):not(:active):not(.active):not(.dropdown-toggle),
            .btn-h-brc-tp:hover,
            .btn.btn-f-brc-tp:focus,
            .btn.btn-h-brc-tp:hover {
                border-color: transparent;
            }

            .btn-outline-blue {
                color: #0d6ce1;
                border-color: #5a9beb;
                background-color: transparent;
            }

            .select-table {
                width: 200px;
                height: 30px;
                margin: 10px;
                border-radius: 5px;
            }

            .btn {
                cursor: pointer;
                position: relative;
                z-index: auto;
                border-radius: .175rem;
                transition: color .15s, background-color .15s, border-color .15s, box-shadow .15s, opacity .15s;
            }

            .border-2 {
                border-width: 2px !important;
                border-style: solid !important;
                border-color: transparent;
            }

            .bgc-white {
                background-color: #fff !important;
            }


            .text-green-d1 {
                color: #277b5d !important;
            }

            .letter-spacing {
                letter-spacing: .5px !important;
            }

            .font-bolder,
            .text-600 {
                font-weight: 600 !important;
            }

            .text-170 {
                font-size: 1.7em !important;
            }

            .text-purple-d1 {
                color: #6d62b5 !important;
            }

            .text-primary-d1 {
                color: #276ab4 !important;
            }

            .text-secondary-d1 {
                color: #5f718b !important;
            }

            .text-180 {
                font-size: 1.8em !important;
            }

            .text-150 {
                font-size: 1.5em !important;
            }

            .text-danger-m3 {
                color: #e05858 !important;
            }

            .rotate-45 {
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
            }

            .position-l {
                left: 0;
            }

            .position-b,
            .position-bc,
            .position-bl,
            .position-br,
            .position-center,
            .position-l,
            .position-lc,
            .position-r,
            .position-rc,
            .position-t,
            .position-tc,
            .position-tl,
            .position-tr {
                position: absolute !important;
                display: block;
            }

            .mt-n475,
            .my-n475 {
                margin-top: -2.5rem !important;
            }

            .ml-35,
            .mx-35 {
                margin-left: 1.25rem !important;
            }

            .text-dark-l1 {
                color: #56585e !important;
            }

            .text-90 {
                font-size: .9em !important;
            }

            .text-left {
                text-align: left !important;
            }

            .mt-25,
            .my-25 {
                margin-top: .75rem !important;
            }

            .text-110 {
                font-size: 1.1em !important;
            }

            .deleted-text {
                text-decoration: line-through;
                ;
            }

            .content-1 {
                width: 48%;
            }
        </style>

        <script type="text/javascript">

        </script>
    </body>

</html>