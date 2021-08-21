<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		var count;
		window.onload = function () {
			idObj = document.registFrm.user_id;//아이디 객체
			count=0;
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
				count++;
				fn.user_id.readOnly = true;
				window.open("./idcheck.do?user_id=" + fn.user_id.value,
					"idover", "width=600,height=400");
			}
		} 
		
		
/* 		function check_id() {
			
			var idCheck = 0;
			
			var inputed = $('input#user_id').val();
			
			$.ajax({
			
				data : inputed,
				url : "registerForm",
				type:"POST",
				dataType : "JSON",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					var result = JSON.parse(data);
					
					if(result.check > 0){
						$(".id-text").css("text-align","center");
						$(".id-text").css("color","#ff0000");
						$(".id-text").text("이미 사용 중인 아이디입니다.");
						$("button#registerSubmitBtn").attr("disabled","true");
					}else if(result.check ==0){
						$(".id-text").css("text-align","center");
						$(".id-text").css("color","#4B89DC");
						$(".id-text").text("사용 가능한 아이디입니다.");
						$("button#registerSubmitBtn").removeAttr("disabled");
					} 
					
					
				}
				
			});
			
			
			
		};
		 */
		
		
		
		
		
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
			
			if(count == 0){
				alert("아이디 중복 확인을 해주세요.");
				fn.user_id.focus();
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
			
			//count=0;
			
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
									<td class="text-left" style="vertical-align:middle;" value=${data.id }><span class="red">*</span>아이디
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
										<input type="password" name="pass1" class="form-control" style="width: 250px;"
											required placeholder="비밀번호를 입력해주세요." value=""/>
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
										<input type="password" name="pass2" class="form-control" style="width: 250px;"
											required placeholder="비밀번호를 입력해주세요." value=""/>
									</td>
								</tr>

								<tr>
									<td><span class="red">*</span> 이름</td>
									<td class="form-inline">
										<input type="text" class="form-control" name="name" style="width: 250px;"
											required placeholder="이름을 입력해주세요." value=""/>
										
	
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
											required placeholder="우편번호" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" id="postBtn" onclick="zipcodeFind();"
											style="width: 120px;height: 40px;">우편번호</button>
									</td>

								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"></td>
									<td>
										<input type="text" name="addr1" class="form-control" style="width: 500px;"
											required placeholder="주소를 입력해주세요." value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" name="addr2" class="form-control" style="width: 500px;"
											required placeholder="상세주소를 입력해주세요." value=""/>

									</td>
								</tr>

								<tr>
									<td class="text-left" style="vertical-align:middle;"><span class="red">*</span>전화번호
									</td>
									<td class="form-inline">
										<select name="mobile1" class="form-control"
											onchange="commonFocusMove(this, 3,'mobile2');" style="width:100px;" required>
											<option value="">-선택-</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile2" value="" maxlength="4"
											onkeyup="commonFocusMove(this, 4,'mobile3');" style="width:100px;" required />
										&nbsp;&nbsp;-&nbsp;&nbsp;
										<input type="text" class="form-control" name="mobile3" value="" maxlength="4"
											style="width:100px;" onkeyup="commonFocusMove(this, 4,'email1');" required />
									</td>
								</tr>
								<tr>
									<td class="text-left" style="vertical-align:middle;"><span
											class="red">*</span>이메일&nbsp;&nbsp;&nbsp;</td>
									<td class="form-inline">
										<input type="text" class="form-control" name="email1" value=""
											style="width:30%;" required />
										&nbsp;@&nbsp;
										<input type="text" class="form-control" name="email2" value=""
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
										<input type="checkbox" name="dandy" value="dandy" class="form-control" />
										&nbsp;댄디&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="classic"  value="classic" class="form-control" />
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
							placeholder="개인정보수집약관" readonly
							>본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법] 제15조 및 제17조에 
따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다. 
							
□ 개인정보의 수집 및 이용에 관한 사항
- 수집하는 개인정보 항목 (이력서 양식 내용 일체) 
: 성명, 주민등록번호, 전화번호, 주소, 이메일, 가족관계, 학력사항, 
경력사항, 자격사항 등과 그 外 이력서 기재 내용 일체
- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서
류로 활용하며, 목적 외의 용도로는 사용하지 않습니다. 

□ 개인정보의 보관 및 이용 기간
- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우 
[개인정보 보호법] 제21조에 따라 처리합니다.  </textarea>
						<div class="custom-control custom-checkbox mb-4 mt-2">
							<input type="checkbox" class="custom-control-input" id="personalAgree" required >
							<label class="custom-control-label" for="personalAgree">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<textarea rows="6" name="content" class="form-control" style="resize:none;"
							placeholder="노쇼약관노쇼약관" readonly>제13조 (매매계약의 체결 및 대금 결제)
