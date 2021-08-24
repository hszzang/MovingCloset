<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>Insert title here</title>
<style>

.input-form-background {
padding-top: 200px; padding-bottom: 50px; 

}

.input-form-background h5{
	padding-bottom:10px;
	padding-left:10px;
}

.input-form-wrap {
	width: 90%; height: 90%;
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

.goodsImg{
	width:100px; height:100px;
}

.goodsTitle{
	background-color:#ff6c2f ;
}

#goodsBox{
	margin-top:30px;
	background-color: #f2d082;
	border-radius: 20px;
}

#goodsTable{
	text-align:center;
	
}

.kakaoPay{
	width:70px; height:30px;
}

#postBtn:hover{
	background-color: black;
	color: white;
}


</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function zipcodeFind() {
		new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var f = document.registFrm;
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				console.log('addr : ' + addr);
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				f.postcode.value = data.zonecode;
				f.addr1.value = addr;
				// 커서를 상세주소 필드로 이동한다.
				f.addr2.focus();
			}
		}).open();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="input-form-background row">
					<h5>구매상품 정보</h5>
			<div class="input-form col-md-12 mx-auto">
				<div class="container" id="goodsBox">
					<div class="row">
						<table class="table table-hover" id="goodsTable">
							<thead class="goodsTitle">
								<tr>
								  <th>상품이미지</th>
								  <th>상품명&nbsp;(상품코드)</th>
								  <th>가격</th>
								  <th>구매가</th>
								  <th>수량</th>
								  <th>사이즈</th>
								</tr>
						    </thead>
						    <tbody>
						    	<tr id="goods">
						    		<td><img class="goodsImg" src="../resources/images/list/2.jpg" /></td>
						    		<td style="vertical-align:middle;">컨버스<br />(abcd1234abcd)</td>
						    		<td style="vertical-align:middle; color:grey;"><del>79000</del></td>
						    		<td style="vertical-align:middle;">59000</td>
						    		<td style="vertical-align:middle;">1</td>
						    		<td style="vertical-align:middle;">260</td>
						    	</tr>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
			<br />
				<h5>구매자 정보</h5>
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
					<form name="moyoFrm" id="moyoFrm" action="#" method="post" > 
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
										<input type="text" name="title" class="form-control" style="width: 230px;" required/>
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">전화번호</td>
									<td class="form-inline">
										<select name="mobile1" class="form-control" 
										onchange="phoneFocus(3, this, 'mobile2');" style="width:80px;" required>
											<option value=" "> </option>
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
										style="vertical-align:middle;">주소
									</td>
										<td class="form-inline">
										<input type="text" name="postcode" class="form-control" style="width: 250px;"
											required placeholder="우편번호" />&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="postBtn" onclick="zipcodeFind();"
											style="width: 120px;height: 40px;">우편번호</button>
									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"></td>
									<td>
										<input type="text" name="addr1" class="form-control" style="width: 500px;"
											required placeholder="주소를 입력해주세요." />&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" name="addr2" class="form-control" style="width: 500px;"
											required placeholder="상세주소를 입력해주세요." />
									</td>
								</tr>
								<tr>
									<td class="text-left"  style="vertical-align:middle">
									결제수단
									</td>
									<td class="d-flex align-items-center">
										<input type="radio" name="1" />&nbsp;&nbsp;무통장
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="1"/>&nbsp;&nbsp;카드결제
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="1"/>
										&nbsp;&nbsp;
										<img src="../resources/images/buy/kakaoPay.png" class="kakaoPay" style="vertical-align:middle" />
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
							type="submit">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>