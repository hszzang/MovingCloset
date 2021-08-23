<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movingcloset.util.CookieManager"%>    

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<style>

.container{padding-top: 5%; margin-bottom: 6%;}
.memberMore a {margin-left:12%; color:black;}
#loginLogo {width:100%; padding-bottom: 6%;}
.socialLogin {width: 70px; height:35px; 
			object-fit:cover; border-radius: 6px;}
#others{margin-top:25%;}
#klogin:hover{
	text-decoration: none;
}

</style>
<script type="text/javascript">
<!-- 
Kakao.init('da11b86bdef1f386718451384468c246');
Kakao.isInitialized();

function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            
            Kakao.Auth.setAccessToken(authObj.access_token);
            getInfo();
        },
        fail: function (err) {
            alert(JSON.stringify(err))
        }
    })
}
function getInfo() {
	Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
        var email = res.kakao_account.email;
        console.log(res);
            console.log(email);
         location.href='kakaoForm?userId='+email; 
        },
        fail: function (error) {
            alert(

                '카카오로그인에 실패했습니다 확인하세요 : ' + JSON.stringify(error))
        },
    })
};
 -->

/* https://kauth.kakao.com/oauth/authorize?client_id=d22c6a95056d752c59d1e73f60101ab7&redirect_uri=http://localhost:8082/movingcloset/movingcloset/login.do&response_type=code

		
카카오 인증완료 코드값 : TOkMZ1uxb_SYYYla41a0vrYVnpZ-ZEh4jNl7AyZ_sk-S4iS0bSf8UjsdOjYy4ZVRO1EBXwopb7kAAAF7SZ564g
*/	





<!-- Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: 'http://localhost:8082/movingcloset/movingcloset/login.do',
        success: function(res) {
          alert(JSON.stringify(res))
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
  
  
	
} -->

 function loginValidate(fn){
	if(!fn.userid.value){
		alert("아이디를 입력하세요");
		fn.user_id.focus();
		return false;
	}
	if(fn.userpw.value==""){
		alert("패스워드를 입력하세요");
		fn.user_pw.focus();
		return false;
}


function logout(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href = "../movingcloset/logout.do";
	}else{
		location.href = "#";
	}
	
}


</script>





</head>
<body>
<div class="container" style="margin-top:150px;">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4">
				<div class="login-wrap p-0">
					<img src="../resources/images/MovingClosetLogoBlack.png" id="loginLogo" />
					<%

					if(session.getAttribute("siteUserInfo")==null){
						// 체크박스 체크용 변수
						String cookieCheck = "";
						// 쿠키명이 loginId 인 쿠키값을 읽어온다.
						String loginId =CookieManager.readCookie(request, "loginId");
						System.out.println("쿠키들어왔나 "+loginId);
						request.setAttribute("loginId", loginId);
						// 빈값이 아니면
						if(!loginId.equals("")){
							// 체크용 변수에 checked를 할당
							cookieCheck = "checked";
							request.setAttribute("cookieCheck", cookieCheck);
							
						}
					
					%>
					<form name="loginForm" action="./loginAction.do" onsubmit="return loginValidate(this);" method="POST">
					
						<div class="form-group" >
							<input type="text" name="userid" value="${loginId }"  class="form-control" placeholder="Enter ID" required> 
							<!-- <input type="text" name="userid"  class="form-control" placeholder="Enter ID" required> -->
						</div>
						      
						<div class="form-group">
							<input id="password-field" name="userpw" type="password" class="form-control" placeholder="Enter Password" required>
						</div>
						
						<c:if test="${LoginNG != null }">
							<div style="text-align: center; color:red; font-weight: bold;">
								<span>${LoginNG }</span>
							</div>	
							<br />					   
						</c:if>        
						
						<div class="form-group">
							<button type="submit" class="form-control btn btn-dark submit px-3">LOG IN</button>
						</div>
						
						<div class="form-group d-md-flex">
							<div class="w-50">
								<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox" name="remember_id" value="Y"  ${cookieCheck }/>  
								<!-- <input type="checkbox" name="remember_id" value="Y" />  -->
								<span class="checkmark"></span>Remember Me
								</label>
							</div>
							<div class="w-50 text-md-right">
								<a id="klogin" href="https://kauth.kakao.com/oauth/authorize?client_id=d22c6a95056d752c59d1e73f60101ab7&redirect_uri=http://localhost:8082/movingcloset/movingcloset/kakaologin.do&response_type=code">
									<img class="socialLogin" src="../resources/images/login/kakao_login_medium.png" alt="" />
								</a>
								<!-- <a id="naverIdLogin_loginButton" href="javascript:void(0)">
								          <img class="socialLogin" src="../resources/images/login/naver_login.png" alt="" />
								</a> -->
								
							<div id="naver_id_login" style="text-align:center">
								<a href="${url}"> 
									<img class="socialLogin" src="../resources/images/login/naver_login.png" alt="" />
								</a>
							</div>

							</div>
						</div>
						
					</form>
					<p id="others" class="w-100 text-center">&mdash; Others &mdash;</p>
					<div class="memberMore d-flex text-center">
						<a href="./RegistMember.jsp" class="px-2 py-2 mr-md-1 rounded">회원가입</a>
						<a href="../movingcloset/findIdPw.do" class="px-2 py-2 ml-md-1 rounded">아이디/비밀번호찾기</a>
					</div>
					
					<% }else{ %>  
					
					
					<div class="form-group" style="text-align: center;font-size: 30px;font-weight: bold;">
						<span>${username }님 반갑습니다.</span>
					</div>
					<div class="form-group">
						<button type="button" class="form-control btn btn-dark submit px-3" onclick="logout();">LOG OUT</button>
					</div>
					
					<h3><a href="./naverlogout.do">로그아웃</a></h3>

					<%} %>
					
				</div>
			</div>
		</div>
	</div>
	




</body>