1. 상품의 매매계약은 회원이 판매자가 제시한 상품의 판매 조건에 응하여 청약의 의사표시를 하고 이에 대하여 판매자가 승낙의 의사표시를 함으로써 체결됩니다.
2. 회사는 회원이 현금, 카드 기타의 방법으로 매매 대금을 결제할 수 있는 방법을 제공합니다.
3. 매매 대금의 결제와 관련하여 구매자가 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 구매자가 부담하여야 합니다.
4. 상품을 주문한 후 일정 기간 내에 매매대금을 결제하지 않을 경우 회사는 당해 주문을 회원의 동의 없이 취소할 수 있습니다.
5. 회사는 구매자의 상품 매매계약 체결 내용을 나의 쇼핑 내역을 통해 확인할 수 있도록 조치하며, 매매계약의 취소 방법 및 절차를 안내합니다.
6. 회사는 구매자가 매매대금 결제 시 사용한 결제수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래진행을 중지하거나, 확인이 불가한 해당거래를 취소할 수 있습니다.
7. 구매자가 실제로 결제하는 금액은 판매자가 정한 공급원가, 기본이용료, 상품에 적용된 할인쿠폰, 배송비, 옵션상품의 옵션내역 등이 적용된 금액(실구매액)이며 구매자에게 발행되는 구매증빙서(현금영수증, 세금계산서, 신용카드매출전표 등)는 실구매액으로 발행됩니다.

제14조 (배송)
1. 배송 소요기간은 입금 또는 대금결제 확인일의 익일을 기산일로 하여 배송이 완료되기까지의 기간을 말합니다.
2. 회사는 판매자에게 회사로부터 구매자의 입금 또는 대금결제에 대한 확인통지를 받은 후 3영업일 이내에 배송에 필요한 조치를 취하도록 안내합니다.
3. 천재지변 등 불가항력적인 사유가 발생한 경우 그 해당기간은 배송 소요기간에서 제외됩니다.
4. 회사는 배송과 관련하여 판매자와 구매자, 배송업체, 금융기관 등과의 사이에 발생한 분쟁은 당사자들 간의 해결을 원칙으로 하며, 회사는 어떠한 책임도 부담하지 않습니다.
5. 판매자의 발송확인 처리 이후에 구매자가 수취확인을 하지 않아 배송중 상태가 지연될 경우, 회사는 발송확인일로부터 2주 이내에 수취확인요청 안내를 할 수 있습니다. 회사의 안내 이후에도 구매자의 수취확인이 이루어지지 않을 경우 3일이 경과한 시점에 자동으로 배송완료로 전환될 수 있으며 이 경우 실제 구매자가 상품을 수령하지 못한 경우에 구매자는 미수취신고를 할 수 있습니다.

제15조 (취소)
1. 회원은 구매한 상품이 발송되기 전까지 구매를 취소할 수 있으며, 배송중인 경우에는 취소가 아닌 반품절차에 따라 처리됩니다.
2. 판매자가 회원의 입금 또는 대금결제에 대한 통지를 수령한 후 ESM PLUS 서비스 화면에서 에누리쿠폰(구매쿠폰)의 적용을 승인하지 않는 의사표시를 한 경우, 해당 체결 건은 자동적으로 취소되고 입금된 대금은 회원에게 환불됩니다.
3. 회원이 결제를 완료한 후 배송대기, 배송요청 상태에서는 취소신청 접수 시 특별한 사정이 없는 한 즉시 취소처리가 완료됩니다.
4. 배송준비 상태에서 취소신청한 때에 이미 상품이 발송이 된 경우에는 발송된 상품의 왕복배송비를 구매자가 부담하는 것을 원칙으로 하며, 취소가 아닌 반품절차에 따라 처리됩니다..
5. 취소처리에 따른 환불은 카드결제의 경우 취소절차가 완료된 즉시 결제가 취소되며, 현금결제의 경우에는 3영업일 이내에 Smile Cash로 환불됩니다.

