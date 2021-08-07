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
                <div class="jumbotron">
                    <h3>회원정보수정</h3>
                    <p class="설명">
                        회원님의 정보를 수정합니다.
                    </p>
                </div>
                <div class="container">
                    <form action="">
                        <div class="form-group">
                            <label for="usr">아이디</label>
                            <input type="text" class="form-control" id="usr">
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" id="pwd">
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label for="phone">전화번호</label>
                            <input type="text" class="form-control" id="phone">
                        </div>
                        <br>
                        <div class="form-group">
                            <button type="button" class="btn btn-outline-dark">수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>