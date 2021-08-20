<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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


/* https://kauth.kakao.com/oauth/authorize?client_id=d22c6a95056d752c59d1e73f60101ab7&redirect_uri=http://localhost:8082/movingcloset/movingcloset/login.do&response_type=code

		
카카오 인증완료 코드값 : TOkMZ1uxb_SYYYla41a0vrYVnpZ-ZEh4jNl7AyZ_sk-S4iS0bSf8UjsdOjYy4ZVRO1EBXwopb7kAAAF7SZ564g
*/	





Kakao.Auth.createLoginButton({
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
</script>





</head>
<body>
<div class="container" style="margin-top:150px;">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4">
				<div class="login-wrap p-0">
					<img src="../resources/images/MovingClosetLogoBlack.png" id="loginLogo" />
					<form name="loginForm" action="./loginAction.do" onsubmit="return loginValidate(this);" method="POST">
					
						<div class="form-group">
<%-- 							<input type="text" name="userid" value="<%=loginId %>"  class="form-control" placeholder="Enter ID" required> --%>
							<input type="text" name="userid"  class="form-control" placeholder="Enter ID" required>
						</div>
						
						<div class="form-group">
							<input id="password-field" name="userpw" type="password" class="form-control" placeholder="Enter Password" required>
						</div>
						
						<c:if test="${LoginNG not null }">
							<div>
								<span>${LoginNG }</span>
							</div>						
						</c:if>
						
						<div class="form-group">
							<button type="submit" class="form-control btn btn-dark submit px-3">LOG IN</button>
						</div>
						
						<div class="form-group d-md-flex">
							<div class="w-50">
								<label class="checkbox-wrap checkbox-primary">
	<%-- 							<input type="checkbox" name="remember_id" value="ch" <%=cookieCheck %> />  --%>
								<input type="checkbox" name="remember_id" value="ch" /> 
								<span class="checkmark"></span>Remember Me
								</label>
							</div>
							<div class="w-50 text-md-right">
								<a id="klogin" href="https://kauth.kakao.com/oauth/authorize?client_id=d22c6a95056d752c59d1e73f60101ab7&redirect_uri=http://localhost:8082/movingcloset/movingcloset/logintest.do&response_type=code">
									<img class="socialLogin" src="../resources/images/login/kakao_login_medium.png" alt="" />
								</a>
								<a id="naverIdLogin_loginButton" href="javascript:void(0)">
								          <img class="socialLogin" src="../resources/images/login/naver_login.png" alt="" />
								</a>
								<ul>

									<li onclick="naverLogout(); return false;">
								      <a href="javascript:void(0)">
								          <span>네이버 로그아웃</span>
								      </a>
									</li>
								</ul>
								
							</div>
						</div>
					</form>
					<p id="others" class="w-100 text-center">&mdash; Others &mdash;</p>
					<div class="memberMore d-flex text-center">
						<a href="./RegistMember.jsp" class="px-2 py-2 mr-md-1 rounded">회원가입</a>
						<a href="../movingcloset/findIdPw.do" class="px-2 py-2 ml-md-1 rounded">아이디/비밀번호찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "8dUO8AkoujmRhyEgT8yz", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8082/movingcloset/movingcloset/register.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,  
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		console.log("status : "+status);
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
</body>
</html>