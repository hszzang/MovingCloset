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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- geocoder를 사용하기 위해 api key 뒤에 &libraries=services 를 붙여준다.-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88444ee8320d4b09aa47995c55b34d58&libraries=services"></script>

<style>

	.container {
		margin-top: 95px;
		margin-bottom: 30px;
	}
	.container .row {
		padding:10px;
		padding-left: 15px;
		padding-right: 15px;
	}
	#findMoyoBtn {
		background-color: white; color: #ff6c2f;
		border: #ff6c2f 1px solid;
	}
	.moyoSimple {
		width:100%; height: 30%;
		cursor: pointer; vertical-align: top;
	}
	#moyoList {
		height: 665px;
		overflow-y: auto;
	}
	#moyoList .row {
		padding-top: 15px; padding-bottom: 25px;
		border-bottom: #ff6c2f solid 1px;
	}
	.simpleImg {
		width: 100%; height: 170px;
		object-fit:cover; margin-bottom: 7px;	
	}
	.form-control:focus {
		border-color: #FFFFFF;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
	}
	.moyoMax {
		font-weight: bold; font-size: 1.25em;
	}
	.badge {
		background-color: white; color: #ff6c2f; 
		border: #ff6c2f 1px solid;
	}
	.moyoDetail {
		padding: 10px 0;
	}

	.moyoDetail h6 {
		font-weight: 1.1em; margin-top: 10px;
	}

	.moyoDetail .moyoFormBtn {
		background-color: #ff6c2f; color: white; 
	}
	
	.section-title {
	  text-align: center;
	  padding-bottom: 30px; padding-top: 50px;
	}
	
	.section-title h2 {
	  font-size: 32px;
	  font-weight: bold;
	  text-transform: uppercase;
	  margin-bottom: 20px;
	  padding-bottom: 20px;
	  position: relative;
	}
	
	.section-title h2::after {
	  content: '';
	  position: absolute;
	  display: block;
	  width: 50px;
	  height: 3px;
	  background: #555555;
	  bottom: 0;
	  left: calc(50% - 25px);
	}
	
	#inputLocation {
		width: 100%;
		padding-right: 0;
		margin-right: 0;
	}
	
	#inputLocation .form-control:focus {
		border-color: #FFFFFF;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
	}
	
</style>
<script> 

	$(document).ready(function(){
		$('.moyoDetail').hide();
		// $(".moyoSimple").click(function(){
		// 	$(".moyoDetail").slideToggle("slow");

		// });
		$(".moyoRow").click(function(){
			$(".moyoDetail").slideToggle("slow");

			// $("#moyoList").css("overflow-y", "hidden");
			// $(".moyoRow").not(this).css("display", "none");
			
			if($(".moyoDetail").is(":hidden")){
				// $("#moyoList").css("overflow-y", "scroll");
				$(".moyoRow").not(this).slideDown("fast");
				$(".moyoToggleArrow").text('keyboard_arrow_down');
			} 
			else {
				// $("#moyoList").css("overflow-y", "hidden");
				$(".moyoRow").not(this).slideUp("fast");
				$(".moyoToggleArrow").text('keyboard_arrow_up');
				// $(".moyoRow").not(this).css("display", "none");
			}
		});
	});
	
