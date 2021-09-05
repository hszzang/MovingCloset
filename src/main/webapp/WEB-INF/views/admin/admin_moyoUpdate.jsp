<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모여! 신청폼 :: MovingCloset</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>

.container {
	margin-top: 200px;
	margin-bottom: 100px;
}
.input-form-background {
padding-top: 0px; padding-bottom: 50px; 

}

.input-form-wrap {
	width: 80%; height:auto; padding-top:50px;
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


#moyoFrm {
	margin: 0; width: 80%;
}

#moyoFrm *:not(input, select){
	border: 0;
}

.productImg {
	width: 400px; height: 400px;
	border: 1px solid lightgray;
	border-radius: 3px;
}



#moyoInfo {
	margin: 0 0 0 30px;

}

#moyoInfo h3 {
	margin-bottom: 20px; font-weight: bold;
}

#moyoInfo h6 {
	font-weight: bold;
}

.input-form-wrap h3 {
	margin-top: 20px; 
}
#moyoInfoWrap {
	display: flex; align-items: center;
	margin-top: -10px; margin-left:50px; padding:auto;
}

#moyoAgree {
	margin: 5%; margin-bottom: 8%;
}

#moyoFrm .form-control:focus, #moyoSubmitBtn:focus, #moyoAgree .form-control:focus{
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}

#moyoSubmitBtn {
	background-color: #ff6c2f; color: white;
	border: 0; height: 60px;
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

.section-title {
  text-align: center;
  padding-bottom: 30px; padding-top: 50px;
}

.section-title h2 {
  font-size: 32px;
  font-weight: bold;
  text-transform: uppercase;
  margin-bottom: 20px;
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
 
#fillMoyoInfoWrap {margin-bottom: -30px; margin-right: 30px; font-weight: bold;}

.moyoIn{
	width:350px; height:40px;
}
#p_image{
	width:400px; height:500px;
}
#moyoDesc{
	width:780px; height:40px;
}
</style>

<script type="text/javascript">
/*
	function checkLogin() {
		if(${empty siteUserInfo}) {
			alert("로그인 후 이용해주세요.");
			location.href="../movingcloset/login.do";
		}
	}
*/
	function moyoFormCheck() {
		
		var personalAgreeChk = document.getElementById("personalAgree");
		var cancelAgreeChk = document.getElementById("cancelAgree");
		
		if(document.moyoFrm.username.value == ""
				|| document.moyoFrm.mobile1.value == "" 
				|| document.moyoFrm.mobile2.value == "" 
				|| document.moyoFrm.mobile3.value == "" 
				|| document.moyoFrm.email1.value == "" 
				|| document.moyoFrm.email2.value == "") {
			alert("신청자 정보를 모두 입력해주세요.");
		}
		else if(personalAgreeChk.checked == false) {
			alert("개인정보수집약관에 동의해주세요.");
		}
		else if(cancelAgreeChk.checked == false) {
			alert("노쇼 약관에 동의해주세요.");
		}
		else {
			var checkSubmit = confirm("작성된 정보로 모여를 신청합니다.");
			if(checkSubmit == true) {
				document.moyoFrm.submit();
			}
		}
	}
	
	function emailSelect(obj) {
        var emailAdd = document.moyoFrm.email2;
        emailAdd.value = obj.value;

        if(emailAdd.value == "") {
            /*
            select에서 직접입력을 선택하면
            readOnly속성을 비활성화하고, 입력된 내용을 비워준다.
            */
            emailAdd.readOnly = false;
        }
        else {
            /*
            특정 도메인을 선택하면 
            선택한 도메인을 입력하고, readOnly속성은 활성화한다.
            */
            emailAdd.readOnly = true;
        }
    }

    function phoneFocus(num, obj, nextObj){
        var nextobj = document.getElementsByName(nextObj)[0];
        if(obj.value.length >= num) {
            nextobj.focus();
        }
    }
    
	function fillMoyoInfos(chkbox) {
		
		if(chkbox.checked == true) {
			
			var emailArr = "${memberDTO.email }".split("@");
			document.moyoFrm.username.value = "${memberDTO.name }";
			document.moyoFrm.mobile1.value = "${memberDTO.phone }".substring(0, 3);
			document.moyoFrm.mobile2.value = "${memberDTO.phone }".substring(4, 8);
			document.moyoFrm.mobile3.value = "${memberDTO.phone }".substring(9, 13);
			document.moyoFrm.email1.value = emailArr[0];
			document.moyoFrm.email2.value = emailArr[1];
		}
		else if(chkbox.checked == false) {
			document.moyoFrm.username.value = "";
			document.moyoFrm.mobile2.value = "";
			document.moyoFrm.mobile3.value = "";
			document.moyoFrm.email1.value = "";
		}
	}
	
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var before = document.getElementById("p_image");
			before.remove();
			
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

