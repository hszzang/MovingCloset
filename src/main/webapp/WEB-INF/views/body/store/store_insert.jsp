<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
	<style>
	.container{
		margin:200px 0 200px 0;
	}
	#brandName ,#shoes ,#prodCount ,#price {
		font-size: 1em;
	}
	#brandName{ display: inline; }
	#prodName {font-size:1em;}
	#prodCount{text-align:right; vertical-align:center;}
	.insert{
    	width:350px; height:40px; bottom-margin:30px;
    }
	.updiv{
    	width:100%; height:40px; bottom-margin:30px;
    }
    #productDelete{
   		width:350px; height:40px; margin-top:10px; margin-bottom:10px;
   		border:orangered solid 1px; background-color:white; color:orangered;
    }
    
	</style>
</head>
<body>
<script type="text/javascript">
	function checkValidate(f){
		if(f.p_brand.value==""){
			alert("브랜드를 입력하세요");
			f.p_brand.focus();
			return false;
		}
		if(f.p_name.value==""){
			alert("제품명을 입력하세요");
			f.p_name.focus();
			return false;
		}
		if(f.p_code.value==""){
			alert("상품코드를 입력하세요");
			f.p_code.focus();
			return false;
		}
		if(f.p_price.value==""){
			alert("가격을 입력하세요");
			f.p_price.focus();
			return false;
		}
		if(f.pd_color.value==""){
			alert("색상을 입력하세요");
			f.pd_color.focus();
			return false;
		}
		if(f.p_flag.value==""){
			alert("상품분류를 선택하세요");
			f.p_flag.focus();
			return false;
		}
		if(f.pd_size.value==""){
			alert("사이즈를 입력하세요");
			f.pd_size.focus();
			return false;
		}
		if(f.pd_stock.value==""){
			alert("재고량을 입력하세요");
			f.pd_stock.focus();
			return false;
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
<div class="container">
	<form name="insertFrm" method="post" enctype="multipart/form-data"
		onsubmit="return checkValidate(this);"
		action="<c:url value="/store/insertAction.do" />" >
		<input type="hidden" name="p_idx" value="${productDTO.p_idx }"/>	
			<div class="row" style="height: 600px;">
				<div class="col-8 d-flex justify-content-center" >
					<div id="image_container">
						<img src="../resources/upload/${productDTO.p_sfile }" alt="상품이미지" id="p_image"  />
					</div>
					<!--  
						<div class="col-6" style="padding:0;display:block;height:300px;border:black 1px;">
							<span class="a">
								<img src="../resources/upload/${productDTO.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
							<span class="a">
								<img src="../resources/upload/${productDTO.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
						</div>
						<div class="col-6" style="padding:0;display:block;height:300px;border:black 1px;">
							<span class="a">
								<img src="../resources/upload/${productDTO.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
							<span class="a">
								<img src="../resources/upload/${productDTO.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
						</div>
					-->
				</div>
				
				<div class="col-4" style="padding-left:3%; padding-top:5%;">
					<h5>상품 등록</h5>
					<div id="brandName" class="updiv"><input class="insert" name="p_brand" placeholder="브랜드" /></div>
					<div id="prodName" class="updiv"><input class="insert" name="p_name" placeholder="상품명" /></div>
					<div id="code" class="updiv"><input class="insert" name="p_code" placeholder="상품코드" /> </div>
					<div id="price" class="updiv"><input class="insert" name="p_price" placeholder="상품가격" /> </div>
					<div id="price" class="updiv"><input class="insert" name="pd_color" placeholder="상품색상" /> </div>
					<select name="p_flag" style="width:350px;height:40px;">
						<option value="" diabled select hidden>제품분류</option>
						<option value="의류">의류</option>
						<option value="신발">신발</option>
						<option value="가방">가방</option>
						<option value="잡화">잡화</option>
						<option value="뉴디">뉴디</option>
					</select>
					<div id="tag" class="updiv"><input class="insert" name="p_tag" placeholder="상품태그" /></div>
					<input id="image" type="file" class="form-control" name="ofile" accept="image/*" value="파일첨부"
						onchange="setThumbnail(event);" style="width:350px;height:40px;margin-bottom:10px;"  />
					<div class="row">
						<div class="col-11">
						<table>
							<thead>
								<tr>
									<th style="width:50%;text-align:center;">사이즈</th>
									<th style="width:50%;text-align:center;">재고량</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td style="text-align:center;">
											<input type="text" name="pd_size" 
											   style="border:lightgray solid 1px; width:170px; background-color:none;text-align:center;">
										</td>
										<td style="text-align:center;">
											<input type="text" name="pd_stock" 
											   style="border:lightgray solid 1px; width:170px; background-color:none;text-align:center;">
										<!--  
											<button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
											<input type="text" name="pd_stock" value="${stocks[status.index] }" style="border:none; width:50px; background-color: none;text-align:center;">
											<button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
										-->
										</td>
									</tr>
							</tbody>
						</table>

						</div>
					</div>
					<br>
						<input type="submit" id="productInsert" style="width:350px;height:40px;background-color:black;color:white;margin-bottom:10px;" value="등록">
						<button type="reset" class="btn" style="border:lightgray solid 1px;width:350px;height:40px;margin-bottom:10px;">리셋</button>
						<button type="button" class="btn" style="border:lightgray solid 1px;width:350px;height:40px;"
							onclick="javascript:location.href='/movingcloset/movingcloset/store.do';">돌아가기</button>
				</div>
			</div>

	</form> 
</div>
	
</body>
</html>