<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지01</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mypage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item main">My Page</li>
                    <li class="list-group-item profile">
                        <i class="material-icons" style="font-size:36px">account_circle</i>
                    </li>
                    <li class="list-group-item category">쇼핑정보</li>
                    <a href="mypage_coupon.jsp" class="list-group-item list-group-item-action">쿠폰함</a>
                    <a href="mypage_order.jsp" class="list-group-item list-group-item-action">주문내역</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">활동정보</li>
                    <a href="mypage_please.jsp" class="list-group-item list-group-item-action">조르기</a>
                    <a href="mypage_zzim.jsp" class="list-group-item list-group-item-action">찜한상품</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">나의정보</li>
                    <a href="mypage_manage.jsp" class="list-group-item list-group-item-action">회원정보관리</a>
                    <a href="mypage_moyoBus.jsp" class="list-group-item list-group-item-action">모여버스</a>
                    <a href="mypage_out.jsp" class="list-group-item list-group-item-action">회원탈퇴</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">문의/리뷰</li>
                    <a href="mypage_myqna.jsp" class="list-group-item list-group-item-action">문의내역</a>
                    <a href="mypage_review.jsp" class="list-group-item list-group-item-action">리뷰내역</a>
                </ul>
            </div>
            <div class="col-lg-9">
                <div class="jumbotron">
                    <h3>찜한상품</h3>
                    <p class="설명">
                        찜한 상품이 보여집니다.
                    </p>
                </div>
                <div class="result">
                    <h6>등록된 상품이 없습니다.</h6>
                </div>
            </div>
        </div>
    </div>








</body>
</html>