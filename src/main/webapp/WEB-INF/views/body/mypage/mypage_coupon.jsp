<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 쿠폰함 :: MovingCloset</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		            <a href="./coupon.do" class="list-group-item list-group-item-action">쿠폰함</a>
		            <a href="./order.do" class="list-group-item list-group-item-action">주문내역</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">활동정보</div>
		            <a href="./please.do" class="list-group-item list-group-item-action">쪼르기</a>
		            <a href="./zzim.do" class="list-group-item list-group-item-action">찜한상품</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">나의정보</div>
		            <a href="./manage.do" class="list-group-item list-group-item-action">회원정보관리</a>
		            <a href="./bus.do" class="list-group-item list-group-item-action">모여버스</a>
		            <a href="./out.do" class="list-group-item list-group-item-action">회원탈퇴</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">문의/리뷰</div>
		            <a href="./myqna.do" class="list-group-item list-group-item-action">문의내역</a>
		            <a href="./review.do" class="list-group-item list-group-item-action">리뷰내역</a>
		        </div>
		    </div>
	        <div class="col-lg-9">
	            <div class="jumbotron" id="jumbo">
	                <h3>쿠폰함</h3>
	                <br>
	                <h6>-쿠폰사용안내-</h6>
	                <p class="설명">
	                    쿠폰 유효기간 이내에만 사용이 가능합니다.
	                    <br>
	                    타 쿠폰과 중복 사용이 불가할 수 있습니다.
	                    <br>
	                    구매 시 사용한 쿠폰은 반품 시 반환되지 않습니다.
	                    <br>
	                    이 외 상세 쿠폰 사용 안내 사항은 [자세히보기]를 확인하세요.
	                        
	                </p>
	            </div>
	            <div class="result_title" >
	                <h4>쿠폰보유현황</h4>
	            </div>
	            <div class="result">
	                <p>조르기한 상품이 없습니다.</p>
	            </div>
	        </div>
		</div>
    </div>

</body>
</html>