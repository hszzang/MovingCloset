<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>마이페이지 - 주문내역 :: MovingCloset</title>
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
                    <h3>주문내역</h3>
                    <p class="설명">상품의 출고지가 여러 곳이거나 온라인 물류센터 보관 장소에 따라 분리 배송될수 있습니다.
                        <br>
                        분리 배송된 상품별로 운송장이 발급되어 다른 날짜에 받으실 수 있으며, 마이페이지에서 배송조회가 가능합니다.
                    </p>
                </div>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="15%">번호</th>
                            <th width="30%">상품코드</th>
                            <th width="20%">결제가격</th>
                            <th width="20%">결제수단</th>
                            <th width="15%">주문날짜</th>
                        </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${empty buylist }">
                            <tr>
                                <td colspan="6" align="center">
                                    등록된 주문내역이 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${buylist }" var="row" varStatus="loop">
                            <tr>
                                <td width="10%">
                                    ${loop.index+1}	
                                </td>
                                <td width="30%" align="left">
                                    <a href="../movingcloset/myorder.do?b_idx=${row.b_idx }&p_code=${row.p_code}">${row.p_code }</a>
                                </td>
                                <td width="20%" align="left">${row.b_totalpay }</td>
                                <td width="20%" align="left">${row.b_payment }</td>
                                <td width="15%" align="left">${row.b_date }</td>
                            </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </div>
</body>
</html>