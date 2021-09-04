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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                
                <form action="" name="MypageReviewlist" method="POST"  enctype="multipart/form-data">
				<input type="hidden" name="ofileCheck" /> 
				<table class="table table-hover" style="text-align: center;">
					<thead>
					<tr>
						<th style="width: 18%;">평점&nbsp;
							<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>
							<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>
							<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>
							<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>
							<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>
						</th>
						<th style="width: 35%;">한줄평</th>
						<th style="width: 15%;">작성일</th>
						<th style="width: 15%;">작성자</th>				
						<th style="width: 35%;">사진</th>
						<!-- <th style="width: 20%;"></th> -->
					</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${mypageReview }" var="mypageReview" >
						<tr >
							<td>
							평점 <!-- 평점 수정했습니다!------>&nbsp;
								<c:forEach begin="1" end="${mypageReview.r_rate }" step="1">
									<i class="fa fa-star" style="color:#FF6C2F; font-size:8pt;"></i>					
								</c:forEach>
							</td>
							
							<td>
								<a class="r_content" id="rid${mypageReview.r_idx }" href="./store/detail.do">
									${mypageReview.r_content }
								</a>
		
							</td>
							
							
							<td>${mypageReview.r_date }</td>
							<td>
								${mypageReview.userid }
								<%-- <input type="hidden" name="r_idx" value="${review.r_idx }"/> --%>
								<input type="hidden" name="p_code" value="${mypageReview.p_code }"/>
								<input type="hidden" name="p_idx" value="${storeDetail.p_idx }"/>
							</td>
							<td>
							<div id="photo${mypageReview.r_idx }">
								<c:choose>  
									<c:when test="${mypageReview.r_sfile eq null }">
									</c:when>
									<c:otherwise>
										<img class="myImg" id="r_image${mypageReview.r_idx }" name="ofile" src="../resources/upload/${review.r_sfile }" alt="상품이미지"
										style="width: 100px; height: auto;"/>	
															
									</c:otherwise>
								</c:choose>
							</div>
							</td>
							<%-- <td>
								<div id="btnDiv${mypageReview.r_idx }">  
								<c:if test="${sessionScope.siteUserInfo != null && siteUserInfo eq mypageReview.userid }">
									<button type="button" class="btnstyle" onclick="rUpdate(${mypageReview.r_idx});">수정</button>
									<button type="button" class="delBtn" onclick="delReview(${mypageReview.r_idx}, ${storeDetail.p_idx });">삭제</button>
								</c:if>
								</div>					
							</td> --%>
						</tr>
						
					</c:forEach>
					</tbody>
				</table>
				
				</form>
            </div>
        </div>
    </div>
</body>
</html>