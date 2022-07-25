<%-- 
    Document   : rating star
    Created on : Jul 5, 2022, 5:02:11 PM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background-color: #f7f6f6;
            margin: auto;
            width: 50%;
            height: 100%;
        }

        .h{
            margin-top: 200px;
            border: 10px;
        }
        .container d-flex justify-content-center mt-5 {
            left:50%;
            right:50%;
            margin: auto;
        }

        .card{

            width: 350px;
            border: none;
            box-shadow: 5px 6px 6px 2px #e9ecef;
            border-radius: 12px;
        }

        .circle-image img{

            border: 6px solid #fff;
            border-radius: 100%;
            padding: 0px;
            top: -28px;
            position: relative;
            width: 70px;
            height: 70px;
            border-radius: 100%;
            z-index: 1;
            background: #e7d184;
            cursor: pointer;

        }


        .dot {
            height: 18px;
            width: 18px;
            background-color: blue;
            border-radius: 50%;
            display: inline-block;
            position: relative;
            border: 3px solid #fff;
            top: -48px;
            left: 186px;
            z-index: 1000;
        }

        .name{
            margin-top: -21px;
            font-size: 18px;
        }


        .fw-500{
            font-weight: 500 !important;
        }


        .start{

            color: green;
        }

        .stop{
            color: red;
        }


        .rate{

            border-bottom-right-radius: 12px;
            border-bottom-left-radius: 12px;

        }

        input.comment{
            height: 90px;
        }

        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center
        }

        .rating>input {
            display: none
        }

        .rating>label {
            position: relative;
            width: 1em;
            font-size: 30px;
            font-weight: 300;
            color: #FFD600;
            cursor: pointer
        }

        .rating>label::before {
            content: "\2605";
            position: absolute;
            opacity: 0
        }

        .rating>label:hover:before,
        .rating>label:hover~label:before {
            opacity: 1 !important
        }

        .rating>input:checked~label:before {
            opacity: 1
        }

        .rating:hover>input:checked~label:before {
            opacity: 0.4
        }


        .buttons{
            top: 36px;
            position: relative;
        }


        .rating-submit{
            border-radius: 15px;
            color: #fff;
            height: 49px;
        }


        .rating-submit:hover{

            color: #fff;
        }
    </style>
    <body>
        <% if(session.getAttribute("account") == null){ 
            request.getRequestDispatcher("login").forward(request, response);%>
            <%}else{%>
        <div class="h" >
            <h1>Xin vui lòng đánh giá dịch vụ</h1>
            <p></p>

            <form action="rate" method="POST" >
                <a>Số điện thoại:</a>
                <input type="text" name ="cphone" >
                <a>Chọn mã bàn:</a>
                <select name="tid" >
                    <c:forEach items="${sessionScope.listTable}" var="t">
                        <option>${t.id}</option>
                    </c:forEach>
                </select>
                <p></p>
                <h5>Đánh giá sao</h5>
                <div class="rate bg-success py-3 text-white mt-3" style="border-bottom: 3px">
                    <div class="rating">                    
                        <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> 
                        <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                        <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> 
                        <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> 
                        <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>                  
                    </div>


                    <% if (request.getAttribute("messRate") != null) { %>
                    <p style="color: red">${requestScope.messRate}</p>
                    <%} else {%>
                    <%}%> 



                </div>
                <h5>Nội dung</h5>
                <div style="margin-top: 20px">
                    <input style="width: 740px" class="comment " type="text" name ="comment" maxlength="450" size="100"><br/>
                </div>
                <div style="margin-top: 20px; margin-left: 220px">
                    <button style="width: 120px " type="submit" class="btn btn-dark">Đánh giá</button>
                    <a style="width: 120px" class="btn btn-dark" href="home_employee">Quay lại</a>
                </div>
            </form>

        </div>
                    <%}%>
    </body>
</html>



