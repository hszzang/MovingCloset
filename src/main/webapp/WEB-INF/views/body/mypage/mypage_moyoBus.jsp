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
 
 #bus{
    width: 50px;
    height: 80px;
    margin-left: 50px;
    margin-top: 5px;
    margin-bottom: 5px;
  } 
  
 .result_bus{
   border-top: solid 0.5px black;
   padding-top: 25px;
 }
 
 .bus_loc{
    background-color: whitesmoke;
    border-radius: 50px;
  }

  .bus_name{
    padding-left: 90px;
  }

  .location{
    margin-left: 90px;
  }

  .landmark{
    padding-left: 20px;
    color: #FF6C2F;
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
		            <a href="./please.do" class="list-group-item list-group-item-action">조르기</a>
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
                    <h3>모여버스</h3>
                    <p class="설명">
                        내가 신청한 버스가 어디에 위치해 있는지 보여집니다.
                    </p>
                </div>
                <div class="result_bus">
                    <div class="bus_loc">
                        <img src="../resources/images/mypage/bus.png" id="bus">
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