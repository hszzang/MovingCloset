<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/bootstrap.css" />
	<script src="../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
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
                <div class="jumbotron" id="title">
                    <h3>모여버스</h3>
                    <p class="설명">
                        내가 신청한 버스가 어디에 위치해 있는지 보여집니다.
                    </p>
                </div>
                <div class="result_bus">
                    <div class="bus_loc">
                        <img src="/img/bus.png" id="bus">
                        <span class="bus_name">
                            01번 버스 가는중..
                        </span>
                        <span class="location">
                            서울특별시 강남구 테헤란로 538
                        </span>
                        <span class="landmark">
                            삼성역 2호선
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>