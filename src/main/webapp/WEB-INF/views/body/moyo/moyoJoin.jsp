<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모여! 신청 완료 :: MovingCloset</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>

.container {
	margin-top: 95px;
	margin-bottom: 30px;
}
.input-form-background {
padding-top: 0px; padding-bottom: 50px; 

}

.input-form-wrap {
	width: 80%; height: 90%;
}

.input-form {
margin-bottom: 15px;
padding-bottom: 80px;
justify-content: center;
display: flex;
align-items: center;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}


#moyoFrm {
	margin: 4% 7%; width: 70%;
}

#moyoFrm *:not(input, select){
	border: 0;
}

.productImg {
	width: 400px; height: 400px;
	border: 1px solid lightgray;
	border-radius: 3px;
}



#moyoInfo {
	margin: 5% 0;
	margin-left: 5%;
}

#moyoInfo h3 {
	margin-bottom: 20px; font-weight: bold;
}

#moyoInfo h6 {
	font-weight: bold;
}

.input-form-wrap h3 {
	margin-top: 20px; 
}
#moyoInfoWrap {
	display: flex; align-items: center;
	margin-top: -10px;
}

#moyoFrm .form-control:focus, #moyoSubmitBtn:focus, #moyoAgree .form-control:focus{
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#moyoSubmitBtn {
	background-color: white;
	color: #ff6c2f;
	border: #ff6c2f 1px solid;
}

.custom-control-input:checked ~ .custom-control-label::before {
    border-color: #ff6c2f !important;
    background-color: #ff6c2f !important;
}

.custom-control-input:focus ~ 
          .custom-control-label::before {
	border-color: #ff6c2f !important;
	box-shadow: 0 0 0 0rem rgba(0, 0, 0, 0) !important;
}

.section-title {
  text-align: center;
  padding-bottom: 30px; padding-top: 50px;
}

.section-title h2 {
  font-size: 32px;
  font-weight: bold;
  text-transform: uppercase;
  margin-bottom: 20px;
  padding-bottom: 20px;
  position: relative;
}

.section-title h2::after {
  content: '';
  position: absolute;
  display: block;
  width: 50px;
  height: 3px;
  background: #555555;
  bottom: 0;
  left: calc(50% - 25px);
}
 

</style>
</head>
<body>

	<div class="container">
		<div class="section-title">
		    <h2>모 여 신 청 완 료</h2>
	    </div>
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
				
					<h3>신청한 모여 정보</h3>
					
					<div id="moyoInfoWrap">
						<c:if test="${empty moyoDTO.m_sfile }">
							<img class="productImg" src="../resources/images/list/${moyoDTO.m_idx }.jpg">
						</c:if>
						<c:if test="${not empty moyoDTO.m_sfile }">
							<img class="productImg" src="../resources/upload/${moyoDTO.m_sfile }">
						</c:if>
						
						<fmt:parseDate value="${moyoDTO.m_start }" var="strmstart" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${strmstart }" var="frmmstart" pattern="yyyy. MM. dd"/>
						<fmt:parseDate value="${moyoDTO.m_end }" var="strmend" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${strmend }" var="frmmend" pattern="yyyy. MM. dd"/>
						<fmt:parseDate value="${moyoDTO.m_dday }" var="strmdday" pattern="yyyy-MM-dd HH:mm:ss"/>
						
						<div id="moyoInfo">
							<h3>${moyoDTO.m_name }</h3>
							<h6>모집기간</h6> ${frmmstart } - ${frmmend } <br />&mdash;
							<h6>모임일자</h6> <fmt:formatDate value="${strmdday }" pattern="yyyy년 MM월 dd일 E요일"/> <br />&mdash;
							<h6>모일장소</h6> ${moyoDTO.m_addr } <br />&mdash;
							<h6>판매자 공지사항</h6> ${moyoDTO.m_desc }  <br />
						</div>
					</div>
					
					<hr class="mt-4 mb-5">
					
					<h3>신청자 정보</h3>
						<table class="table table-bordered">
							<colgroup>
								<col width="20%"/>
								<col width="*"/>
							</colgroup>
							<tbody>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">이름</td>
									<td>
										${moyoUseDTO.mu_name }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">전화번호</td>
									<td class="form-inline">
										${moyoUseDTO.mu_phone }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">이메일&nbsp;&nbsp;&nbsp;</td>
									<td class="form-inline">
										${moyoUseDTO.mu_email }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">방문예정시간</td>
									<td class="form-inline">
										${moyoUseDTO.mu_time }
									</td>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-primary btn-lg btn-block" id="moyoSubmitBtn"
							type="button" onclick="javascript:location.href='../movingcloset/moyo.do';" >모여 리스트로 돌아가기</button>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>


