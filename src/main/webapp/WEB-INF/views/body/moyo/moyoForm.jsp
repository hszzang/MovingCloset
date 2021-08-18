<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
padding-bottom: 40px;
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

#moyoAgree {
	margin: 5%; margin-bottom: 8%;
}

#moyoFrm .form-control:focus, #moyoSubmitBtn:focus, #moyoAgree .form-control:focus{
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#moyoSubmitBtn {
	background-color: #ff6c2f; color: white;
	border: 0;
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

<script type="text/javascript">

	function moyoFormCheck() {
		var checkSubmit = confirm("작성된 정보로 모여를 신청합니다.");
		if(checkSubmit == true) {
			document.moyoFrm.submit();
		}
	}
	
	function emailSelect(obj) {
        var emailAdd = document.moyoFrm.email2;
        emailAdd.value = obj.value;

        if(emailAdd.value == "") {
            /*
            select에서 직접입력을 선택하면
            readOnly속성을 비활성화하고, 입력된 내용을 비워준다.
            */
            emailAdd.readOnly = false;
        }
        else {
            /*
            특정 도메인을 선택하면 
            선택한 도메인을 입력하고, readOnly속성은 활성화한다.
            */
            emailAdd.readOnly = true;
        }
    }

    function phoneFocus(num, obj, nextObj){
        var nextobj = document.getElementsByName(nextObj)[0];
        if(obj.value.length >= num) {
            nextobj.focus();
        }
    }

</script>

</head>
<body>

	<div class="container">
		<div class="section-title">
		    <h2>모 여 !</h2>
	    </div>
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
				
					<h3>신청할 모여 정보</h3>
					
					<div id="moyoInfoWrap">
						<c:if test="${empty moyoDTO.m_sfile }">
							<img class="productImg" src="../resources/images/list/${moyoDTO.m_idx }.jpg">
						</c:if>
						<c:if test="${not empty moyoDTO.m_sfile }">
							<img class="productImg" src="../resources/images/list/${moyoDTO.m_sfile }.jpg">
						</c:if>
<!-- 						<img class="productImg" src="../resources/images/list/2.jpg"> -->
						
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
<!-- 							<h3>컨버스 팝업스토어 in 가산</h3> -->
<!-- 							<h6>모집기간</h6> 2021.08.01 - 2021.08.03 <br />&mdash; -->
<!-- 							<h6>모임일자</h6> 2021년 08월 05일 목요일 <br />&mdash; -->
<!-- 							<h6>모일장소</h6> 서울시 금천구 가산동 426-5 월드메르디앙 앞 <br />&mdash; -->
<!-- 							<h6>판매자 공지사항</h6> 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다. 안녕하세요 나이키입니다.  <br /> -->
					</div>
				</div>
			</div>
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
					<h3>신청자 정보</h3>
					<form name="moyoFrm" id="moyoFrm" action="../movingcloset/moyoJoin.do" method="post" > 
						<input type="hidden" value="${moyoDTO.m_idx }" name="m_idx">
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
										<input type="text" name="username" class="form-control" style="width: 230px;" required/>
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">전화번호</td>
									<td class="form-inline">
										<select name="mobile1" class="form-control" 
										onchange="phoneFocus(3, this, 'mobile2');" style="width:80px;" required>
<!-- 											<option value=" "> </option> -->
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile2" value="" 
										maxlength="4" onkeyup="phoneFocus(4, this, 'mobile3');" style="width:100px;" required/>
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile3"  value="" 
										maxlength="4" style="width:100px;" required/>
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">이메일&nbsp;&nbsp;&nbsp;</td>
										<td class="form-inline">
										<input type="text" class="form-control" name="email1" value="" style="width:30%;" required />
										&nbsp;@&nbsp;
										<input type="text" class="form-control" name="email2" value="" style="width:30%;" required/>&nbsp;&nbsp;
										<select name="email_domain" class="form-control" onchange="emailSelect(this);" style="width:25%;">
											<option value="">- 직접입력 -</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gmail.com">gmail.com</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">방문예정시간</td>
									<td class="form-inline">
										<input type="number" name="moyoHour" class="form-control" min="10" max="22" value="10" /> &nbsp;시&nbsp;&nbsp;
										<input type="number" name="moyoMinute" class="form-control" min="0" max="50" value="00" step="10" /> &nbsp;분
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
					<hr class="mt-4 mb-5">

					<h3>약관동의</h3>

					<div id="moyoAgree">
						<textarea rows="6" name="content" class="form-control" style="resize:none;"
							placeholder="개인정보수집약관" readonly></textarea>
						<div class="custom-control custom-checkbox mb-4 mt-2">
							<input type="checkbox" class="custom-control-input" id="personalAgree" required> 
							<label class="custom-control-label"
								for="personalAgree">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<textarea rows="6" name="content" class="form-control" style="resize:none;"
							placeholder="노쇼약관노쇼약관" readonly></textarea>
						<div class="custom-control custom-checkbox mb-5 mt-2">
							<input type="checkbox" class="custom-control-input" id="cancelAgree" required> 
							<label class="custom-control-label"
								for="cancelAgree">무단 취소 시 부여되는 경고사항에 대해 동의합니다.</label>
						</div>

						<button class="btn btn-primary btn-lg btn-block" id="moyoSubmitBtn"
							type="button" onclick="moyoFormCheck();">모여!</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>


