<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
	function plusminus(id){
		//console.log("넘어온 값 "+id);
		var num = document.getElementById("qIn");

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
	body {font-family: Arial, Helvetica, sans-serif;}
	
	#myImg {
	  border-radius: 3px;
	  cursor: pointer;
	  transition: 0.3s;
	}
	
	#myImg:hover {opacity: 0.7;}
	
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

	a{
		color:black; text-decoration: none;
		
	}
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
	</style>
<!-- 
브랜드명
상품명 가격
사이즈 230(아래쪽 삼각형)
수량 -1+
버튼 - 구매하기
버튼 - 장바구니 | 위시 하트모양

평균 평점 -> 숫자
체크박스 포토리뷰         버튼-글쓰기
라인한줄 긋기
평점 별표5개 한줄평 작성일 사진
                          사진은 클릭시 모달로 띄움

 -------------------------------------------------------------------------------------------------------------------->
 <style>
 	#wrapper{
 		width:60%; height:auto; border:none;
 		margin:100px 0  200px 20%;
 		padding: 50px 1% 0 1%;
 	}
 	#main{
 		width:1000px; height:480px; border:none; border-bottom:darkgray solid 1px;
 		padding:1% 1% 1% 1%; margin-bottom:100px;
 	}
 	#mainImg{ width:480px; height:auto; border:none; display:inline; float:left; padding:0 0 0 0; }
 	#img{ width:450px; height:450px; }
 	
 	#mainInfo{ 
 		width:480px; height:500px; 
 		border:none; border-top:black solid 2px;
 		float:left; display:inline;
 		padding:0 1% 0 1%;
 	}
 	#brand{width:auto; height:auto; float:left; font-weight:bold;}
 	#pName{
 		width:80%; height:auto; 
 		color:black; font-size:12pt; display:inline-block; float:left; padding:10px 0 0 0;}
 	#heartDiv{ width:20%; height:80px; border-left:darkgray solid 1px; display:inline-block; }
 	
 	#priceInfo{ display:block; }
 	#origPrice{font-size:12pt; color:gray; font-weight:lighter;}
 	#discountedPer{color:#FF6C2F; font-size:14pt;}
 	#discountedPrice{color:#FF6C2F; font-size:14pt; font-weight:bold;}
 	#won{color:darygray; font-size:10pt; font-weight:bold; }
 	
 	#benefits{
 		width:100%; height:auto; padding:1% 0 1% 25%;
 		background-color:whitesmoke; font-size:10pt; 
 	}
 	
 	.deliveryInfo{ color:darygray; font-size:10pt; padding:0 0 0 20px; }
 	
 	#options{width:100%; height:auto; margin-top:15px; display:inline-block;}
 	#selDiv{ width:70%; height:auto; display:inline-block;}
 	.select{
 		width:100%; height:50px; margin-bottom:5px; display:inline-block; border:lightgray solid 1px; 
 		text-size:12pt; color:gray;
 	}
 	#quantity{
 		width:29%; height:101px; display:inline; float:right; border:none;
 		padding:35px 10px 30px 15px;
 	}
 	.qBtns{ border:none; background-color:white;}
 	.qBtns:focus{outline:none;}
 	
 	#buttons{
 		width:100%; height:auto; padding:0;
 	}
 	.optBtn{
 		width:49.5%; height:50px; border:lightgray solid 1px; display:inline; font-weight:bold;
 	}
 	#cart{ background-color:white; color:black; }
 	#cart:focus{outline:none;}
 	#buy{ background-color:black; color:white; }
 	#buy:hover { background-color:orangered; color:white;}
 	
 	
 	#desc{ font-size:12pt; font-weight:bold; }
 	#details{
 		border:none;
 		width:60%; height:auto;
 		margin:5% 20% 15% 20%;
 	}
 	.dImgs{ width:100%; height:auto; border:none; }
 	
 	
 	#Review{ width:100%; height:auto; border:none; 
 		margin: 0 10% 10% 10%;
 	}
 	#reviewTitle{ display:inline; float:left; }
 	#btnReview{
 		width:200px; height:40px; display:inline; float:right; 
 		background-color:black; color:white; border:none;
 	}
 	#btnReview:focus{outline:none;}
 	
 </style>
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div id="mainImg">
				<img src="../resources/images/list/1.jpg" alt="상품이미지" id="img" />
			</div>
			
			<div id="mainInfo">
				<div id="nameInfo">
					<div id="pName">
						<span id="brand">Adidas</span><br />
						[아디다스] 오즈위고 트리플블랙 외 3종 택일 <br />
						(EE7773/FX6029/EE6999)
					</div>
					<div id="heartDiv">
					
					</div>
				</div>
				<div id="priceInfo">
					<span id="origPrice"><strike>119,000</strike></span><br>
                    <span id="discountedPer"><em>34%</em></span>
                    <span id="discountedPrice">79,000</span>
                    <span id="won">원</span>
				<hr />
				</div>
				<!-- 
				<div id="benefitInfo">
					<span id="benefit">혜택안내</span>
					<table>
						<tr>
							<td>적립금</td>
							<td>790원</td>
						</tr>
						<tr>
							<td>상품할인</td>
							<td>34% 79,000원</td>
						</tr><tr>
							<td>카드할인</td>
							<td><br />
								현대카드 77,420원 (2% 청구할인) <br />
								할부금 월 13,167원 (6개월 할부시) <br />
								<a href=""style="color:lightgray;">무이자카드 보기</a>
							</td>
						</tr>
					</table>
				</div>
				 -->
				<div id="benefits">
					<span>앱 가입 즉시</span>
					<span style="color:orangered; font-weight:bold;">15% 할인</span>
					<span>과 다양한 혜택 →</span>
				</div>
				<div>
					<hr />
					<span class="deliveryInfo" style="font-weight:bold;">배송정보</span>&nbsp;
					<span class="deliveryInfo">무료배송상품. 제주도 포함 도서/산간 지역 추가 배송비도 무료</span>
				</div>
				<div id="options">
					<div id="selDiv">
						<select name="color" class="select">
								<option value="" diabled select hidden>색상</option>
	                            <option value="EE7773">EE7773 화이트</option>
	                            <option value="FX6029">FX6029 베이지</option>
	                            <option value="EE6999">EE6999 블랙</option>
	                    </select>
	                    <select name="size" class="select">
	                    		<option value="" diabled select hidden>사이즈</option>
	                            <option value="240">240</option>
	                            <option value="250">250</option>
	                            <option value="260">260</option>
	                    </select>
	                </div>    
					<div id="quantity">
						<span>
							<button class="qBtns" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus" style="color:black;"></i></button>
							<input type="text" id="qIn" value="1" style="border:lightgray solid 1px; width: 50px; background-color: none; text-align:center;">
							<button class="qBtns" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus" style="color:black;"></i></button>
						</span>
					</div>
				</div>

				<div id="buttons">
					<button class="optBtn" id="cart">장바구니 담기</button>
					<input type="button" class="optBtn" id="buy" value="바로 구매하기" />
				</div>
			</div>
			
		</div>

		<div id="details">
			<div id="desc">상품설명</div>
			<img src="../resources/images/details/noti1.png" class="dImgs" />
			<img src="../resources/images/details/noti2.png" class="dImgs" />
			<img src="../resources/images/details/d1.png" class="dImgs" />
			<img src="../resources/images/details/d2.png" class="dImgs" />
			<img src="../resources/images/details/d3.png" class="dImgs" />
			<img src="../resources/images/details/noti3.png" class="dImgs" />
		</div>
		
		
		<div id="Reviews">
			<div id="reviewTitle">
				<h4>리뷰 (5)
					<span>
						<i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
						<i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
						<i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
						<i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
						<i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
					</span>
				</h4>
			</div>
				<!--  
			<div class="row" style="padding: 4%;">
				<div class="d-flex mr-auto" >
					<input type="checkbox" name="photocheck" id="photocheck" value="photocheck" class="form-check-input" style="zoom: 1.5;">
						<label for="photocheck" style="font-size: 24px;">포토리뷰</label>
				</div>
			</div>
				-->
			<div>
				<button id="btnReview" >리뷰쓰기</button>
			</div>
	
			<table class="table table-hover" style="border-top:black solid 1px; text-align: center; vertical-align:center;">
				<thead>
				<tr>
					<th style="width: 15%;">평점</th>
					<th style="width: 40%;">한줄평</th>
					<th style="width: 20%;">작성일</th>
					
				</tr>
				</thead>
				<tbody>
				<tr >
					<td>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					</td>
					<td style="text-align: center; vertical-align:center;">[240] 신발이 예뻐요!</td>
					<td>2021-07-31</td>
					<td>
						<img id="myImg" src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
						style="width: 100px; height: auto;"/>
					</td>
				</tr>				
				<tr >
					<td>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					</td>
					<td style="text-align: center;">[240] 신발이 예뻐요!</td>
					<td>2021-07-31</td>
					<td>
						<img id="myImg" src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
						style="width: 100px; height: auto;"/>
					</td>
				</tr>
				<tr >
					<td>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					</td>
					<td style="text-align: center;">[240] 신발이 예뻐요!</td>
					<td>2021-07-31</td>
					<td>
						<img id="myImg" src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
						style="width: 100px; height: auto;"/>
					</td>
				</tr>
				<tr >
					<td>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					</td>
					<td style="text-align: center;">[240] 신발이 예뻐요!</td>
					<td>2021-07-31</td>
					<td>
						<img id="myImg" src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
						style="width: 100px; height: auto;"/>
					</td>
				</tr>
				<tr >
					<td>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					<i class="fa fa-star" style="color:#FF6C2F;"></i>
					</td>
					<td style="text-align: center;">[240] 신발이 예뻐요!</td>
					<td>2021-07-31</td>
					<td>
						<img id="myImg" src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
						style="width: 100px; height: auto;"/>
					</td>
				</tr>
	
				</tbody>
			</table>
	 		<hr />
	 		
			<div id="pages">
				    <select name="pageSel" id="pageSel" placeholder="1">
						<option value="pageNum">1</option>
						<option value="pageNum">2</option>
						<option value="pageNum">3</option>
						<option value="pageNum">4</option>
						<option value="pageNum">5</option>
				    </select>
				    <span id="pgTotal">of 5</span>
				    <button class="pageMove" id="pmL"> < </button>
				    <button class="pageMove" id="pmR"> > </button>
				</div>
				<br />
			</div>



	</div>












