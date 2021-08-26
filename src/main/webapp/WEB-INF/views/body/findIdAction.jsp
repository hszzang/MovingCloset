<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 :: MovingCloset</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>
.input-form-background {
	padding-top: 50px;
	padding-bottom: 50px;
}

.input-form-wrap {
	width: 70%;
	height: 90%;
}

.input-form {

	padding-bottom: 40px;
	justify-content: center;
	display: flex;
	align-items: center;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(255, 255, 255, 0.493);
	position: absolute;
	bottom: 1000px;
	right: 0px;
	background-color: white;
	color: black;
	padding-left: 20px;
	padding-right: 20px;
}

#mainbtn:focus {
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}



#mainbtn {
	background-color: #ff6c2f;
	color: white;
	border: 0;
	width:300px;height:50px;
}

#paramId{
    color: #ff6c2f;
    font-weight: bold;
}
#regicon {
  position: relative;
  font-family: Arial;
}

.input-form-wrap .social a {color:black;}



</style>

</head>

<body>

	<div class="container" style="width: 50%;" align="center" id="regicon">

			<div class="input-form ">
				<div class="input-form-wrap" style="text-align:center;padding-top:100px;padding-bottom:80px;">
					<c:if test="${empty findUserId }">
						<h3>입력한 정보에 해당하는 회원이 없습니다. </h3><br />
						<h3>회원가입 후 <strong>Moving Closet</strong>만의 이벤트를 즐겨보세요!</h3>	
	                    <br><br /><br />
						<button type="button" class="btn btn-primary" id="mainbtn" onclick="location.href='../movingcloset/register.do';">회원가입</button>
						
						<div class="social d-flex justify-content-center">
							<a href="../movingcloset/login.do" class="px-2 py-2 mr-md-1 rounded">로그인</a>
							<a href="../movingcloset/findIdPw.do" class="px-2 py-2 ml-md-1 rounded">아이디/비밀번호찾기</a>
						</div>
						
					</c:if>
					<c:if test="${not empty findUserId }">
						<h3>입력한 정보에 해당하는 아이디입니다.</h3><br />
						<h3>[&nbsp;<span id="paramId">${findUserId}</span>&nbsp;]</h3><br />
						<h3>로그인 후 <strong>Moving Closet</strong>을 이용해주세요.</h3>	
	                    <br><br /><br />
						<button type="button" class="btn btn-primary" id="mainbtn" onclick="location.href='../movingcloset/login.do';">로그인</button>
					
						<div class="social d-flex justify-content-center">
							<a href="../movingcloset/findIdPw.do" class="px-2 py-2 ml-md-1 rounded">아이디/비밀번호찾기</a>
							<a href="../movingcloset/register.do" class="px-2 py-2 ml-md-1 rounded">회원가입</a>
						</div>
						
					</c:if>
				</div>
			</div>

		
	</div>


</body>
</html>