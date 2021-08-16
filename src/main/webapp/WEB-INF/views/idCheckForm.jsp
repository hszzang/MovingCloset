<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String userid = request.getParameter("user_id"); //  사용자가 입력한것
boolean check = true;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>id_overapping.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

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
        form {
            outline: none;
        }
    </style>
    <script type="text/javascript">
	function idUse(f){
		
		<% if(check==false){%> 
			opener.document.registFrm.user_id.value = 
			document.overlapFrm.user_id.value;
		
			self.close();
		<%} %> 
			
	}
	function idUse2(){
		
		opener.document.registFrm.user_id.value = 
			document.overlapFrm.user_id.value;
		self.close();
		
		
	}
    
    
    </script>
</head>

<body>

	<% if(check==true){ %>
    <div class="container" style="" align="center">
        <div class="input-form-background row">
            <div class="input-form col-md-12 mx-auto">
                <div class="input-form-wrap">
                    <h2>아이디 중복확인</h2><br>

                    <h5>입력하신 아이디는 ${param.user_id } 입니다.</h5>
                    <h5 style="color: red;">중복된 아이디가 존재합니다.</h5>
                    <h5>새로운 아이디를 입력해주세요.</h5>
                    <form id="overlapFrm" name="overlapFrm" onsubmit="return idUse(this.form);">
                        <input type="text" name="user_id" size="20" class="form-control" style="width:250px;" placeholder="아이디를 입력해주세요."/>
                        <br><input type="submit"  class="btn btn-primary btn-lg btn-block" id="idsubmitBtn" value="아이디사용하기" />
                    </form>
                </div>
            </div>
        </div>
    </div>
	<% }else{  %>
    <div class="container" style="" align="center">
        <div class="input-form-background row">
            <div class="input-form col-md-12 mx-auto">
                <div class="input-form-wrap">
                    <h2 >아이디 중복확인</h2><br>

                    <h5>입력하신 아이디는 ${param.user_id } 입니다.</h5>
                    <h5>사용가능한 아이디입니다.</h5>
                    <form id="overlapFrm" name="overlapFrm">
                        <input type="hidden" name="user_id" value="${param.user_id }" class="form-control" />
                        <input type="button" class="btn btn-primary btn-lg btn-block" id="idsubmitBtn" value="아이디 사용하기" onclick="idUse2();" />
                    </form>
                </div>
            </div>
        </div>
    </div>
	<% } %>






</body>

</html>