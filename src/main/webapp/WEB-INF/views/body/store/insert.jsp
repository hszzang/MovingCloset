<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/css/bootstrap.css" />
	<script src="../resources/jquery/jquery-3.6.0.js"></script>
	
</head>
<body>

<div class="container">
	<h5>상품 업로드</h5>
	
	<form name="insertFrm" method="post" enctype="multipart/form-data"
		onsubmit="return writeValidate(this);"
		action="<c:url value="/mybatis/writeAction.do" />" >
		
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
				style="width:100px;" name="brand"></input>
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">상품명</th>
			<td>
				<input type="text" class="form-control" 
					style="width:100px;" name="name"  />
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">상품코드</th>
			<td>
				<input type="text" class="form-control" 
				style="width:100px;" name="code"></input>
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">상품 가격</th>
			<td>
				<input type="text" class="form-control" 
					style="width:100px;" name="price"  />
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">사진첨부</th>
			<td>
				<input type="file" class="form-control" 
					style="width:100px;" name="ofile"  />
			</td>
		</tr>
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		<!-- 각종 버튼 부분 -->
		
		<button type="submit" class="btn btn-danger">업로드</button>
		<button type="reset" class="btn">Reset</button>
		<button type="button" class="btn btn-warning" 
			onclick="location.href='/movingcloset/store.do';">리스트보기</button>
	</div>
	</form> 
</div>
	
</body>
</html>