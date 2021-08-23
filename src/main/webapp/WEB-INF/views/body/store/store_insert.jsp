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
		margin:200px 0 100px 0;
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
					<div id="brandName" class="updiv"><input class="insert" name="p_brand" value="${ productDTO.p_brand}" /></div>
					<div id="prodName" class="updiv"><input class="insert" name="p_name" value="${productDTO.p_name }" /></div>
					<div id="code" class="updiv"><input class="insert" name="p_code" value="${productDTO.p_code }" /> </div>
					<div id="price" class="updiv"><input class="insert" name="p_price" value="${productDTO.p_price }" /> </div>
					<input id="image" type="file" class="form-control" name="ofile" accept="image/*" value="${productDTO.p_ofile }"
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
								<c:forEach items="${sizes }" var="size" varStatus="status">
									<tr>
										<td style="text-align:center;">${size }</td>
										<td style="text-align:center;">
											<button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
											<input type="text" id="quantity" value="${stocks[status.index] }" style="border:none; width:50px; background-color: none;text-align:center;">
											<button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!--  
							<select name="size" id="sizeNum" style="border: solid lightgray 1px; border-radius:2px; padding:3px;width:40%;">
								<option diabled select hidden>사이즈</option>
									<c:forEach items="${sizes }" var="size">
										<option value="${size}">${size}</option>										
									</c:forEach>
							</select>
									<!-- 
									<option value="220">220</option>
									<option value="230">230</option>
									<option value="240">240</option>
									<option value="250">250</option>
									<option value="260">260</option>
									<option value="270">270</option>
									<option value="280">280</option>
									 -->
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
					<div class="row">
						<!-- 
						<div class="col-4" style="vertical-align:center; text-align:right; padding-top:5px;">
							<span id="prodCount">수량</span>
						</div>
						 -->
					</div>
						<input type="submit" id="productInsert" style="width:350px;height:40px;background-color:black;color:white;" value="등록">
						<button type="button" class="product" id="productDelete" onclick="delProduct(${p_idx});">상품삭제</button>
						<button type="reset" class="btn" style="border:lightgray solid 1px;width:80px;">리셋</button>
						<button type="button" class="btn" style="border:lightgray solid 1px;width:120px;"
							onclick="javascript:location.href='redirect:/store/detail.do?p_idx=${p_idx}';">돌아가기</button>
						<button type="button" class="btn" style="border:lightgray solid 1px;width:120px;"
							onclick="javascript:location.href='/movingcloset/store.do';">리스트가기</button>
				</div>
			</div>
		<!--  
		<input type="hidden" value="${productDTO.p_idx }" name="p_idx">
		<table class="table table-bordered">
		<colgroup>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">브랜드</th>
				<td>
					<input type="text" class="form-control" 
					style="width:200px;" name="p_brand"></input>
				</td>
			</tr>	
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">상품명</th>
				<td>
					<input type="text" class="form-control" 
						style="width:200px;" name="p_name"  />
				</td>
			</tr>
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">상품코드</th>
				<td>
					<input type="text" class="form-control" 
					style="width:200px;" name="p_code"></input>
				</td>
			</tr>	
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">상품 가격</th>
				<td>
					<input type="text" class="form-control" 
						style="width:200px;" name="p_price"  />
				</td>
			</tr>
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">분류</th>
				<td>
					<select name="p_flag" style="width:200px;">
						<option value="clothes">의류</option>
						<option value="shoes">신발</option>
						<option value="bags">가방</option>
						<option value="etc">잡화</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-center" 
					style="vertical-align:middle;">사진첨부</th>
				<td>
					<input type="file" class="form-control" 
						style="width:200px;" name="ofile"  />
				</td>
			</tr>
		</tbody>
		</table>
		
		<div class="row text-center" style="margin-left:70%;">
			
			<button type="submit" class="btn btn-danger">업로드</button>
			<button type="reset" class="btn">Reset</button>
			<button type="button" class="btn btn-warning" 
				onclick="javascript:location.href='/movingcloset/store.do';">리스트보기</button>
		</div>
		-->
	</form> 
</div>
	
</body>
</html>