<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/event_main.css?after" />  

<title>EVENT :: MovingCloset</title>

<style type="text/css">
.sectiontitle {
   text-align: center;
   padding-bottom: 10px;
   padding-top: 50px;
}

.sectiontitle h2 {
   font-size: 32px;
   font-weight: bold;
   text-transform: uppercase;
   margin-bottom: 10px;
   padding-bottom: 20px;
   position: relative;
}

.sectiontitle h2::after {
   content: '';
   position: absolute;
   display: block;
   width: 50px;
   height: 3px;
   background: #555555;
   bottom: 0;
   left: calc(50% - 25px);
}
</style>
</head>
<body>

<div class="container">
		<div class="sectiontitle" style="margin-top:150px;">
	    	<h2>EVENT</h2>
	    </div>
<div class="section" style="margin-top: 80px;">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<a>
					<img src="../resources/images/event_banner/blackfriday.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<img src="../resources/images/event_banner/moocleday.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<img src="../resources/images/event_banner/bucketlist.jpg">
				</a>
			</li class="slideitem">

			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide02" class="right"></label>
				</div>
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
				</div>
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide01" class="right"></label>
				</div>
			</div>

		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
		</ul>
	</div>
	
</div>

<div class="tab_content">

	<input type="radio" name="tabmenu" id="tab01" >
	<label for="tab01">진행 예정 이벤트</label>
	<input type="radio" name="tabmenu" id="tab02" checked>
	<label for="tab02">진행 중인 이벤트</label>
	<input type="radio" name="tabmenu" id="tab03">
	<label for="tab03">종료한 이벤트</label>

	<div class="conbox con1">
		<a>
			<img src="../resources/images/event_banner/ddaeng_event.jpg" style="width: 100%;">
		</a>
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
		<a>
			<img src="../resources/images/event_banner/summer_event.jpg" style="width: 100%;">
		</a>
	</div>
	<div class="conbox con2">
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
	</div>
	<div class="conbox con3">
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
		<a>
			<img src="../resources/images/event_banner/horror_event.jpg" style="width: 100%;">
		</a>
	</div>
	
</div>
</div>
</body>
</html>