// 	var nowLat, nowLon;
	function getNowLocation() {
		
		if(navigator.geolocation) {
			console.log("Geolocation API를 지원합니다.");
			
			/*
			옵션 항목은 3개의 값을 가진 전역객체를 사용한다.
			enableHighAccurcy : 정확도를 결정하는 Boolean타입의 값
			timeout : 위치값을 장치로 받을 때까지의 대기시간(1000분의 1초)
			maximumAge : 캐시된 위치값을 반환받을 수 있는 대기시간. 
				0을 지정하면 캐시값을 사용하지 않고 항상 현재 위치값을 수집함.
			*/
			var options = {
					enableHighAccurcy:true,
					timeout:5000,
					maximumAge:3000
			};
			navigator.geolocation.getCurrentPosition(showPosition, showError, options);
			
			console.log(document.moyoAddrFrm.nowLat.value);
			console.log(document.moyoAddrFrm.nowLon.value);
		}
		else {
			console.log("이 브라우저는 Geolocation API를 지원하지 않습니다.");
		}
		
	}

	//위치를 찾았을 때의 콜백메소드
	var showPosition = function (position) {
		
		//콜백된 매개변수를 통해 위도, 경도값을 얻어온다.
// 		nowLat = position.coords.latitude;
// 		nowLon = position.coords.longitude;
		
// 		console.log(position.coords.latitude);
// 		console.log(nowLat);
		
		document.moyoAddrFrm.nowLat.value = position.coords.latitude;
		document.moyoAddrFrm.nowLon.value = position.coords.longitude;

		document.moyoAddrFrm.submit();
		
// 		panTo();
		
	}

	//위치를 찾지 못했을 때의 콜백메소드
	var showError = function (error) {
		
		switch(error.code) {
			case error.UNKNOWN_ERROR:
				console.log("알 수 없는 오류 발생"); break;
			case error.PERMISSION_DENIED:
				console.log("권한이 없습니다."); break;
			case error.POSITION_UNAVAILABLE:
				console.log("위치 확인불가"); break;
			case error.TIMEOUT:
				console.log("시간초과"); break;
		}
		
		alert("위치 호출에 실패하였습니다.");
	}

</script>



</head>
<body>

<!-- movingcloset geolocation api key : AIzaSyCuUkjkCmZ7UirvN0Vhs0Q3VmgcIbEl_N0 -->

	<div class="container">
	
		<div class="section-title">
		    <h2>모 여 !</h2>
	    </div>
		<div class="row">
			<div class="col-8">
				<form action="" name="moyoAddrFrm">
				<div class="row input-group form-inline" id="inputLocation">
					<input type="hid den" name="nowLat" value="${nowLat }" />
					<input type="hid den" name="nowLon" value="${nowLon }" />
					<input type="hid den" name="myAddr" class="wantGetLatLon" value="${myAddr }" />
					<button type="button" class="form-control" onclick="getAddressLatLon();">
			        	<i class="material-icons">home</i>
			        </button>
					<button type="button" class="form-control" onclick="getNowLocation();">
			        	<i class="material-icons">my_location</i>
			        </button>
					<!-- 가입 시 입력한 주소가 기본값으로 들어감 -->
					<input type="text" placeholder="주소를 입력하세요" class="form-control wantGetLatLon" 
						style="width:330px;" />
					<button type="button" class="form-control" id="findMoyoBtn" onclick="getAddressLatLon();">모여 찾기</button>
				</div>
				</form>
				<div class="row">
					<div id="map" style="width:800px;height:600px;"></div>
					<script>
					
						var centerLat = document.moyoAddrFrm.nowLat.value;
						var centerLon = document.moyoAddrFrm.nowLon.value;
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								//지오로케이션으로 위치 받아올 것
								center: new kakao.maps.LatLng(centerLat, centerLon), // 지도의 중심좌표
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
						
						function panTo() {
							
							
							console.log(nowLat);
							console.log(nowLon);
							
						    // 이동할 위도 경도 위치를 생성합니다 
						    var moveLatLon = new kakao.maps.LatLng(nowLat, nowLon);
						    
						    // 지도 중심을 부드럽게 이동시킵니다
						    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
						    map.panTo(moveLatLon);       
						    
						    positions.splice(0, 1, {title : '현재 위치', latlng: moveLatLon});
						    
							var marker = new kakao.maps.Marker({
								map: map, // 마커를 표시할 지도
								position: moveLatLon // 마커의 위치
							});

							var infowindow = new kakao.maps.InfoWindow({
								content: positions[i].content // 인포윈도우에 표시할 내용
							});

							kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

						}        
				
						var positions = [
							{
								title: '중심 위치', 
								latlng: mapOption.center,
								content: '중심 위치입니다.',
							},
							{
								title: '안양천앞', 
								latlng: new kakao.maps.LatLng(37.478838, 126.876454),
								content: '중심 위치입니다4.'
							},
							{
								title: '5번출구앞', 
								latlng: new kakao.maps.LatLng(37.479660, 126.881949),
								content: '중심 위치입니다3.'
							},
							{
								title: '맥도날드앞', 
								latlng: new kakao.maps.LatLng(37.479927, 126.881119),
								content: '중심 위치입니다2.'
							}
						];
						
						var selectedMarker = null;
				
						for (var i = 0; i < positions.length; i ++) {
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map: map, // 마커를 표시할 지도
								position: positions[i].latlng // 마커의 위치
							});

							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content: positions[i].content, // 인포윈도우에 표시할 내용
								removable : true
							});

							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
