<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
		.input-form-background {
			padding-top: 50px;
			padding-bottom: 50px;

		}

		.input-form-wrap {
			width: 90%;
			height: 90%;
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


		#registFrm {
			margin: 4% 7%;
			width: 90%;
		}

		#registFrm *:not(input, select) {
			border: 0;
		}



		.input-form-wrap h3 {
			margin-top: 20px;
		}


		#registerAgree {
			margin: 5%;
			margin-bottom: 8%;
		}

		.form-control:focus,#registerSubmitBtn:focus {
			border-color: #FFFFFF;
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
		}


		#registFrm .form-control:focus, #registerSubmitBtn:focus{
			border-color: #FFFFFF;
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
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
  

		#registerSubmitBtn {
			background-color: #ff6c2f;
			color: white;
			border: 0;
		}

		#postBtn:hover,
		#checkid:hover {
			background-color: black;
			color: white;
		}


		form {
			outline: none;
		}

		.red {
			color: red;
			padding-right: 5px;
		}

		.comment {
			color: #777777;
			font-size: 12px;
		}

		/* 여러가지 브라우저 환경에서 동일하게 적용하기 위한 코드 */
		input::-ms-input-placeholder {font-style: italic;font-size: 12px; }
		input::-webkit-input-placeholder {font-style: italic;font-size: 12px;}
		input::-moz-placeholder {font-style: italic;font-size: 12px;}
	</style>


	<script>



		//아이디 검증을 위한 전역변수
		var idObj;
		var idFlag;
		window.onload = function () {
			idObj = document.registFrm.user_id;//아이디 객체
		}
		function idCheck(fn) {


			if (!idCapsule()) {
				idObj.value = "";
				idObj.focus();
				return;
			}
			if (fn.user_id.value == "") {
				alert("아이디를 입력후 중복확인을 해주세요.");
				fn.user_id.focus();
			}
			else {
				fn.user_id.readOnly = true;
				window.open("./idcheck.do?user_id=" + fn.user_id.value,
					"idover", "width=600,height=400");
			}
		}
		function loginValdidate(fn) {
			//일반적인방법
			if (fn.user_id.value == "") {
				alert("아이디를 입력해주세요");
				fn.user_id.readOnly = false;
				fn.user_id.focus(); return false;
			}
			if (!idCapsule()) {
				idObj.value = "";
				idObj.focus();
				return false;
			}
			var p1 = fn.pass1;
			var p2 = fn.pass2;
			if (p1.value == "") { alert("패스워드를 입력해주세요"); p1.focus(); return false; }
			if (p2.value == "") { alert("패스워드확인을 입력해주세요"); p2.focus(); return false; }
			
			if(!(p1.value.length >= 8 && p1.value.length <= 16) ){
				alert("패스워드의 길이는 8~16자로 입력해주세요.");
				return false;
			}
			
			if (isPassword(p1.value) == false) {
				alert('패스워드는 숫자와 특수기호가 하나이상 포함되야합니다.');
				p1.value = ""; p2.value = ""; p1.focus();
				return false;
			}
			if (p1.value != p2.value) {
				alert("패스워드가 틀립니다. 다시 입력해주세요");
				p1.value = ""; p2.value = ""; p1.focus();
				return false;
			}
			if (fn.name.value == "") {
				alert("이름을 입력해주세요"); fn.name.focus(); return false;
			}
			
			return true;
		}
		function isPassword(param) {
			//숫자나 특수기호가 확인되면 true로 변경한다.
			var isNum = false, isSpec = false;
			//숫자가 포함되었는지 확인
			for (var i = 0; i < param.length; i++) {
				if (param[i].charCodeAt(0) >= 48 && param[i].charCodeAt(0) <= 57) {
					isNum = true;
					console.log("숫자포함됨");
					break;
				}
			}
			for (var i = 0; i < param.length; i++) {
				if ((param[i].charCodeAt(0) >= 33 && param[i].charCodeAt(0) <= 47)
					|| (param[i].charCodeAt(0) >= 58 && param[i].charCodeAt(0) <= 64)
					|| (param[i].charCodeAt(0) >= 91 && param[i].charCodeAt(0) <= 96)) {
					isSpec = true;
					console.log("특수기호포함됨");
					break;
				}
			}
			if (isNum == true && isSpec == true)
				return true;
			else
				return false;
		}
		//아이디가 6~12자 사이가 아니면 false를 반환한다.
		var idLength = function (param) {
			if (!(param.value.length >= 6 && param.value.length <= 12)) {
				return false;
			}
			return true;
		}
		//아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.
		function isNumber(param) {
			for (var i = 0; i < param.length; i++) {
				if (!(param[i].charCodeAt(0) >= 48 && param[i].charCodeAt(0) <= 57)) {
					return false;
				}
			}
			return true;
		}
		//아이디의 첫문자는 숫자로 시작할수 없다
		var idStartAlpha = function (param) {
			if (isNumber(param.value.substring(0, 1)) == true) {
				return false;
			}
			return true;
		}
		//아스키코드로 숫자 or 알파벳인지 확인. 아니면 false반환
		function isAlphaNumber(param) {
			for (var i = 0; i < param.value.length; i++) {
				if (!((param.value[i].charCodeAt(0) >= 97 && param.value[i].charCodeAt(0) <= 122)
					|| (param.value[i].charCodeAt(0) >= 65 && param.value[i].charCodeAt(0) <= 90)
					|| (param.value[i].charCodeAt(0) >= 48 && param.value[i].charCodeAt(0) <= 57))) {
					return false;
				}
			}
			return true;
		}
		//아이디검증 로직을 하나로 묶는다.
		function idCapsule() {
			//1.아이디는 6~12자 이내여야 한다. 즉 5자를 쓰거나 13자를 쓰면 잘못된 아이디로 판단하고 재입력을 요구한다.
			if (!idLength(idObj)) {
				alert('아이디는 6~12자만 가능합니다.');
				return false;
			}
			//2.아이디는 반드시 영문으로 시작해야 한다. 만약 숫자로 시작하면 잘못된 아이디로 판단한다.
			if (!idStartAlpha(idObj)) {
				alert("아이디는 숫자로 시작할수 없습니다.");
				return false;
			}
			//3.영문과 숫자의 조합으로만 구성해야 한다. 특수기호가 들어가거나 한글이 들어갈 경우 잘못된 아이디로 판단한다.
			if (!isAlphaNumber(idObj)) {
				alert("아이디는 영문과 숫자만 포함할수 있습니다.");
				return false;
			}
			return true;
		}
		function inputEmail(frm) {
			if (frm.email_domain.value == '1') {
				/*
				select에서 직접입력을 선택하면
				readonly속성을 비활성화하고, 입력된 내용을 비워준다. 
				*/
				frm.email2.readOnly = false;
				frm.email2.value = '';
				frm.email2.focus();
			}
			else {
				/*
				특정 도메인을 선택하면
				선택한 도메인을 입력하고, readonly속성은 활성화한다.
				*/
				frm.email2.readOnly = true;
				frm.email2.value = frm.email_domain.value;
			}
		}
		function commonFocusMove(obj, mLength, next_obj) {
			var strLength = obj.value.length;
			if (strLength >= mLength) {
				eval("document.registFrm." + next_obj + ".focus();");
			}
		}
	</script>

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

