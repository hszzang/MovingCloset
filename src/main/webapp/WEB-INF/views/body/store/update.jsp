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
<script>
	function plusminus(id){
		//console.log("넘어온 값 "+id);
		var num = document.getElementById("quantity");

		if(id=="minus"){ 
			if(num.value <= 1){
				num.value = 1;
			}else{
				num.value = parseInt(num.value) - 1;
			}
		}
		
		if(id=="plus"){ 
			num.value = parseInt(num.value) + 1;
		}
		
	}

	$(function(){
		$('#btnReview').click(function(){

			var child;
			child = window.open("./reviewPage.do", "reviewpopup", "height:500px, width:250px");
		});

	});
</script>

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
	
	.myImg {
	  border-radius: 5px;
	  cursor: pointer;
	  transition: 0.3s;
	}
	.myImg:hover {opacity: 0.7;}
	
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 100px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
	}
	
	/* Modal Content (image) */
	.modal-content {
	  margin: auto;
	  display: block;
	  width: 80%;
	  max-width: 700px;
	}
	
	/* Caption of Modal Image */
	#caption {
	  margin: auto;
	  display: block;
	  width: 80%;
	  max-width: 700px;
	  text-align: center;
	  color: #ccc;
	  padding: 10px 0;
	  height: 150px;
	}
	
	/* 애니메이션 효과 있는 부분 주석처리함 */
	/* Add Animation */
	/* .modal-content, #caption {  
	  -webkit-animation-name: zoom;
	  -webkit-animation-duration: 0.6s;
	  animation-name: zoom;
	  animation-duration: 0.6s;
	} */
	
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

	.modaltext{
		color: white;
		word-spacing: 20px;
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
    
	</style>
<title>Store</title>
</head>
<body>
	<div class="container" style="margin-top:10%;margin-bottom:3%;">
		<div class="row" style="height: 600px;">
			<div class="col-8 d-flex justify-content-center" >
				<div class="col-6" style="padding:0;display:block;height:300px;">
					<span class="a">
						<img src="../resources/images/details/1.1.png" alt="상품이미지" class='img' class="rounded"/>
					</span>
					<span class="a">
						<img src="../resources/images/details/1.2.png" alt="상품이미지" class='img' class="rounded"/>
					</span>
				</div>
				<div class="col-6" style="padding:0;display:block;height:300px;">
					<span class="a">
						<img src="../resources/images/details/1.3.png" alt="상품이미지" class='img' class="rounded"/>
					</span>
					<span class="a">
						<img src="../resources/images/details/1.4.png" alt="상품이미지" class='img' class="rounded"/>
					</span>
				</div>
				
			</div>
			
			<div class="col-4" style="padding-left:3%; padding-top:5%;">
				<div id="brandName">Converse</div>
				<div id="prodName">척 70 클래식 로우 화이트</div>&nbsp;&nbsp;&nbsp;
				<div id="price">&nbsp;85,000원</div>
				<br>

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
					<button id="btnBuy" style="width:92%;"><a href="#" style="color:white;">구매하기</a> </button>
				</div><br> 
				<div>
					<span><button style="width: 45%;" id="basket"><a href="#">장바구니</a></button></span>
					<span><button style="width: 45%;" id="wish" onclick="location.href='#';">위시리스트 <i class="fa fa-heart" style="color: red;"></i></button></span>
				</div>
			</div>
			
		</div>
	</div><br /><br /><br />
	
	<hr>

</body>
</html>