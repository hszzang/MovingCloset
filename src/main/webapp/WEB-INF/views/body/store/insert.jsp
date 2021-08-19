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
</script>
<div class="container">
	<h5>상품 업로드</h5>
	
	<form name="insertFrm" method="post" enctype="multipart/form-data"
		onsubmit="return checkValidate(this);"
		action="<c:url value="/store/insertAction.do" />" >
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
				style="vertical-align:middle;">사진첨부</th>
			<td>
				<input type="file" class="form-control" 
					style="width:200px;" name="ofile"  />
			</td>
		</tr>
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		<!-- 각종 버튼 부분 -->
		
		<button type="submit" class="btn btn-danger">업로드</button>
		<button type="reset" class="btn">Reset</button>
		<button type="button" class="btn btn-warning" 
			onclick="javascript:location.href='/movingcloset/store.do';">리스트보기</button>
	</div>
	</form> 
</div>
	
</body>
</html>