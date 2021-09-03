<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 리뷰내역 :: MovingCloset</title>
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
                    <h3>리뷰내역</h3>
                    <p class="설명">
                        상품에 리뷰한 내역이 보여집니다.
                    </p>
                </div>
                <table class="table">
                    <tr>
                        <td align="center">
                            <select name="searchField">
                                <option value="date">기간별</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div id="noticeTable" style="width:100%; height:auto;">
		    
			    	<form method="post" action="notiList">
			    		<input type="hidden" name="noti_idx" value="${notice.noti_idx }"/> 
				    	<div id="Notice" class="tabcontent">
						    <table class="col-100 col">
						        <colgroup>
						            <col width="15%">
						            <col width="70%" >
						            <col width="15%">
						        </colgroup>
						        <thead>
						            <tr>
						                <th>번호</th>
						                <th style="text-align:left;">제목</th>
						                <th>등록일</th>
						            </tr>
						        </thead>
						        <c:forEach items="${notiList }" var="notice">
						        <input type="hidden" name="noti_idx" value="${notice.noti_idx }"/>
						        <tbody>
						            <tr>
						                <td>${notice.noti_idx }</td>
						                <td style="text-align:left;">
						                    <a href='<c:url value='/movingcloset/noticedetail.do?noti_idx=${notice.noti_idx }'/>' style="text-decoration:none;color:black;">
						                        ${notice.noti_title }</a></td>
						                <td><fmt:formatDate value="${notice.noti_postdate}" pattern="yyyy-MM-dd" /></td>
						            </tr>
						            
						        </tbody>
						        </c:forEach>
						    </table>
						</div>
					</form>
    			</div>
            </div>
        </div>
    </div>
</body>
</html>