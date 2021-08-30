<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moving Closet</title>
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



</style>

<script type="text/javascript">

function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var before = document.getElementById("r_image");
		before.remove();
		
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
		document.reviewFrm.ofileCheck.value="fileOK";
	};
	reader.readAsDataURL(event.target.files[0]);
}

</script>
</head>

<body>

	<div class="container" style="width: 50%;padding-bottom:0px;" align="center" id="regicon" >
		<div class="input-form ">
		<form action="">
			<div class="input-form-wrap" style="text-align:center;padding-top:100px;padding-bottom:80px;">
				<table>
					<tr>
						<td>평점</td>
						<td>${r_rate }</td>
					</tr>
					<tr>
						<td>원단</td>
						<td>${rt_fabric }</td>
					</tr>
					<tr>
						<td>착용감</td>
						<td>${rt_fit }</td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>${rt_size }</td>
					</tr>
					<tr>
						<td>마감처리</td>
						<td>${rt_finish }</td>
					</tr>
					<tr>
						<td>한줄평</td>
						<td>
							<textarea rows="" cols="">${r_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span id="counter" style="font-size: 20px;font-weight: normal; color: gray;">0/100</span>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<i class="fa fa-camera" id="photoIcon"></i>
					        <input id="btnPhoto" type="file" class="form-control" name="ofile" accept="image/*" 
								onchange="setThumbnail(event);" />	
							<input type="hidden" name="ofileCheck" />
						</td>
					</tr>
					<tr>
						<td>
							<div id="image_container" style="display: none;">
								<img src="../resources/upload/${reviewDTO.r_sfile }" alt="상품이미지" id="r_image" />
							</div>
						</td>
					</tr>
					
					
				</table>
				<button type="submit" class="btn btn-primary" id="mainbtn" onclick="location.href='/store/updateReviewAction.do';">리뷰 수정하기</button>
				
			</div>
		</form>
		</div>
	</div>

</body>
</html>