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
			} 
			else {
				// $("#moyoList").css("overflow-y", "hidden");
				$(".moyoRow").not(this).slideUp("fast");
				// $(".moyoRow").not(this).css("display", "none");
			}
		});
	});

	function clickRow(moyoRow){

		

	}

	</script>

<style>

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
						map.setZoomable(false);
						
						// 지도에 확대 축소 컨트롤을 생성한다
						var zoomControl = new kakao.maps.ZoomControl();

						// 지도의 우측에 확대 축소 컨트롤을 추가한다
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
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
				<div class="row moyoRow" value="1" onclick=clickRow(this.value);>
					<div class="moyoSimple">
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