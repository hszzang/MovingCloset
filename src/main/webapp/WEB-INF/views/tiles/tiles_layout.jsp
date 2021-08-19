<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- 타일즈에서 제공하는 taglib 지시어가 필요함 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="../resources/css/common.css"> -->

</head>
<body>

<!--  
	tiles-define.xml에서 설정한 템플릿 파일들을 해당 파일에서
	레이아웃으로 배치한다.
-->

<!--  
	아래의 주석 부분은 마이페이지에서 쓸 사이드바 부분
-->
<div class="container-fluid">
	<div class="wrap" >
		<tiles:insertAttribute name="top"/>
		<div class="content">
			<%-- <tiles:insertAttribute name="left"/> --%>
			<!-- <div class="page_content"> -->
				<tiles:insertAttribute name="body"/>
			<!-- </div> -->
		</div>
		<tiles:insertAttribute name="bottom"/>
	</div>
</div>
</body>
</html>