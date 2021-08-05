<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="../resources/css/bootstrap.css" /> -->
<!-- <script src="../resources/jquery/jquery-3.6.0.js"></script> -->
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88444ee8320d4b09aa47995c55b34d58"></script>

<script> 
	$(document).ready(function(){
		$('.moyoDetail').hide();
		$(".moyoSimple").click(function(){
			$(".moyoDetail").slideToggle("slow");
		});
	});
	</script>

<style>

	.container .row {
		padding:10px;
		padding-left: 15px;
		padding-right: 15px;
	}
	#findMoyoBtn {
		background-color: #ff6c2f;
		color: white;
	}
	.moyoSimple {
		width:100%; height: 30%;
		cursor: pointer;
	}
	#moyoList .row {
		border-bottom: #ff6c2f solid 1px;
	}
	.simpleImg {
		width: 100px; height: 100px;
	}


</style>

</head>
<body>

<div class="container">
	
		<div class="row">
			<div class="col-8">
				<div class="row">
					<div class="input-group">
						<!-- 가입 시 입력한 주소가 기본값으로 들어감 -->
						<input type="text" placeholder="주소를 입력하세요" class="form-control" style="width: 500px;" />
						<button type="button" class="form-control" id="findMoyoBtn">모여 찾기</button>
					</div>
				</div>
				<div class="row">
					<div id="map" style="width:800px;height:600px;"></div>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								//지오로케이션으로 위치 받아올 것
								center: new kakao.maps.LatLng(37.4787305, 126.8781986), // 지도의 중심좌표
								level: 3, // 지도의 확대 레벨
								mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
							}; 
				
						// 지도를 생성한다 
						var map = new kakao.maps.Map(mapContainer, mapOption); 
				
						var positions = [
							{
								title: '현재 위치', 
								latlng: mapOption.center
							},
							{
								title: '안양천앞', 
								latlng: new kakao.maps.LatLng(37.478838, 126.876454)
							},
							{
								title: '5번출구앞', 
								latlng: new kakao.maps.LatLng(37.479660, 126.881949)
							},
							{
								title: '맥도날드앞', 
								latlng: new kakao.maps.LatLng(37.479927, 126.881119)
							}
						];
				
						for (var i = 0; i < positions.length; i ++) {
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map: map, // 마커를 표시할 지도
								position: positions[i].latlng // 마커의 위치
							});

							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content: positions[i].content // 인포윈도우에 표시할 내용
							});

							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						}

						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker, infowindow) {
							return function() {
								infowindow.open(map, marker);
							};
						}

						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
							return function() {
								infowindow.close();
							};
						}
					</script>
				</div>
			</div>
			<div id="moyoList" class="col-4">
				<div class="row" >
					<div class="moyoSimple">
						<img class="simpleImg" src="../resources/images/list/2.jpg"></a>
						Click to slide the panel down or up
					</div>
					<div class="moyoDetail">Hello world!</div>
				</div>

			</div>
		
		</div>
		
	
	
	</div>

</body>
</html>