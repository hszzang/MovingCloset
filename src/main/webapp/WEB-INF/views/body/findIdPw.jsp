<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호찾기 :: MovingCloset</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style type="text/css">

	#findIdPwWrap {margin-top: 120px; margin-bottom: 80px;}
	.formwrap {margin-bottom: 40px; }
	.formwrap .form-control {width: 380px; height: 60px;}
	#centerline {width:0.5px; height:220px; border: 0.1px solid #e6e6e6; margin: 10px 70px;}
	#othersP {margin: 40px 0;}
	.social a {color: black;}
	.social a:hover{color: black;}
	.formwrap button {color: white; background-color: #ff6c2f; }
	.formwrap .form-control:focus {
		border-color: #FFFFFF;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
	}
	.section-title {
		text-align: center;
		padding-bottom: 50px;
		padding-top: 90px;
	}
	
	.section-title h2 {
		font-size: 32px;
		font-weight: bold;
		text-transform: uppercase;
		margin-bottom: 10px;
		padding-bottom: 20px;
		position: relative;
	}
	
	.section-title h2::after {
		content: '';
		position: absolute;
		display: block;
		width: 50px;
		height: 3px;
		background: #555555;
		bottom: 0;
		left: calc(50% - 25px);
	}
		
</style>

<script>

function findIdVali(fn){
	if(!fn.name.value){
		alert("이름을 입력하세요");
		fn.name.focus();
		return false;
	}
	if(fn.email.value==""){
		alert("이메일을 입력하세요");
		fn.email.focus();
		return false;
	}
	if(fn.email.value.indexOf("@") == -1
			|| fn.email.value.indexOf(".") == -1){
		alert("이메일 형식이 아닙니다.");
		fn.email.focus();
		return false;
	}
	return true;
}

function findPwVali(fn){
	if(!fn.userid.value){
		alert("아이디를 입력하세요");
		fn.userid.focus();
		return false;
	}
	if(fn.email.value==""){
		alert("이메일을 입력하세요");
		fn.email.focus();
		return false;
	}
	if(fn.email.value.indexOf("@") == -1
			|| fn.email.value.indexOf(".") == -1){
		alert("이메일 형식이 아닙니다.");
		fn.email.focus();
		return false;
	}
	
	return true;
}

function showSpinner(btn) {
	
	btn.disabled = true;
	btn.innerHTML = "<span class='spinner-border spinner-border-sm'></span> 잠시만 기다려주세요 ";
	btn.style.color = "black";
	document.findPwForm.submit();
}

</script>


</head>
<body>

<div class="container justify-content-center" id="findIdPwWrap">
	<div class="section-title">
		<h2>아이디 / 비밀번호찾기</h2>
	</div>
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-4">
			<div class="formwrap">
				<form name="findIdForm" action="../movingcloset/findId.do" onsubmit="return findIdVali(this);">
					<p class="w-100 text-center">&mdash; 아이디찾기 &mdash;</p>
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="이름" required>
					</div>
					<div class="form-group">
						<input name="email" type="text" class="form-control" placeholder="가입한 이메일" required>
					</div>
					<div class="form-group">
						<button type="submit" class="form-control btn submit px-3">아이디찾기</button>
					</div>
				</form>
				
			</div>
		</div>
		<div id="centerline"></div>
		<div class="col-md-6 col-lg-4">
			<div class="formwrap">
				<form name="findPwForm" action="../movingcloset/findPw.do" onsubmit="return findPwVali(this);">
				<p class="w-100 text-center">&mdash; 비밀번호찾기 &mdash;</p>
					<div class="form-group">
						<input type="text" name="userid" class="form-control" placeholder="ID" required>
					</div>
					<div class="form-group">
						<input name="email" type="text" class="form-control" placeholder="가입한 이메일" required>
					</div>
					<div class="form-group">
						<button type="submit" class="form-control btn submit px-3" onclick="showSpinner(this);">비밀번호찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<p class="w-100 text-center" id="othersP">&mdash; Others &mdash;</p>
	<div class="social d-flex justify-content-center">
		<a href="../movingcloset/login.do" class="px-2 py-2 mr-md-1 rounded">로그인</a>
		<a href="../movingcloset/register.do" class="px-2 py-2 ml-md-1 rounded">회원가입</a>
	</div>
</div>



</body>
</html>