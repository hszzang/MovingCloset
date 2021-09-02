<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>마이페이지 - 모여버스 :: MovingCloset</title>
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
 
 .busImg{
    width: 50px;
    height: 80px;
    margin-left: 50px;
    margin-top: 4%;
  } 
  
 .result_bus{
   border-top: solid 0.5px black;
   padding-top: 25px;
 }
 
 .bus_loc{
    background-color: whitesmoke;
    border-radius: 50px;
    height: 150px; width: 100%;	
    margin-top:10px;
    vertical-align: middle;	
    display: inline-flex;
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
  
  .moyoInfo {
  	align-self: center; margin-left: 6%;
  }
  
  .moyoInfo_title { font-weight: bold; font-size: 1.1em; }
  .moyoInfo_detail { font-size: 0.8em; }
  
  .moyoBusInfo {
  	margin-left: 11%;
  	align-self: center; text-align: center;
  }
  
  .moyoBusInfo_X {
  	width: 100%; margin-left: 12%;
  }
  .moyoBusInfo_update {
  	font-size: 0.8em;
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
                    <h3>모여버스</h3>
                    <p class="설명">
                        내가 신청한 버스가 어디에 위치해 있는지 보여집니다.
                    </p>
                </div>
                <div class="result_bus">
                <c:forEach items="${moyoUseList }" var="list">
                	<div class="bus_loc">
                        <img src="../resources/images/mypage/bus.png" class="busImg">
                        <div class="moyoInfo">
                        <c:forEach items="${moyoList }" var="moyoinfo">
                        	<c:if test="${list.m_idx eq moyoinfo.key }">
                        		<span class="moyoInfo_title">${moyoinfo.value.m_name }</span><br/>
                        		
		                        <fmt:parseDate value="${moyoinfo.value.m_dday }" var="m_dday" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${m_dday }" var="m_dday" pattern="yyyy-MM-dd" />
								<span class="moyoInfo_detail">
	                        	모여 DAY : ${m_dday }
	                        	<c:if test="${moyoinfo.value.m_status eq '진행' }">
	                        		(모집중)
	                        	</c:if>
	                        	<c:if test="${moyoinfo.value.m_status eq '실패' }">
	                        		(진행실패)
	                        	</c:if>
	                        	<br/>
	                        	${moyoinfo.value.m_addr }<br/>
	                        	</span>
                        	</c:if>
                        </c:forEach>
                        </div>
                        <div class="moyoBusInfo">
                        <c:set var="forLoop" value="false" />
                       	<c:forEach items="${moyoBusList }" var="moyobus">
                       		<c:if test="${not forLoop }">
	                        	<c:if test="${list.m_idx eq moyobus.key }">
		                        	<c:if test="${empty moyobus.value }">
		                        		<div class="moyoBusInfo_X">아직 버스가 배정되지 않았습니다.</div>
		                        		<c:set var="forLoop" value="true" />
		                        	</c:if>
		                        	<c:if test="${not empty moyobus.value }">
		                        		${moyobus.value.mb_num } 버스 <b>${moyobus.value.mb_status }</b> <br/>
		                        		${moyobus.value.mb_addr } <br/>
		                        		<span class="moyoBusInfo_update">( 최종업데이트 : ${moyobus.value.mb_lastupdate } )</span>
		                        	</c:if>
	                        	</c:if>
                       		</c:if>
                        </c:forEach>
                        </div>
<!--                         <span class="bus_name"> -->
<!--                             01번 버스 가는중.. -->
<!--                         </span> -->
<!--                         <span class="location"> -->
<!--                             서울특별시 강남구 테헤란로 538 -->
<!--                         </span> -->
<!--                         <span class="landmark"> -->
<!--                             삼성역 2호선 -->
<!--                         </span> -->
                    </div>
                </c:forEach>
                <c:if test="${empty moyoUseList }">
                	신청한 모여가 없습니다!
                </c:if>
<!--                     <div class="bus_loc"> -->
<!--                         <img src="../resources/images/mypage/bus.png" id="bus"> -->
<!--                         <span class="bus_name"> -->
<!--                             01번 버스 가는중.. -->
<!--                         </span> -->
<!--                         <span class="location"> -->
<!--                             서울특별시 강남구 테헤란로 538 -->
<!--                         </span> -->
<!--                         <span class="landmark"> -->
<!--                             삼성역 2호선 -->
<!--                         </span> -->
<!--                     </div> -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>