제16조 (반품)
1. 회원은 판매자의 상품 발송 시로부터 배송완료일 후 7일 이내까지 관계법령에 의거하여 반품을 신청할 수 있습니다.
2. 반품에 관한 일반적인 사항은 전자상거래등에서의소비자보호에관한법률 등 관련법령이 판매자가 제시한 조건보다 우선합니다.
3. 반품에 소요되는 비용은 반품에 대한 귀책사유가 있는 자에게 일반적으로 귀속됩니다. (예를 들어, 단순변심 : 구매자부담, 상품하자 : 판매자부담 등)
4. 반품 신청 시 반품송장번호를 미기재하거나 반품사유에 관하여 판매자에게 정확히 통보(구두 또는 서면으로)하지 않을 시 반품처리 및 환불이 지연될 수 있습니다.
5. 반품에 따른 환불은 반품 상품이 판매자에게 도착되고 반품사유 및 반품배송비 부담자가 확인된 이후에 현금결제의 경우에는 3영업일 이내에 Smile Cash로 환불되고, 카드 결제의 경우 즉시 결제가 취소됩니다. 다만, 회사는 거래의 종류와 규모, 구매자의 신용도 등을 고려하여 구매회원이 반품을 위해 상품을 발송한 사실이 확인되면 판매회원이 반품수령확인을 하기 전이라도 구매회원에게 신속하게 환불하는 서비스('빠른환불서비스')를 제공할 수 있습니다. 이 경우 구매회원이 반품에 정당한 사유가 없음에도 빠른환불서비스를 이용하여 환불을 받은 것으로 확인되면, 회사는 구매회원에게 환불액의 반환을 청구하거나 스마일캐시 등 구매회원의 예치금에서 환불액을 차감할 수 있고, 사위 기타 부정하게 환불을 받은 구매회원에 대해서는 제31조에서 정하는 조치를 취할 수 있습니다. 회사는 빠른환불서비스의 구체적 내용에 대하여 별도의 [서비스화면]을 통하여 공지합니다.
6. 반품배송비를 구매자가 부담하여야 하는 경우 반품배송비의 추가 결제가 이루어지지 않으면 환불이 지연될 수 있습니다.

제17조 (교환)
1. 회원은 판매자의 상품 발송 시로부터 배송완료일 후 7일이내까지 관계법령에 의거하여 교환을 신청할 수 있습니다.
2. 교환신청을 하더라도 판매자에게 교환할 물품의 재고가 없는 경우에는 교환이 불가능하며, 이 경우에 해당 교환신청은 반품으로 처리됩니다.
3. 교환에 소요되는 비용은 물품하자의 경우에는 판매자가 왕복배송비를 부담하나 구매자의 변심에 의한 경우에는 구매자가 부담합니다.

제18조 (환불)
1. 회사는 구매자의 취소 또는 반품에 의하여 환불사유가 발생할 시 현금결제의 경우에는 3영업일 이내에 구매자의 Smile Cash로 해당금액을 환불하고 카드결제의 경우에는 즉시 결제가 취소됩니다.
2. 카드결제를 통한 구매건의 환불은 원칙적으로 카드결제 취소를 통해서만 가능합니다.
3. 회원은 Smile Cash로 환불된 금액을 은행계좌로 입금 받고자 하는 경우에는 별도로 지정한 자신의 출금계좌로 현금출금요청을 할 수 있습니다

제19조 (반품/교환/환불의 적용 배제)
구매자는 다음 각 호의 경우에는 환불 또는 교환을 요청할 수 없습니다.
1) 구매자의 귀책사유로 말미암아 상품이 멸실·훼손된 경우
2) 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
3) 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
4) 복제가 가능한 상품의 포장을 훼손한 경우
5) 주문에 따라 개별적으로 생산되는 물품 등 판매자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 구매자의 서면(전자문서를 포함)에 의한 동의를 받은 경우

제20조 (구매안전 서비스)
1. 회사는 선지급식 통신판매에 있어서 구매자가 지급하는 결제대금을 예치하고 배송이 완료된 후 재화 또는 용역의 대금을 판매자에게 지급함으로써 구매자의 안전을 도모합니다.
2. 회사는 구매자에게 상품을 공급받은 사실을 재화 등을 공급받은 날(배송완료일)로부터 3영업일 이내에 통보하여 주도록 요청합니다.
3. 회사는 구매자가 재화 등을 공급받고 [구매결정]항목을 클릭할 경우 그 익일(토요일, 공휴일 제외)에 판매회원에게 결제대금을 지급하고, 배송완료일로부터 7일 이내에 [구매결정]을 클릭하지 않는 경우에는 7일이 경과한 날로부터 2영업일 이내에 판매회원에게 결제대금을 지급할 수 있습니다. 다만, 회사가 판매회원에게 결제대금을 지급하기 이전에 구매자가 취소, 반품, 교환 또는 환불의 의사를 표시한 경우에는 그 지급을 보류합니다.</textarea>
						<div class="custom-control custom-checkbox mb-5 mt-2">
							<input type="checkbox" class="custom-control-input" id="cancelAgree" required >
							<label class="custom-control-label" for="cancelAgree">구매 서비스 이용에 대해 동의합니다.</label>
						</div>

						<button class="btn btn-primary btn-lg btn-block" id="registerSubmitBtn"
							type="submit" >회&nbsp;원&nbsp;가&nbsp;입</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
