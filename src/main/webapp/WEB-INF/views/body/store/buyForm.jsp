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
<title>Insert title here</title>
<style>

.input-form-background {
padding-bottom: 50px; 

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

#buyFrm {
	margin: 4% 7%; width: 70%;
}

#buyFrm *:not(input, select){
	border: 0;
}


#buyAgree {
	margin: 5%; margin-bottom: 8%;
}

#buyFrm .form-control:focus, #buySubmitBtn:focus, #buyAgree .form-control:focus{
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#buySubmitBtn {
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
	<div class="container" >
		<div class="sectiontitle" style="margin-top:200px;">
			<h2>구매상품 정보</h2>
		</div>
		<div class="input-form-background" align="center">
			<form name="buyFrm" id="buyFrm" action="/store/buyProduct.do" method="post" onsubmit="return validate(this.form);"> 
				<div class="input-form">
					<div class="container" id="goodsBox" >
						<div class="row">
							<table class="table table-hover" id="goodsTable">
								<thead class="goodsTitle">
									<tr>
									  <th>상품이미지</th>	
									  <th>브랜드</th>
									  <th>상품명&nbsp;(상품코드)</th>
									  <th>가격</th>
									  <th>구매가</th>
									  <th>수량</th>
									  <th>사이즈</th>
									</tr>
							    </thead>
							    <tbody>
						    		<fmt:parseNumber value="${productAndDetailDTO.p_price}" var="p_priceNum"/>
						    		<c:if test="${productAndDetailDTO.cou_per != null }">
							    		<fmt:parseNumber value="${productAndDetailDTO.cou_per}" var="cou_perNum"/>						    		
						    		</c:if>
							    	
							    	<tr id="goods">
							    		<td><img class="goodsImg" src="../resources/upload/${productDTO.p_sfile }" /></td>
							    		<td style="vertical-align:middle;">${productAndDetailDTO.p_brand }</td>
							    		<td style="vertical-align:middle;">${productAndDetailDTO.p_name }<br />(${productAndDetailDTO.p_code })</td>
							    		<td style="vertical-align:middle; color:gray;"><del>${productAndDetailDTO.p_price }</del></td>
							    		
							    		<c:choose>
							    			<c:when test="${productAndDetailDTO.cou_per != null }">
									    		<td style="vertical-align:middle;">${p_priceNum*cou_perNum }</td>							    			
							    			</c:when>
							    			<c:otherwise>
							    				<td style="vertical-align:middle;">${p_priceNum }</td>
							    			</c:otherwise>
							    		</c:choose>
							    		
							    		<td style="vertical-align:middle;">${bd_count }</td>
							    		<td style="vertical-align:middle;">${productAndDetailDTO.pd_size }</td>
							    	</tr>
							    </tbody>
							</table>
						</div>
					</div>
				</div>
				<br />
				<div class="input-form col-md-12 mx-auto">
			    	<input type="hidden" name="bd_count" value="${bd_count }"/>
			    	<input type="hidden" name="bd_size" value="${productAndDetailDTO.pd_size }"/>
 					<c:choose>
		    			<c:when test="${productAndDetailDTO.cou_per != null }">
							<input type="hidden" name="b_totalpay" value="${p_priceNum*cou_perNum }"/>		    			
						</c:when>
		    			<c:otherwise>
							<input type="hidden" name="b_totalpay" value="${p_priceNum }"/>		    			
		    			</c:otherwise>
		    		</c:choose>
			    	
					<div class="input-form-wrap">
						<h3 style="text-align:left;padding-top:25px;">구매자 정보</h3>
						<div class="custom-control custom-checkbox" id="fillBuyInfoWrap" align="right">
							<input type="checkbox" class="custom-control-input" id="fillBuyInfo" name="fillBuyInfo" onclick="fillBuyInfos(this);" > 
							<label class="custom-control-label"
								for="fillBuyInfo">기존 정보로 입력하기</label>
						</div>
					
							<table class="table table-bordered">
								<colgroup>
									<col width="20%"/>
									<col width="*"/>
								</colgroup>
								<tbody>
									<tr>
										<td class="text-left"
											style="vertical-align:middle;"><span class="red">*</span>이름</td>
										<td>
											<input type="text" name="username" class="form-control" style="width: 230px;" required/>
										</td>
									</tr>
									<tr>
										<td class="text-left"
											style="vertical-align:middle;"><span class="red">*</span>전화번호</td>
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
											style="vertical-align:middle;"><span class="red">*</span>주소
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
												 placeholder="상세주소를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<td class="text-left" style="vertical-align:middle;">
											<span class="red">*</span>이메일&nbsp;&nbsp;&nbsp;
										</td>	
											<td class="form-inline">
												<input type="text" class="form-control" name="email1" 
													style="width:30%;" required />
												&nbsp;@&nbsp;
												<input type="text" class="form-control" name="email2" 
													style="width:30%;" required />
											</td>
										</tr>	
									<tr>
										<td class="text-left"  style="vertical-align:middle">
										결제수단
										</td>
										<td class="d-flex align-items-center">
											<label><input type="radio" name="payment" checked />&nbsp;&nbsp;무통장</label>
											<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="payment" />&nbsp;&nbsp;카드결제</label>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="payment" />
											&nbsp;&nbsp;
											<img src="../resources/images/buy/kakaoPay.png" class="kakaoPay" style="vertical-align:middle" /></label> -->
										</td>
									</tr>
								</tbody>
							</table>
						<hr class="mt-4 mb-5">
	
						<h3 style="text-align:left;">약관동의</h3>
	
						<div id="buyAgree" style="text-align:left;">
							<textarea rows="6" name="content" class="form-control" style="resize:none;"
								placeholder="개인정보수집약관" readonly
								>[개인정보 보호법] 제15조 및 제17조에 따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다. 
							
□ 개인정보의 수집 및 이용에 관한 사항
- 수집하는 개인정보 항목 
: 성명, 전화번호, 주소, 이메일 등과 그 外 
- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서류로 활용하며, 목적 외의 용도로는 사용하지 않습니다. 

□ 개인정보의 보관 및 이용 기간
- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우 
[개인정보 보호법] 제21조에 따라 처리합니다. </textarea>
							<div class="custom-control custom-checkbox mb-4 mt-2">
								<input type="checkbox" class="custom-control-input" id="personalAgree" required> 
								<label class="custom-control-label"
									for="personalAgree">개인정보 수집 및 이용에 동의합니다.</label>
							</div>
							<textarea rows="6" name="content" class="form-control" style="resize:none;"
								placeholder="노쇼약관노쇼약관" readonly
								>제13조 (매매계약의 체결 및 대금 결제)
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
								
								</textarea>
							<div class="custom-control custom-checkbox mb-5 mt-2">
								<input type="checkbox" class="custom-control-input" id="cancelAgree" required> 
								<label class="custom-control-label"
									for="cancelAgree">무단 취소 시 부여되는 경고사항에 대해 동의합니다.</label>
							</div>
	
							<button class="btn btn-primary btn-lg btn-block" id="buySubmitBtn"
								type="submit">결제하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>