<!-- 

아이디 6~12자리 
	- 숫자 or 영문(대소문자 구분 안함)
	- 중복확인
비밀번호 8~6자리
	- 영문+숫자+특수문자(키보드 맨위 첫줄과 ? . !)
비밀번호 확인
이름
생년월일(datepicker 사용하기)
주소(우편번호 API)
이메일
전화번호 인증-> 전화인증부터 구현 하고 못하면 이메일로?
관심태그
계정 연동 (API)
가입 약관
개인 정보 처리 방침
 -->

<body>
	<div class="container" style="margin-top:60px;">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
					<h3>회원가입</h3>
					<form name="registFrm" id="registFrm" action="./registerAction.do" method="POST"
						onsubmit="return loginValdidate(this);">
						<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr style="text-align: right;">
									<td colspan="2">
										<span class="red">*필수입력사항</span>

									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>아이디
									</td>
									<td class="form-inline">
										<input type="text" name="user_id" class="form-control" style="width: 250px;"
											required placeholder="아이디를 입력해주세요." />&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="checkid" onclick="idCheck(this.form);"
											style="width: 120px;height: 40px;">중복확인</button>
									</td>

								</tr>
								<tr>
									<td></td>
									<td colspan="2">
										<span class="comment">※ 6~12자의 영문과 숫자만 가능합니다.</span>
									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>비밀번호
									</td>
									<td>
										<input type="text" name="pass1" class="form-control" style="width: 250px;"
											required placeholder="비밀번호를 입력해주세요." value="ALStd1995@"/>
									</td>
								</tr>

								<tr>
									<td></td>
									<td>
										<span class="comment">
											※ 영문/숫자/특수문자 조합 8~16자 이상 입력해주세요. <br>
										</span>
									</td>
								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>비밀번호
										확인</td>
									<td>
										<input type="text" name="pass2" class="form-control" style="width: 250px;"
											required placeholder="비밀번호를 입력해주세요." value="ALStd1995@"/>
									</td>
								</tr>

								<tr>
									<td><span class="red">*</span> 이름</td>
									<td class="form-inline">
										<input type="text" class="form-control" name="name" style="width: 250px;"
											required placeholder="이름을 입력해주세요." value="민세원"/>
										
	
									</td>
								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"><span
											style="padding-left: 13px;">생년월일</span> </td>
									<td>
										<input type="date" id="birthday" name="birthday" class="form-control"
											style="width: 250px; font-style: italic; font-size: 12px;"  />
									</td>
								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>주소
									</td>
									<td class="form-inline">
										<input type="text" name="postcode" class="form-control" style="width: 250px;"
											required placeholder="우편번호" value="08505"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="postBtn" onclick="zipcodeFind();"
											style="width: 120px;height: 40px;">우편번호</button>
									</td>

								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"></td>
									<td>
										<input type="text" name="addr1" class="form-control" style="width: 500px;"
											required placeholder="주소를 입력해주세요." value="서울 금천구 가산디지털2로 123"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" name="addr2" class="form-control" style="width: 500px;"
											required placeholder="상세주소를 입력해주세요." value="413호"/>

									</td>
								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>전화번호
									</td>
									<td class="form-inline">
										<select name="mobile1" class="form-control"
											onchange="commonFocusMove(this, 3,'mobile2');" style="width:80px;" required>
											<option value=" "></option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile2" value="1111" maxlength="4"
											onkeyup="commonFocusMove(this, 4,'mobile3');" style="width:100px;" required />
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile3" value="1111" maxlength="4"
											style="width:100px;" onkeyup="commonFocusMove(this, 4,'email1');" required />
									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"><span
											class="red">*</span>이메일&nbsp;&nbsp;&nbsp;</td>
									<td class="form-inline">
										<input type="text" class="form-control" name="email1" value="minsw626"
											style="width:30%;" required />
										&nbsp;@&nbsp;
										<input type="text" class="form-control" name="email2" value="naver.com"
											style="width:30%;" required />&nbsp;&nbsp;
										<select name="email_domain" class="form-control"
											onChange="inputEmail(this.form);" style="width:30%;">
											<option value="1" selected>- 직접입력 -</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="nate.com">nate.com</option>
										</select>
									</td>

								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"><span
											style="padding-left: 13px;">관심 태그</span></td>
									<td class="form-inline" style="padding-bottom: 0px;">
										<input type="checkbox" name="dandy" value="dandy" class="form-control" checked/>
										&nbsp;댄디&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="classic"  value="classic" class="form-control" checked/>
										&nbsp;클래식&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="casual"  value="casual" class="form-control" />
										&nbsp;캐주얼&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="sporty"  value="sporty" class="form-control" />
										&nbsp;스포티&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"></td>
									<td class="form-inline" style="padding-top: 0px;">
										<input type="checkbox" name="modern"  value="modern" class="form-control" />
										&nbsp;모던&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="street"  value="street" class="form-control" />
										&nbsp;스트릿&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="vintage"  value="vintage" class="form-control" />
										&nbsp;빈티지&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="lovely"  value="lovely" class="form-control" />
										&nbsp;러블리&nbsp;&nbsp;&nbsp;&nbsp;

									</td>
								</tr>
							</tbody>
						</table>
					

					<hr class="mt-4 mb-5">

					<h3>약관동의</h3>

					<div id="registerAgree">
						<textarea rows="6" name="content" class="form-control" style="resize:none;"
							placeholder="개인정보수집약관" readonly></textarea>
						<div class="custom-control custom-checkbox mb-4 mt-2">
							<input type="checkbox" class="custom-control-input" id="personalAgree" required checked>
							<label class="custom-control-label" for="personalAgree">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<textarea rows="6" name="content" class="form-control" style="resize:none;"
							placeholder="노쇼약관노쇼약관" readonly></textarea>
						<div class="custom-control custom-checkbox mb-5 mt-2">
							<input type="checkbox" class="custom-control-input" id="cancelAgree" required checked>
							<label class="custom-control-label" for="cancelAgree">무단 취소 시 부여되는 경고사항에 대해 동의합니다.</label>
						</div>

						<button class="btn btn-primary btn-lg btn-block" id="registerSubmitBtn"
							type="submit" >회&nbsp;원&nbsp;가&nbsp;입</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</html>