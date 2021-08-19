<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id_overapping.jsp</title>
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

.form-control:focus, #idsubmitBtn:focus {
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#overlapFrm {
	margin: 4% 7%;
	width: 70%;
}

#idsubmitBtn {
	background-color: #ff6c2f;
	color: white;
	border: 0;
}


</style>

</head>

<body>

	<div class="container" style="margin-top: 200px;" align="center">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
					<h2>${param.user_id} 님 회원가입이 완료되었습니다.</h2>
						
				</div>
			</div>
		</div>
	</div>


</body>
</html>