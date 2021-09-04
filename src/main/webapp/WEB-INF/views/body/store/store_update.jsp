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
	#prodName {font-size:1em;}
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
   		width:350px; height:40px; margin-top:10px; margin-bottom:10px;
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
		
		function delProduct(p_idx){
			if(confirm("정말 상품을 삭제하시겠습니까?")){
				location.href="/movingcloset/store/delete.do?p_idx=" + p_idx;
			}
		}
		
		function checkValidate(f){
			if(f.p_brand.value == ""){
				alert("브랜드를 입력하세요.");
				f.p_brand.focus();
				return false;
			}
			if(f.p_name.value ==""){
				alert("상품명을 입력하세요.");
				f.p_name.focus();
				return false;
			}
			if(f.p_code.value ==""){
				alert("상품코드를 입력하세요.");
				f.p_code.focus();
				return false;
			}
			if(f.p_price.value == ""){
				alert("상품가격을 입력하세요.");
				f.p_price.focus();
				return false;
			}
			if(f.p_ofile.value == ""){
				alert("상품사진을 첨부하세요.");
				f.p_ofile.focus();
				return false;
			}
		}
		/*
		function plusminus(${status.count}){
			//console.log("넘어온 값 "+id);
			var num = document.getElementsByClass("quantity");

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
		*/
	</script>
	<script>
		var arr1 = new Array();
		<c:forEach items="${sizes}" var="size">
			arr1.push("${size}");
		</c:forEach>
		console.log(arr1);
	</script>
	
	<script>
		var arr2 = new Array();
		<c:forEach items="${stocks}" var="stock">
			arr2.push("${stock}");
		</c:forEach>
		console.log(arr2);
		
		var test1 = '<c:out value="${size}"/>';
		console.log(test1);
		var test2 = '<c:out value="${list}"/>';
		console.log(test2);
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
					<h4>상품 수정</h4>
					<div id="brandName" class="updiv"><input class="update" name="p_brand" value="${ storeDetail.p_brand}" /></div>
					<div id="prodName" class="updiv"><input class="update" name="p_name" value="${storeDetail.p_name }" /></div>
					<div id="code" class="updiv"><input class="update" name="p_code" value="${storeDetail.p_code }" /> </div>
					<div id="price" class="updiv"><input class="update" name="p_price" value="${storeDetail.p_price }" /> </div>
					<div id="color" class="updiv"><input class="update" name="pd_color" value="${productDetail.pd_color }" /> </div>					
					<div id="flag" class="updiv"><input class="update" name="p_flag" value="${storeDetail.p_flag }" /> </div>
					<div id="tag" class="updiv"><input class="update" name="p_tag" value="${storeDetail.p_tag }" /></div>
					<input id="image" type="file" class="form-control" name="ofile" accept="image/*" value="${storeDetail.p_ofile }"
						onchange="setThumbnail(event);" style="width:350px;height:40px;margin-bottom:10px;"  />
					<div class="row">
						<div class="col-11">
						<table style="width:100%;">
							<thead>
								<tr>
									<th style="width:50%;text-align:center;">사이즈</th>
									<th style="width:50%;text-align:center;">재고량</th>
								</tr>
							</thead>
							<tbody>
								
								<c:forEach items="${sizes }" var="size" varStatus="status">
									<tr>
										<td style="text-align:center;">${size }
										<input type="hidden" name="sizes" value="${sizes[status.index] }" />
										</td>
										<td style="text-align:center;">
											<input type="text" id="quantity" name="stocks" value="${stocks[status.index] }" 
											style="border:lightgray solid 1px; width:100px; background-color:none;text-align:center;" />
										</td>
									</tr>
								</c:forEach>
										<!--  
											<button type="button" class="btn" class="plus" onclick="plusminus(${status.count});"><i class="fa fa-plus"></i></button>
											<input type="text" class="quantity" name="stocks" value="${stocks[status.index] }" style="border:none; width:50px; background-color: none;text-align:center;">
											<button type="button" class="btn" class="minus" onclick="plusminus(${status.count});"><i class="fa fa-minus"></i></button>
										-->	
							</tbody>
						</table>

							 <!--  
							<div class="col-8" style="width:45%;display:inline;">
								<button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
								<input type="text" id="quantity" value="1" style="border:none; width:50px; background-color: none;text-align:center;">
								<button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
							</div>
							-->
						</div>
					</div>
					<br>
						<input type="submit" id="productUpdate" style="width:350px;height:40px;background-color:black;color:white;" value="수정">
						<button type="button" class="product" id="productDelete" onclick="delProduct(${p_idx});">상품삭제</button>
						<button type="button" class="btn" style="border:lightgray solid 1px;width:350px;"
							onclick="javascript:location.href='/movingcloset/store/detail.do?p_idx=${p_idx}';">돌아가기</button>
				
				</div>
			</div>
		</form>
	
	</div><br /><br /><br /><br /><br />
	
	<hr><br /><br /><br /><br /><br />

</body>
</html>