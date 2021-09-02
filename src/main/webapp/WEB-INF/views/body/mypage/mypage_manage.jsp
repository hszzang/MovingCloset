<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<style>
#maintain{
	padding-top: 200px;
	padding-bottom: 100px;
}

.main{
    font-size: 25px;
    font-weight: bold;
    color: black;
}

.category{
    font-weight: bold;
    font-size: 15px;
}

#jumbo{
    background-color: black;
    border-radius: 50px;
    color: white;
    opacity: 0.9;
}

.설명{
    font-size: 12px;
}

.result_title {
    text-align: center;
    border-bottom: solid 0.5px black;
    padding-bottom: 15px;
 }
 
.result{
   text-align: center;
   border-top: solid 0.5px black;
   padding-top: 25px;
 }
 
.form-group{
   font-size: 12px;
   width: 400px;
   margin-left: 30px;
 }
</style>
<body>
	<div class="container" id="maintain">
        <div class="row">
            <div class="col-lg-3">
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action main">MyPage</div>
		            <div class="list-group-item list-group-item-action profile d-flex align-content-center">
		                <i class="material-icons" style="font-size:36px; color:black">account_circle</i>&nbsp;
		                <span class="userName" ><b style="font-size:20px; color:#ff6c2f">${sessionScope.username }</b> 고객님</span>
		            </div>
		            <div class="list-group-item list-group-item-action category">쇼핑정보</div>
		            <a href="./mypage_coupon.do" class="list-group-item list-group-item-action">쿠폰함</a>
		            <a href="./mypage_order.do" class="list-group-item list-group-item-action">주문내역</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">활동정보</div>
		            <a href="./mypage_please.do" class="list-group-item list-group-item-action">쪼르기</a>
		            <a href="./mypage_zzim.do" class="list-group-item list-group-item-action">찜한상품</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">나의정보</div>
		            <a href="./mypage_manage.do" class="list-group-item list-group-item-action">회원정보관리</a>
		            <a href="./mypage_bus.do" class="list-group-item list-group-item-action">모여버스</a>
		            <a href="./mypage_out.do" class="list-group-item list-group-item-action">회원탈퇴</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">문의/리뷰</div>
		            <a href="./mypage_myqna.do" class="list-group-item list-group-item-action">문의내역</a>
		            <a href="./mypage_review.do" class="list-group-item list-group-item-action">리뷰내역</a>
		        </div>
		    </div>
            <div class="col-lg-9">
                <div class="jumbotron" id="jumbo">
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