// 							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
						
						var geocoder = new kakao.maps.services.Geocoder();

						function getAddressLatLon() {
							
							var addrStr = document.getElementsByClassName("wantGetLatLon")[0].value;
							if(addrStr == "") {
								addrStr = document.getElementsByClassName("wantGetLatLon")[1].value;
							}
							else {
								alert("올바른 주소를 입력해주세요.")	
							}
							
							console.log(addrStr);
							
							geocoder.addressSearch(addrStr, function(result, status) {
	
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
	
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							        console.log(result[0].y);
							        document.moyoAddrFrm.nowLat.value = result[0].y;
							        document.moyoAddrFrm.nowLon.value = result[0].x;
							        
							        document.moyoAddrFrm.submit();
	
							     }
							});
						}
						// 주소로 좌표를 검색합니다
						
					</script>
				</div>
			</div>
			<div id="moyoList" class="col-4">
				<div class="row moyoRow" id="moyoRow-1">
					<div class="moyoSimple">
						<div style="text-align: right;"><i class="material-icons moyoToggleArrow">keyboard_arrow_down</i></div>
						<div>
							<img class="simpleImg" src="../resources/images/list/2.jpg"></a>
						</div>
						<div>
							<h5><span class="badge">D-2</span> 나이키 시즌오프 팝업스토어</h5>
							<span>2021</span>년 <span>08</span>월 <span>05</span>일에 모여 !

							<h6 style="text-align: right;">모일 인원수 <span class="moyoMax">100</span> 명</h6>
							<div style="font-size: 0.75em; margin-top: -15px;">달성률</div>
							<div class="progress">
								<div class="progress-bar bg-warning" style="width:70%; color:white;">70%</div>
							</div>
						</div>
						<div class="moyoDetail">
							<button type="button" class="form-control moyoFormBtn" >모여 !</button>
							<h6>📌 모집기간</h6> 2021.08.01 - 2021.08.03 <br />&mdash;
							<h6>📌 모임일자</h6> 2021.08.05 목요일 <br />&mdash;
							<h6>📌 모일장소</h6> 서울시 금천구 가산동 426-5 월드메르디앙 앞 <br />&mdash;
							<h6>📌 판매자 공지사항</h6> 안녕하세요 나이키입니다. 안녕하세요 나이키입니다.  <br />&mdash;
						</div>
					</div>
				</div>
				<div class="row moyoRow">
					<div class="moyoSimple">
						<div>
							<div style="text-align: right;"><i class="material-icons moyoToggleArrow">keyboard_arrow_down</i></div>
							<img class="simpleImg" src="../resources/images/list/3.jpg"></a>
						</div>
						<div>
							<h5><span class="badge">D-2</span> 나이키 시즌오프 팝업스토어</h5>
							<span>2021</span>년 <span>08</span>월 <span>05</span>일에 모여 !

							<h6 style="text-align: right;">모일 인원수 <span class="moyoMax">100</span> 명</h6>
							<div style="font-size: 0.75em; margin-top: -15px;">달성률</div>
							<div class="progress">
								<div class="progress-bar bg-warning" style="width:70%; color:white;">70%</div>
							</div>
						</div>
						<div class="moyoDetail">
							<button type="button" class="form-control moyoFormBtn" >모여 !</button>
							<h6>📌 모집기간</h6> 2021.08.01 - 2021.08.03 <br />&mdash;
							<h6>📌 모임일자</h6> 2021.08.05 목요일 <br />&mdash;
							<h6>📌 모일장소</h6> 서울시 금천구 가산동 426-5 월드메르디앙 앞 <br />&mdash;
							<h6>📌 판매자 공지사항</h6> 안녕하세요 나이키입니다. 안녕하세요 나이키입니다.  <br />&mdash;
						</div>
					</div>
				</div>
				<div class="row moyoRow">
					<div class="moyoSimple">
						<div>
							<div style="text-align: right;"><i class="material-icons moyoToggleArrow">keyboard_arrow_down</i></div>
							<img class="simpleImg" src="../resources/images/list/4.jpg"></a>
						</div>
						<div>
							<h5><span class="badge">D-2</span> 나이키 시즌오프 팝업스토어</h5>
							<span>2021</span>년 <span>08</span>월 <span>05</span>일에 모여 !

							<h6 style="text-align: right;">모일 인원수 <span class="moyoMax">100</span> 명</h6>
							<div style="font-size: 0.75em; margin-top: -15px;">달성률</div>
							<div class="progress">
								<div class="progress-bar bg-warning" style="width:70%; color:white;">70%</div>
							</div>
						</div>
						<div class="moyoDetail">
							<button type="button" class="form-control moyoFormBtn" >모여 !</button>
							<h6>📌 모집기간</h6> 2021.08.01 - 2021.08.03 <br />&mdash;
							<h6>📌 모임일자</h6> 2021.08.05 목요일 <br />&mdash;
							<h6>📌 모일장소</h6> 서울시 금천구 가산동 426-5 월드메르디앙 앞 <br />&mdash;
							<h6>📌 판매자 공지사항</h6> 안녕하세요 나이키입니다. 안녕하세요 나이키입니다.  <br />&mdash;
						</div>
					</div>
				</div>
				<div class="row moyoRow">
					<div class="moyoSimple">
						<div>
							<div style="text-align: right;"><i class="material-icons moyoToggleArrow">keyboard_arrow_down</i></div>
							<img class="simpleImg" src="../resources/images/list/5.jpg"></a>
						</div>
						<div>
							<h5>나이키 시즌오프 팝업스토어</h5>
							<span>2021</span>년 <span>08</span>월 <span>05</span>일에 모여 !
							
							<h6 style="text-align: right;">모일 인원수 <span class="moyoMax">100</span> 명</h6>
							<div style="font-size: 0.75em; margin-top: -15px;">달성률</div>
							<div class="progress">
								<div class="progress-bar bg-warning" style="width:70%; color:white;">70%</div>
							</div>
						</div>
						<div class="moyoDetail">
							<button type="button" class="form-control moyoFormBtn" >모여 !</button>
							<h6>📌 모집기간</h6> 2021.08.01 - 2021.08.03 <br />&mdash;
							<h6>📌 모임일자</h6> 2021.08.05 목요일 <br />&mdash;
							<h6>📌 모일장소</h6> 서울시 금천구 가산동 426-5 월드메르디앙 앞 <br />&mdash;
							<h6>📌 판매자 공지사항</h6> 안녕하세요 나이키입니다. 안녕하세요 나이키입니다.  <br />&mdash;
						</div>
					</div>
					
				</div>
				<!-- <div class="row">
					<div class="moyoSimple">
						<img class="simpleImg" src="../resources/images/list/5.jpg"></a>
						Click to slide the panel down or up
					</div>
					<div class="moyoDetail">Hello world!</div>
				</div> -->
			</div>
		</div>
	</div>

</body>
</html>