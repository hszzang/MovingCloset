<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int DBPass=-1;

if(session.getAttribute("DBPass")==null){
	
}else{
	DBPass = (Integer)session.getAttribute("DBPass");	
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
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

.form-control:focus, #passsubmitBtn:focus {
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#overlapFrm {
	margin: 4% 7%;
	width: 70%;
}

#passsubmitBtn {
	background-color: #ff6c2f;
	color: white;
	border: 0;
}

form {
	outline: none;
}
</style>
<script type="text/javascript">
	function passUse(f) {
		<%if (DBPass == 0) {%> 
		
			self.close();
		<%}%> 
	}
	function passUse2() {
		opener.parent.location.reload();
		self.close();

	}
	
	function passcheck(frm){
		if(frm.userpass.value==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
</script>
</head>

<body>

	<c:choose>
		<c:when test="${DBPass eq -1 || DBPass eq 0 || DBPass eq null}">
			<div class="container" style="" align="center">
				<div class="input-form-background row">
					<div class="input-form col-md-12 mx-auto">
						<div class="input-form-wrap">
							<h2>비밀번호 확인</h2>
							<br>
							
							<c:if test="${DBPass eq 0 }">
								<h5 style="color: red;">비밀번호가 틀렸습니다.</h5>
							</c:if>
							
							
							<form id="overlapFrm" name="overlapFrm" onsubmit="passcheck(this.form);" action="../movingcloset/passcheck.do">
								<input type="password" name="userpass" size="20" class="form-control"
									style="width: 250px;" placeholder="비밀번호를 입력해주세요." /> <br>
								<input type="submit" class="btn btn-primary btn-lg btn-block"
									id="passsubmitBtn" value="확인" />
							
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container" style="" align="center">
				<div class="input-form-background row">
					<div class="input-form col-md-12 mx-auto">
						<div class="input-form-wrap">
							<h2>비밀번호 확인</h2>
							<br>
							<h5>확인되었습니다.</h5>
							<form id="overlapFrm" name="overlapFrm">
							<input type="button"
									class="btn btn-primary btn-lg btn-block" id="passsubmitBtn"
									value="확인" onclick="passUse2();" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

</body>

</html>