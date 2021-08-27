<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
<style>


.input-form-wrap {
	width: 70%;
	height: 90%;
}

.input-form {

	padding-bottom: 40px;
	justify-content: center;

	align-items: center;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(255, 255, 255, 0.493);

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




</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="width: 50%;padding-bottom:0px; margin-top:50px;" align="center" >
		<div class="input-form ">
			<div class="input-form-wrap" style="text-align:center;padding-top:100px;padding-bottom:80px;">
				<h3><strong>Moving Closet</strong> <br /> 탈퇴가 완료되었습니다.</h3><br />
                   <br>
				<button type="button" class="btn btn-primary" id="mainbtn" onclick="location.href='./main.do';">홈페이지</button>
			</div>
		</div>
	</div>

</body>
</html>