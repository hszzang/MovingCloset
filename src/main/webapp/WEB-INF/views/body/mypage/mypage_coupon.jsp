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
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th width="7%">번호</th>
                            <th width="15%">쿠폰</th>
                            <th width="10%">브랜드</th>
                            <th width="13%">쿠폰명</th>
                            <th width="15%">쿠폰코드</th>
                            <th width="10%">할인율</th>
                            <th width="15%">시작/종료일</th>
                            <th width="15%">쿠폰내용</th>
                        </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${empty couponlist }">
                            <tr>
                                <td colspan="6" align="center">
                                    다운로드한 쿠폰이 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${couponlist }" var="row" varStatus="loop">
                            <tr>
                                <td width="7%">
                                    ${loop.index+1}	
                                </td>
                                <td width="15%">
                                	<img src="../resources/upload/${row.cou_sfile }" alt="상품사진" style="width:50px;" />	
                                </td>
                                <td width="10%" align="left">${row.cou_brand }</td>
                                <td width="13%" align="left">${row.cou_name }</td>
                                <td width="15%" align="left">${row.cou_code }</td>
                                <td width="10%" align="left">${row.cou_per }%</td>
                                <td width="15%" align="left">${row.cou_start} ~ ${row.cou_end}</td>
                                <td width="15%" align="left">${row.cou_content }</td>
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