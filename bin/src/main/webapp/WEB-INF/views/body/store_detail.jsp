<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

	/* 
	팝업창에서 별점 매길때 쓸 함수
	function fillstar(id){

		var s1 = document.getElementById("star1");
		var s2 = document.getElementById("star2");
		var s3 = document.getElementById("star3");
		var s4 = document.getElementById("star4");
		var s5 = document.getElementById("star5");

		if(id=="star1"){
			if(s1.className=="fa fa-star-o"){
				s1.className = "fa fa-star";
			}else{
				s1.className = "fa fa-star-o";
			}
		}else if(id=="star2"){
			s1.className = "fa fa-star";
			s2.className = "fa fa-star";
		}else if(id=="star3"){
			s1.className = "fa fa-star";
			s2.className = "fa fa-star";
			s3.className = "fa fa-star";
		}else if(id=="star4"){
			s1.className = "fa fa-star";
			s2.className = "fa fa-star";
			s3.className = "fa fa-star";
			s4.className = "fa fa-star";
		}else if(id=="star5"){
			s1.className = "fa fa-star";
			s2.className = "fa fa-star";
			s3.className = "fa fa-star";
			s4.className = "fa fa-star";
			s5.className = "fa fa-star";
		}


	} */

</script>
<style>
	#img{
		"max-width:100%; height:auto;"

	}
	#btnBuy, #basket, #wish{
		padding: 5%;
		border-radius: 50px;
		background-color: black;
		color: white;
		font-size: 1.2em;
		font-weight: bold;
		border: solid 1px;
	}
	#btnBuy:hover {background-color: gray;}
	#basket:hover {background-color: lightgray;}
	#wish:hover {background-color: lightgray;}
	
	#basket, #wish{
		background-color: white;
		color: black;
		border-color: gray;

	}
	
	
	#btnReview{
		padding: 10px;
		border-radius: 8px;
		background-color: black;
		color: white;
		width:auto;

	}
	#brandName ,#prodName ,#shoes ,#prodCount ,#price {
		font-size: 1.8em;

	}
	
	span.a {
		display: inline;
	}
	
	#brandName{
		display: inline;
	}
	

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

 -->
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 5%;">
		<div class="row" style="height: 500px;">
			<div class="col-8 d-flex justify-content-center" >
			<span class="a">
				<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지" id='img' class="rounded"/>
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
					<button id="btnBuy" style="width: 90%;">구매하기</button>
				</div><br>
				<div>
					<span><button style="width: 45%;" id="basket">장바구니</button></span>
					<span><button style="width: 45%;" id="wish">위시리스트 <i class="fa fa-heart" style="color: red;"></i></button></span>
				</div>
			</div>
			
		</div>
	</div><br /><br /><br />
	<hr>

	<div class="container">
		<h2>평균 평점 : <span>99.99</span></h2>
		<div class="row" style="padding: 2%;">
			<div class="d-flex mr-auto">
				<input type="checkbox" name="photocheck" id="photocheck" value="photocheck">
					<label for="photocheck">포토리뷰</label>
			</div>
			<div class="d-flex ml-auto">
				<button id="btnReview">리뷰 쓰기</button>
			</div>
		</div>

		<table class="table table-hover" style="text-align: center;">
			<thead>
			<tr>
				<th style="width: 15%;">평점
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</th>
				<th style="width: 40%;">한줄평</th>
				<th style="width: 20%;">작성일</th>
				<th style="width: 250%;">리뷰(클릭시 모듈로 이동)</th>
			</tr>
			</thead>
			<tbody>
			<tr >
				<td>
				평점 
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</td>
				<td style="text-align: left;">신발이 예뻐요!</td>
				<td>2021-07-31</td>
				<td>
				<a href="">
					<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
					style="width: 100px; height: auto;"/>
				</a>
				</td>
			</tr>
			<tr >
				<td>
				평점 
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</td>
				<td style="text-align: left;">신발이 예뻐요!</td>
				<td>2021-07-31</td>
				<td>
				<a href="">
					<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
					style="width: 100px; height: auto;"/>
				</a>
				</td>
			</tr>
			<tr >
				<td>
				평점 
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</td>
				<td style="text-align: left;">신발이 예뻐요!</td>
				<td>2021-07-31</td>
				<td>
				<a href="">
					<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
					style="width: 100px; height: auto;"/>
				</a>
				</td>
			</tr>
			<tr >
				<td>
				평점 
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</td>
				<td style="text-align: left;">신발이 예뻐요!</td>
				<td>2021-07-31</td>
				<td>
				<a href="">
					<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
					style="width: 100px; height: auto;"/>
				</a>
				</td>
			</tr>
			<tr >
				<td>
				평점 
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				<i class="fa fa-star"></i>
				</td>
				<td style="text-align: left;">신발이 예뻐요!</td>
				<td>2021-07-31</td>
				<td>
				<a href="">
					<img src="../resources/images/feet-1840619_640.jpg" alt="상품이미지"
					style="width: 100px; height: auto;"/>
				</a>
				</td>
			</tr>

			</tbody>
		</table>
		<div>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
			  </ul>
		</div>
		</div>


	


</body>
</html>