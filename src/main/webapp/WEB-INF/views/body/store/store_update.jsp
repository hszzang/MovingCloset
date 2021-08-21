<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
	.img{width:100%; height:300px; margin:0 0 10px 10px; }
	span.a { display:inline; float:left; }
	#btnBuy, #basket, #wish{
		padding: 5%;
		border-radius: 5px;
		background-color: black;
		color: white;
		font-size: 1em;
		font-weight: bold;
		border: black solid 1px;
		outline: 0;
	}
	#basket, #wish{ background-color: white; color: black; }
	#btnBuy:hover{background-color:darkgray; border:#343A40;}
	#basket, #with:hover{border:gray;}
	
	#brandName ,#shoes ,#prodCount ,#price {
		font-size: 1em;
	}
	#brandName{ display: inline; }
	#prodName {font-size:1.5em;}
	#prodCount{text-align:right; vertical-align:center;}
	
	#sizeNum{ width:100%; height:40px; font-size:1em;}
    #sizeNum:focus{outline:none;}
    
	#btnReview{
		width:200px; height:40px;
		border-radius: 3px;
		background-color: black; color: white;
		outline: 0;	
	}
</style>
<style>
	body {font-family: Arial, Helvetica, sans-serif;}

	@-webkit-keyframes zoom {
	  from {-webkit-transform:scale(0)} 
	  to {-webkit-transform:scale(1)}
	}
	
	@keyframes zoom {
	  from {transform:scale(0)} 
	  to {transform:scale(1)}
	}
	
	/* The Close Button */
	.close {
	  position: absolute;
	  top: 100px;
	  right: 300px;
	  color: #f1f1f1;
	  font-size: 40px;
	  font-weight: bold;
	  transition: 0.3s;
	  
	}
	.close:hover,
	.close:focus {
	  color: #bbb;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	/* 100% Image Width on Smaller Screens */
	@media only screen and (max-width: 700px){
	  .modal-content {
		width: 100%;
	  }
	}
	a{ color:black; text-decoration: none; }
	a:hover{
		text-decoration: none;
		color:black;
	}
	button a, button a:hover{
		color: black; text-decoration:none;
	}
	
	#pages{
       	text-align:right;
		margin:2% 2% 3% 0;
    }
    #pageSel{
    	width:80px; height:40px;
    	border:lightgray solid 1px;
    	text-align:center; font-size:11pt;
    }
    #pgTotal{
    	color:gray; font-size: 10pt; 
    	margin:0 10px 0 10px;
    }
    .pageMove{
    	width:40px; height:40px;
    	border:none; padding:0;
    	color:white; font-size:10pt; font-weight:bold;}
    .pageMove:focus{outline:none;}
    #pmL{background-color:gray;}
    #pmR{background-color:black;}
    
    .container{
    	width:990px;
    }
    .update{
    	width:350px; height:40px; 
    }
    .updiv{
    	bottom-margin:30px;
    }
    #productDelete{
   		width:350px; height:40px; margin-top:10px;
   		border:orangered solid 1px; background-color:white; color:orangered;
    }
	</style>
	<script>
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
<title>Store</title>
</head>
<body>
	<div class="container" style="margin-top:10%;margin-bottom:3%;">
		<form name="updateFrm" method="post" enctype="multipart/form-data"
			action="<c:url value="/store/updateAction.do" />" >
			<input type="hidden" name="p_idx" value="${storeDetail.p_idx }"/>	
			<div class="row" style="height: 600px;">
				<div class="col-8 d-flex justify-content-center" >
					<div id="image_container">
						<img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" id="p_image"  />
					</div>
					<!--  
						<div class="col-6" style="padding:0;display:block;height:300px;border:black 1px;">
							<span class="a">
								<img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
							<span class="a">
								<img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
						</div>
						<div class="col-6" style="padding:0;display:block;height:300px;border:black 1px;">
							<span class="a">
								<img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
							<span class="a">
								<img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" class='img' class="rounded"/>
							</span>
						</div>
					-->
				</div>
				
				<div class="col-4" style="padding-left:3%; padding-top:5%;">
					<div id="brandName" class="updiv"><input class="update" name="p_brand" value="${ storeDetail.p_brand}" /></div>
					<div id="prodName" class="updiv"><input class="update" name="p_name" value="${storeDetail.p_name }" /></div>
					<div id="code" class="updiv"><input class="update" name="p_code" value="${storeDetail.p_code }" /> </div>
					<div id="price" class="updiv"><input class="update" name="p_price" value="${storeDetail.p_price }" /> </div>
					<input id="image" type="file" class="form-control" name="ofile" accept="image/*" onchange="setThumbnail(event);"
						style="width:350px;height:40px;margin-bottom:10px;"  />
						<input type="submit" id="productUpdate" style="width:350px;height:40px;background-color:black;color:white;" value="수정">
						<input type="submit" id="productDelete" value="상품삭제">						
						<!--  
						<button type="button" class="product" id="productDelete" onclick="javascript:location.href='/movingcloset/store/delete.do';">상품삭제</button>
						-->
					<br>
				</div>
			</div>
		</form>
	
					<!-- 
					<div class="row">
						<div class="col-11">
							<select name="size" id="sizeNum" style="border: solid lightgray 1px; border-radius:2px; padding:3px;">
								<option value=""diabled select hidden>사이즈</option>
								<option value="220">220</option>
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
								<option value="270">270</option>
								<option value="280">280</option>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-4" style="vertical-align:center; text-align:right; padding-top:5px;">
							<span id="prodCount">수량</span>
						</div>
						<div class="col-8">
							<button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
							<input type="text" id="quantity" value="1" style="border:none; width:50px; background-color: none;text-align:center;">
							<button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
						</div>
					</div>
					<hr />
					<br>
					<div>
					
					</div>
					<br> 
					<div>
						<span><button style="width: 45%;" id="basket"><a href="#">장바구니</a></button></span>
						<span><button style="width: 45%;" id="wish" onclick="location.href='#';">위시리스트 <i class="fa fa-heart" style="color: red;"></i></button></span>
					</div>
					 -->
	</div><br /><br /><br />
	
	<hr>

</body>
</html>