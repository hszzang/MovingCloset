<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
<title>결제폼 :: MovingCloset</title>
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



.productImg {
	width: 400px; height: 400px;
	border: 1px solid lightgray;
	border-radius: 3px;
}


.input-form-wrap h3 {
	margin-top: 20px; 
}

.form-control:focus, #buySubmitBtn:focus{
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#buySubmitBtn {
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

.sectiontitle {
	text-align: center;
	padding-bottom: 10px;
	padding-top: 50px;
}

.sectiontitle h2 {
	font-size: 32px;
	font-weight: bold;
	text-transform: uppercase;
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.sectiontitle h2::after {
	content: '';
	position: absolute;
	display: block;
	width: 50px;
	height: 3px;
	background: #555555;
	bottom: 0;
	left: calc(50% - 25px);
}
.red{
	color:red;
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
	
	function fillBuyInfos(chkbox) {
		console.log(chkbox.checked)
		
		if(chkbox.checked == true) {
			
			var emailArr = "${memberDTO.email }".split("@");
			document.buyFrm.postcode.value = "${memberDTO.postcode }";
			document.buyFrm.addr1.value = "${memberDTO.addr }";
			document.buyFrm.mobile1.value = "${memberDTO.phone }".substring(0, 3);
			document.buyFrm.mobile2.value = "${memberDTO.phone }".substring(4, 8);
			document.buyFrm.mobile3.value = "${memberDTO.phone }".substring(9, 13);
			document.buyFrm.email1.value = emailArr[0];
			document.buyFrm.email2.value = emailArr[1];
			document.buyFrm.username.value = "${memberDTO.name }";
		}
		if(chkbox.checked == false) {
			document.buyFrm.username.value = "";
			document.buyFrm.mobile2.value = "";
			document.buyFrm.mobile3.value = "";
			document.buyFrm.email1.value = "";
			document.buyFrm.email2.value = "";
			document.buyFrm.postcode.value = "";
			document.buyFrm.addr1.value = "";
			document.buyFrm.addr2.value = "";
			
		}
	}
	
	function validate(frm){
		if(frm.username.value==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		if(frm.mobile1.value=="" || frm.mobile2.value=="" || frm.mobile3.value==""){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		if(frm.postcode.value==""){
			alert("우편번호를 입력해주세요");
			return false;
		}
		if(frm.addr1.value==""){
			alert("주소를 입력해주세요.");
			return false;
		}
		if(frm.email1.value=="" || frm.email2.value==""){
			alert("이메일을 입력해주세요.")
			return false;
		}
			
		
		
	}
	
</script>
</head>
<body>
	<div class="container" style="margin-top:200px;">
		<div class="sectiontitle">
		    <h2>주문 완료</h2>
	    </div>
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
					<br />
					<h3>주문 내역</h3>
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
										${buyAndGroupDTO.b_buyer }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">전화번호</td>
									<td class="form-inline">
										${buyAndGroupDTO.b_phone }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">우편번호</td>
									<td>
										${buyAndGroupDTO.b_postcode } 
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">주소</td>
									<td>
										${buyAndGroupDTO.b_addr }
									</td>
								</tr>
								<tr>
									<td class="text-left"
										style="vertical-align:middle;">이메일&nbsp;&nbsp;&nbsp;</td>
									<td class="form-inline">
										${buyAndGroupDTO.email }
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
	
	</div>
</body>
</html>