</script>

</head>
<body onload="checkLogin();">

	<div class="container">
		<div class="section-title">
		    <h2>모 여 수 정!</h2>
	    </div>
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<div class="input-form-wrap">
				
					<div id="moyoInfoWrap">
						<form name="moyoInsertFrm" method="post" enctype="multipart/form-data" 
							action="<c:url value="/movingcloset/adminmoyoupdateact.do" />" >
							<input type="hidden" name="m_idx" value="${moyoDTO.m_idx }"/>
							
							<div style="display:inline;float:left;margin-bottom:30px;">
								<div id="image_container" style="width:400px;height:500px;">
									<img src="../resources/upload/${moyoDTO.m_sfile }" alt="상품이미지" id="p_image"  />
									 <%-- c:if test="${empty moyo.m_sfile }">
										<img class="productImg" src="../resources/images/list/${moyoDTO.m_idx }.jpg"  id="p_image"/>
									</c:if>
									<c:if test="${not empty moyo.m_sfile }">
										<img class="productImg" src="../resources/upload/${moyoDTO.m_sfile }" id="p_image" />
									</c:if--%>
								</div>
								<span style="display:inline; float:left;">
									<input id="imgIn" class="moyoIn" type="file" name="ofile" onchange="setThumbnail(event);" style="display:block;"/>
									<input type="submit" id="moyoInsert" style="width:400px;height:40px;background-color:black;color:white;margin-bottom:10px;display:block;" value="등록">
									<button type="reset" class="btn" style="border:lightgray solid 1px;width:400px;height:40px;margin-bottom:10px;display:block;">리셋</button>
									<button type="button" class="btn" style="border:lightgray solid 1px;width:400px;height:40px;display:block;"
										onclick="javascript:location.href='/movingcloset/movingcloset/adminmoyo.do';">돌아가기</button>
								</span>
							</div>
							
							<fmt:parseDate value="${moyoDTO.m_dday }" var="strmdday" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${strmdday }" var="frmmdday" pattern="yyyy. MM. dd"/>
                            <fmt:parseDate value="${moyoDTO.m_start }" var="strmstart" pattern="yyyy-MM-dd HH:mm:ss"/>
	                        <fmt:formatDate value="${strmstart }" var="frmmstart" pattern="yyyy. MM. dd"/>
	                        <fmt:parseDate value="${moyoDTO.m_end }" var="strmend" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${strmend }" var="frmmend" pattern="yyyy. MM. dd"/>
                                            	                                 	
							<div id="moyoInfo" style="display:inline;float:left;" >
								<input class="moyoIn" name="m_name" type="text" value="${moyoDTO.m_name }" /><br />&mdash;
								<h6>모집시작</h6><input class="moyoIn" name="m_start" type="text" value="${frmmstart }" /><br />&mdash;
								<h6>모집마감</h6><input class="moyoIn" name="m_end" type="text" value="${frmmend }" /><br />&mdash;
								<h6>모임일자</h6><input class="moyoIn" name="m_dday" type="text" value="${frmmdday }" /><br />&mdash;
								<h6>모일장소</h6><input class="moyoIn" name="m_addr" type="text" value="${moyoDTO.m_addr }" /><br />&mdash;
								<h6>목표인원</h6><input class="moyoIn" name="m_goal" type="text" value="${moyoDTO.m_goal }" /><br />&mdash;
								<h6>마감일</h6><input class="moyoIn" name="m_dday" type="text" value="${moyoDTO.m_dday }" /><br />&mdash;
								<h6>모여현황</h6><select class="moyoIn" name="m_status" id="status" onchange="selectOrder(this)" >
			                        	<option value="" diabled select hidden>${moyoDTO.m_status }</option>
			                            <option value="성공">성공</option>
			                            <option value="실패">실패</option>
			                            <option value="준비">준비</option>
			                            <option value="진행">진행</option>
			                            <option value="종료">종료</option>
			                    </select>
							</div>
							<div style="margin-top:30px;">
								<!--  <h7>공지사항</h7> -->
								<input id="moyoDesc" name="m_desc" value="${moyoDTO.m_desc }" type="text" /><br />
								<input type="hidden" name="m_lat" value="${moyoDTO.m_lat }" />
								<input type="hidden" name="m_lon" value="${moyoDTO.m_lon}" />
							</div>	
						</form>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
	
</body>
</html>


