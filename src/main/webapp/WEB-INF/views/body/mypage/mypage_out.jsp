<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
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
.agree{
	font-size: 20px;
	font-weight:bold;
}

.agreeFrm{
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
 
 .form-check-label{
    margin-left: 20px;
}
.textarea{
    margin-left: -20px;
    width: 500px;
    height: 100px;
}
</style>

<script type="text/javascript">

function memberOut(frm){
	var result = 
		confirm("회원정보는 탈퇴시 즉시 삭제됩니다. 탈퇴 하시겠습니까?");
	if(result){
		true;
	}else{
		frm.action="#";
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
                    <h3>회원탈퇴</h3>
                </div>
                <form name="memberOutForm" action="./memberOut.do" onsubmit="memberOut(this);">
                    <div class="form-check">
                        <div class="agree">
                            회원탈퇴사유
                        </div>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option" id="r1" required >
                            회원탈퇴 후 재가입을 위해서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option" id="r2" >
                            상품 구매 빈도가 낮아 이용할 필요가 없어서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option" id="r3" >
                            서비스 및 고객지원이 만족스럽지 못해서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option" id="r4" >
                            별다른 이유없이 탈퇴
                            </input>
                        </label>
						<br /><br /><br />
                        <br>
                        <div class="agree"><input type="checkbox" name="quit" required>
                            회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.
                        </div>
                        <br />
                        <div class="agreeFrm">
                            1. 탈퇴 이후에는 보유하신 쿠폰과 참여하신 이벤트의 응모 및 당첨 혜택이 모두 소멸됩니다.
                            <br>
                            2. 회원정보는 탈퇴 시 관련법령에 따라 보관 의무가 있는 경우를 제외하고는 즉시 삭제됩니다.
                            <br>
                            3. 전자상거래 등에서의 소비자보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 
                            <br />
                            대금 결제 및 재화 등의 공급에 관한 기록은 5년, 그리고 소비자의 불만 또는 분쟁처리에 관한 기록은 3년간 보존됩니다.
                            <br>
                            4. 탈퇴 이후에는 어떠한 방법으로도 삭제된 회원정보를 복원할 수 없습니다.
                        </div>
                        <br>
                        <button type="submit" class="btn btn-outline-dark">탈퇴하기</button>
                    </div>
                </form>
            </div> 
        </div>
    </div>
</body>
</html>