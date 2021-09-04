<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 쪼르기 :: MovingCloset</title>
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
 
.result {
  
   border-top: solid 0.5px black;
   padding-top: 25px;
 }
 
  .busImg{
    width: 120px;
    height: 120px;
    margin-left: 50px;
    margin-top: 2%;
    object-fit: cover;
    border: 0.5px solid lightgray;
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
  	align-self: center; margin-left: 4%; width:35%;
  }
  
  .moyoInfo_title { font-weight: bold; font-size: 1.2em; }
  .moyoInfo_detail { font-size: 0.9em; }
  
  .moyoBusInfo {
  	width:45%;
  	margin-left: 11%;
  	align-self: center; text-align: center;
  }
  
  .moyoBusInfo_X {
  	width: 100%; margin-left: 12%; text-align: center;
  }
  .moyoBusInfo_update {
  	font-size: 0.8em;
  }
  
  .plzStatus {
  	font-weight: bold; color:#FF6C2F; font-size: 1.3em
  }
  
  .userOption {
  	align-self: center; width:15%; text-align: right;
  	color: black; cursor: pointer; margin-right:5px; 
  }
  
  .userOption i {
  	color:black; cursor: pointer; 
  }
  
</style>
<script type="text/javascript">

function plzDelete(idx) {
	var confirmCheck = confirm("해당 상품에 대한 쪼르기 신청을 취소하시겠습니까?");
	if(confirmCheck == true) {
		alert("신청이 취소되었습니다.");
		location.href='../movingcloset/myPagePlzDelete.do?plz_idx='+idx;
	}
}

</script>
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
                    <h3>쪼르기</h3>
                    <p class="설명">
                        쪼르기한 상품이 보여집니다.
                    </p>
                </div>
                <div class="result">
                <c:forEach items="${myPlzProduct }" var="plzProduct" varStatus="plzLoop">
                	<div class="bus_loc">
                        <img src="../resources/upload/${plzProduct.p_sfile }" class="busImg">
                        <div class="moyoInfo">
								<span class="moyoInfo_detail">
	                        	${plzProduct.p_brand }<br/>
	                        	</span>
                        		<span class="moyoInfo_title">
                        			${plzProduct.p_name } ${plzProduct.p_code }
	                        		<br/>${plzProduct.p_price } 원
                        		</span><br/>
                        		
                        </div>
                        <div class="moyoBusInfo">
                        	<c:if test="${myPlzList[plzLoop.index].plz_status eq '진행' }">
		                        <fmt:parseDate value="${myPlzList[plzLoop.index].plz_end }" var="m_dday" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${m_dday }" var="m_dday" pattern="yyyy-MM-dd" />
                        		<span class="plzStatus">모집중</span><br/>
                        		( ${m_dday} 마감 )
                        	</c:if>
                        	<c:if test="${myPlzList[plzLoop.index].plz_status eq '성공' }">
		                        <fmt:parseDate value="${myPlzList[plzLoop.index].plz_end }" var="m_dday" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${m_dday }" var="m_dday" pattern="yyyy-MM-dd" />
                        		<span class="plzStatus">성공!</span><br/>
                        		( ${m_dday} 마감 )
                        	</c:if>
                        	<c:if test="${myPlzList[plzLoop.index].plz_status eq '실패' }">
		                        <fmt:parseDate value="${myPlzList[plzLoop.index].plz_end }" var="m_dday" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${m_dday }" var="m_dday" pattern="yyyy-MM-dd" />
                        		<span class="plzStatus" style="color:gray;">실패</span><br/>
                        		( ${m_dday} 마감 )
                        	</c:if>
<!--                        		<div class="moyoBusInfo_X">아직 버스가 배정되지 않았습니다.</div> -->
                        </div>
                        <div class="userOption">
	                        <a class="dropdown" data-toggle="dropdown"><i id="dropDown" class="material-icons">more_vert</i></a>
							<div class="dropdown-menu dropdown-menu-right" >
<!-- 								<a onclick="commentEdit();" class="dropdown-item" >수정</a> -->
								<a class="dropdown-item" 
									onclick="plzDelete(${myPlzList[plzLoop.index].plz_idx });">신청 취소</a>
							</div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty myPlzProduct }">
                	신청한 쪼르기가 없습니다!
                </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>