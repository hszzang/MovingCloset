<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/bootstrap.css" />
	<script src="../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-lg-3">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item main">My Page</li>
                    <li class="list-group-item profile">
                        <i class="material-icons" style="font-size:36px">account_circle</i>
                    </li>
                    <li class="list-group-item category">쇼핑정보</li>
                    <a href="mypage_coupon.jsp" class="list-group-item list-group-item-action">쿠폰함</a>
                    <a href="mypage_order.jsp" class="list-group-item list-group-item-action">주문내역</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">활동정보</li>
                    <a href="mypage_please.jsp" class="list-group-item list-group-item-action">조르기</a>
                    <a href="mypage_zzim.jsp" class="list-group-item list-group-item-action">찜한상품</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">나의정보</li>
                    <a href="mypage_manage.jsp" class="list-group-item list-group-item-action">회원정보관리</a>
                    <a href="mypage_moyoBus.jsp" class="list-group-item list-group-item-action">모여버스</a>
                    <a href="mypage_out.jsp" class="list-group-item list-group-item-action">회원탈퇴</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">문의/리뷰</li>
                    <a href="mypage_myqna.jsp" class="list-group-item list-group-item-action">문의내역</a>
                    <a href="mypage_review.jsp" class="list-group-item list-group-item-action">리뷰내역</a>
                </ul>
            </div>
            <div class="col-lg-9">
                <div class="jumbotron">
                    <h3>회원탈퇴</h3>
                </div>
                <form>
                    <div class="form-check">
                        <div class="설명">
                            회원탈퇴사유
                        </div>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option">
                            회원탈퇴 후 재가입을 위해서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option">
                            상품 구매 빈도가 낮아 이용할 필요가 없어서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option">
                            서비스 및 고객지원이 만족스럽지 못해서
                            </input>
                        </label>
                        <br>
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="option">
                            별다른 이유없이 탈퇴
                            </input>
                        </label>
                        <br>
                        <br>
                        <div class="설명">
                            탈퇴하시려는 사유를 입력해주세요.
                        </div>
                        <br>
                        <div class="form-check">
                            <textarea name="탈퇴사유" class="textarea"></textarea>
                        </div>
                        <br>
                        <div class="설명"><input type="checkbox" name="quit">
                            회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.
                        </div>
                        <div class="설명">
                            1. 탈퇴 이후에는 보유하신 쿠폰과 참여하신 이벤트의 응모 및 당첨 혜택이 모두 소멸됩니다.
                            <br>
                            2. 회원정보는 탈퇴 시 관련법령에 따라 보관 의무가 있는 경우를 제외하고는 즉시 삭제됩니다.
                            <br>
                            3. 전자상거래 등에서의 소비자보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금 결제및
                            재화 등의 공급에 관한 기록은 5년, 그리고 소비자의 불만 또는 분쟁처리에 관한 기록은 3년간 보존됩니다.
                            <br>
                            4. 탈퇴 이후에는 어떠한 방법으로도 삭제된 회원정보를 복원할 수 없습니다.
                        </div>
                        <br>
                        <button type="button" class="btn btn-outline-dark">탈퇴하기</button>
                    </div>
                </form>
            </div> 
        </div>
    </div>
</body>
</html>