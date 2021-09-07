<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="../resources/css/bootstrap.css" /> -->
<!-- <script src="../resources/jquery/jquery-3.6.0.js"></script> -->
<title>오시는 길 :: MovingCloset</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88444ee8320d4b09aa47995c55b34d58"></script>


<!-- Template Main CSS File -->
<link href="../resources/assets/css/style.css" rel="stylesheet">


<style>
	
    #wrapper{
       	width:70%; height:auto;
       	border: none;
       	margin: 120px 15% 200px 15%;
       	padding: 0;
    }
	
	.container .row {
		padding:10px;
		padding-left: 15px;
		padding-right: 15px;
	}

	.mapSimple {
		width:100%; height: 30%;
		cursor: pointer; vertical-align: top;
	}
	#mapList {
		height: 665px;
		overflow-y: auto;
	}
	#mapList .row {
		padding-top: 15px; padding-bottom: 25px;
	}
	.logoImg {
		width: 100%; height: 100px;
		object-fit:cover; margin-bottom: 7px;	
	}
	.form-control:focus {
		border-color: #FFFFFF;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
	}

	.section-title {
		margin-top: 200px;
	}


</style>

</head>
<body>

	<div class="container">
		
	   	<div class="section-title">
          <h2>오시는 길</h2>
        </div>
		<div class="row">
			<div class="col-8">
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
						map.setZoomable(false);
						
						// 지도에 확대 축소 컨트롤을 생성한다
						var zoomControl = new kakao.maps.ZoomControl();

						// 지도의 우측에 확대 축소 컨트롤을 추가한다
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
						var positions = [
							{
								title: 'MovingCloset',
								content: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-top: 5px; padding-bottom: 5px;">MovingCloset</b>',
								latlng: mapOption.center
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
			<div id="mapList" class="col-4">
				<div class="row mapRow" value="1" onclick=clickRow(this.value);>
					<div class="mapSimple">
						<div>
							<img class="logoImg" src="../resources/images/MovingClosetLogoBlack.png">
						</div>
						
						<ul>
							<li class="m01">
								<strong>지하철 이용시</strong> <br/>
								가산디지털단지역 6번출구로 나오셔서 좌측 횡단보도 건너 좌측으로 10m 가시면 삼거리 나옵니다. 삼거리에서 우측방향으로 직진하셔서 사거리 대각선 방향에 우리은행 건물 413호 입니다.
							</li>
							<li class="m02">
								<strong>버스 이용시</strong> <br/>
								21, 571, 652, 금천05 [디지털3단지월드벤쳐센터] 정류장에서 하차
							</li>
							<li class="m03">
								<strong>자가용 이용시</strong> <br/>
								서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전
							</li>
							
							<br><br/>
							<strong>[주소] 서울시 금천구 가산디지털2로 123 월드메르디앙2차 4층 413호</strong>
						</ul>

					</div>
				</div>



			</div>
		</div>
	</div>

</body>
</html>