<!------------------------------------------------------------------------------------------------  
	<div class="container" style="margin:10% 20% 0 20%;">
		<div class="row" style="height: 500px;">
			<div class="col-8 d-flex justify-content-center" >
			<span class="a">
				<img src="../resources/images/list/1.jpg" alt="상품이미지" id='img' />
			</span>
			</div>
			<div class="col-4" style="padding-left: 0%; padding-top: 1%;">
				

				
				<span id="brandName">NIKE</span><br>
				<br>

				<div class="row">
					<div class="col-6">
						<span id="prodName">상품명</span>&nbsp;&nbsp;&nbsp;
					</div>
					<div class="col-6">
						<span id="price">100,000</span>
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-6">
						<span id="shoes">사이즈</span>&nbsp;&nbsp;&nbsp;
					</div>
					<div class="col-6" >
						<select name="size" id="sizeNum" style="border: solid lightgray 1px; border-radius: 5px; padding: 3px;font-size: 25px;">
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
					<div class="col-6">
						<span id="prodCount">수량</span>&nbsp;&nbsp;&nbsp;
					</div>
					<div class="col-6">
						<button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
						<input type="text" id="quantity" value="1" style="border: none; width: 30px; background-color: none;">
						<button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
					</div>
				</div>

				<br>
				<div>
					<button id="btnBuy" style="width: 90%;"><a href="#" style="color: white;">구매하기</a> </button>
				</div><br> 
				<div>
					<span><button style="width: 45%;" id="basket"><a href="#">장바구니<i class="fas fa-shopping-cart" style="color:black"></i></a></button></span>
					<span><button style="width: 45%;" id="wish" onclick="location.href='#';">위시리스트 <i class="fa fa-heart" style="color: red;"></i></button></span>
				</div>
			</div>
			
		</div>
	</div><br /><br /><br />
	<hr>

-->
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<span class="close">&times;</span>
		<img class="modal-content" id="img01" />
		<div class="modaltext" style="text-align: center;">
			<br>
			<!-- 키, 몸무게, 발사이즈 -->
			<span>키</span>
			<span>몸무게</span>
			<span>발사이즈</span>
			<br><br>
			<!-- 해시태그 부분 -->
			<span>#정사이즈</span>
			<span>#흰색</span>
			<span>#예뻐요</span> 
		</div>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");
		
		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var img = document.getElementById("myImg");

		var modalImg = document.getElementById("img01");
		img.onclick = function(){
		  modal.style.display = "block";
		  modalImg.src = this.src;;
		}
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() { 
		  modal.style.display = "none";
		}
	</script>

</body>
</html>