//csrf를 막기위한 체크값 생성함수
function generate_state() {
    $mt = microtime();
    $rand = mt_rand();
    return md5($mt . $rand);
}
 
$p['state'] = generate_state();
 
$p['client_id'] = '8dUO8AkoujmRhyEgT8yz';
$p['client_secret'] = 'ajIGhcnSWA';
$p['response_type'] = 'code';
$p['redirect_url'] = 'http://localhost:8082/movingcloset/movingcloset/register.do'; //여기서는 현재 파일을 그대로 이용
//네이버 로그인 등록시 입력한 주소입니다. 틀리면 작동하지 않습니다.
 
//  
$url = '<a href="https://nid.naver.com/oauth2.0/authorize?client_id='.urlencode(" target="_blank">https://nid.naver.com/oauth2.0/authorize?client_id='.urlencode(</a>$p['client_id']).'&response_type=code&redirect_uri='.urlencode($p['redirect_url']).'&state='.$p['state'];
 
//code는 로그인이 성공하고 나면 redirect_url에 인자로 돌려주는 값입니다.
//이 값이 있어야 access_token을 요청할 수 있습니다.
if(!$_GET['code']) {
    header('Location: ' . $url);
}
//위 요청을 하게되면 네이버 로그인창이 뜹니다. (정보동의 과정이 나올수도 있습니다)
 
//이 라인은 네이버 로그인창에서 로그인이 끝나고 나서 redirect_url에 code를 전송했을때
//실행됩니다.
if($_GET['code'])
{
    $p['code'] = $_GET['code'];
}
 
//access_token을 요청하는 주소. 위 검증코드가 있어야 실행됩니다.
$url2 = '<a href="https://nid.naver.com/oauth2.0/token?client_id='.urlencode(" target="_blank">https://nid.naver.com/oauth2.0/token?client_id='.urlencode(</a>$p['client_id']).'&client_secret='.urlencode($p['client_secret']).'&grant_type=authorization_code&state='.$p['state'].'&code='.$p['code'];
 
$json = file_get_contents($url2);
$data = json_decode($json);
 
echo $data->access_token;

//네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;


public class ApiExamMemberProfile {


 public static void main(String[] args) {
     String token = "AAAAONgW-jgpzTy4yloiMq5N3MVnKlT30absTkPrPNkaI_E4A-x8ZJExAHKfROmBfZtSMUUXg2Xt3Z-V6QT1h9ioly8"; // 네이버 로그인 접근 토큰;
     String header = "Bearer " + token; // Bearer 다음에 공백 추가


     String apiURL = "https://openapi.naver.com/v1/nid/me";


     Map<String, String> requestHeaders = new HashMap<>();
     requestHeaders.put("Authorization", header);
     String responseBody = get(apiURL,requestHeaders);


     System.out.println(responseBody);
 }


 private static String get(String apiUrl, Map<String, String> requestHeaders){
     HttpURLConnection con = connect(apiUrl);
     try {
         con.setRequestMethod("GET");
         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
             con.setRequestProperty(header.getKey(), header.getValue());
         }


         int responseCode = con.getResponseCode();
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
             return readBody(con.getInputStream());
         } else { // 에러 발생
             return readBody(con.getErrorStream());
         }
     } catch (IOException e) {
         throw new RuntimeException("API 요청과 응답 실패", e);
     } finally {
         con.disconnect();
     }
 }


 private static HttpURLConnection connect(String apiUrl){
     try {
         URL url = new URL(apiUrl);
         return (HttpURLConnection)url.openConnection();
     } catch (MalformedURLException e) {
         throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
     } catch (IOException e) {
         throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
     }
 }


 private static String readBody(InputStream body){
     InputStreamReader streamReader = new InputStreamReader(body);


     try (BufferedReader lineReader = new BufferedReader(streamReader)) {
         StringBuilder responseBody = new StringBuilder();


         String line;
         while ((line = lineReader.readLine()) != null) {
             responseBody.append(line);
         }


         return responseBody.toString();
     } catch (IOException e) {
         throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
     }
 }
}





</script>
</body>

</html>