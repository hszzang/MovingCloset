<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		margin-bottom: 10px;
	}
	.container .row {
		padding:10px;
		padding-left: 15px;
		padding-right: 15px;
	}
	
	.wrapMoyoForm {
		margin-top:30px;
		padding-top:15px;
		margin-bottom: 40px;
/* 		border-top: 1px solid lightgray; */
/* 		border-top-width: 60%;	 */
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
	  padding-bottom: 10px; padding-top: 50px;
	}
	
	.section-title h2 {
	  font-size: 32px;
	  font-weight: bold;
	  text-transform: uppercase;
	  margin-bottom: 10px;
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
	
	.kakaowrap {position: static; left: 0;bottom: 40px;width: 250px;height: 125px;margin-left: -145px;text-align: left;overflow: visible;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .kakaowrap * {padding: 0;margin: 0;}
    .kakaowrap .kakaoinfo {width: 295px;height: 125px;border-radius: 5px;border-bottom: 2px solid #ccc;margin-top:-3px;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .kakaowrap .kakaoinfo:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .kakaoinfo .kakaotitle {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .kakaoinfo .kakaobody {position: relative;overflow: hidden;}
    .kakaoinfo .kakaodesc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .kakaodesc .kakaoellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .kakaodesc .kakaojibun {font-size: 11px;color: #888;margin-top: -2px;}
    .kakaoinfo .kakaoimg {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .kakaoinfo .kakaoimg img {width:73px; height:70px; object-fit:cover;}
    .kakaodesc .kakaodetail {color: #ff6c2f; cursor:pointer;}
    
    .centerkakaowrap {position: static; left: 0;bottom: 40px;width: 50px;height: 40px;margin-left: 0px;text-align: left;overflow: visible;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .centerkakaowrap * {padding: 0;margin: 0;}
    .centerkakaowrap .centerkakaoinfo {width: 150px;height: 40px;border-radius: 5px;border-bottom: 2px solid #ccc;margin-top:-5px;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .centerkakaowrap .centerkakaoinfo:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .centerkakaoinfo .centerkakaotitle {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    
</style>

<script> 

	$(document).ready(function(){
		$('.moyoDetail').hide();

		$(".moyoRow").click(function(){
			$(".moyoDetail").slideToggle("slow");
			
			if($(".moyoDetail").is(":hidden")){
				$(".moyoRow").not(this).slideDown("fast");
				$("#countMoyos").slideDown("fast");
				$(".moyoToggleArrow").text('keyboard_arrow_down');
			} 
			else {
				$(".moyoRow").not(this).slideUp("fast");
				$("#countMoyos").slideUp("fast");
				$(".moyoToggleArrow").text('keyboard_arrow_up');
			}
		});
		<c:forEach items="${moyoList}" var="jmlist">
			$(document).on("click", "#moyoMapWindow${jmlist.m_idx}", function(){
				$(".moyoDetail").slideToggle("slow");
				
				if($(".moyoDetail").is(":hidden")){
					$(".moyoRow").not("#moyoRow-${jmlist.m_idx }").slideDown("fast");
					$("#countMoyos").slideDown("fast");
					$(".moyoToggleArrow").text('keyboard_arrow_down');
				} 
				else {
					$(".moyoRow").not("#moyoRow-${jmlist.m_idx }").slideUp("fast");
					$("#countMoyos").slideUp("fast");
					$(".moyoToggleArrow").text('keyboard_arrow_up');
				}
			});
		</c:forEach>
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
		<hr />
		<div class="row wrapMoyoForm">
			<div class="col-8">
				<form action="" name="moyoAddrFrm" method="post">
				<div class="row input-group form-inline" id="inputLocation">
					<input type="hidden" name="nowLat" value="${nowLat }" />
					<input type="hidden" name="nowLon" value="${nowLon }" />
					<input type="hidden" name="myAddr" class="wantGetLatLon" value="${myAddr }" />
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
								content: 
									'<div class="centerkakaowrap">' + 
						            '    <div class="centerkakaoinfo">' + 
						            '        <div class="centerkakaotitle">' + 
						            '           중심 위치' + 
						            '        </div>' + 
						            '    </div>' +    
						            '</div>'
							}
							<c:forEach items="${moyoList}" var="scmlist">
							,
							{
								title: '${scmlist.m_name}', 
								latlng: new kakao.maps.LatLng(${scmlist.m_lat }, ${scmlist.m_lon }),
								content: 
									'<div class="kakaowrap">' + 
						            '    <div class="kakaoinfo">' + 
						            '        <div class="kakaotitle">' + 
						            '            ${scmlist.m_name}' + 
// 						            '            <div class="kakaoclose" onclick="closeOverlay()" title="닫기"></div>' + 
						            '        </div>' + 
						            '        <div class="kakaobody">' + 
						            '        	<div class="kakaoimg">' +
						            '				<c:if test="${empty scmlist.m_sfile }">' +
									'					<img src="../resources/images/list/${scmlist.m_idx}.jpg">' +
									'				</c:if>' +
									'				<c:if test="${not empty scmlist.m_sfile }">' +
									'					<img src="../resources/images/list/${scmlist.m_sfile }.jpg">' +
									'				</c:if>' +
// 						            '               <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
						            '           </div>' + 
						            '        	<div class="kakaodesc">' + 
						            '           	<div class="kakaoellipsis">${scmlist.m_addr}</div>' + 
						            '           	<div class="kakaojibun kakaoellipsis">${scmlist.m_dday}</div>' + 
						            '           	<div class="kakaodetail" id="moyoMapWindow${scmlist.m_idx}">상세보기</div>' + 
						            '        	</div>' + 
						            '        </div>' + 
						            '    </div>' +    
						            '</div>'
							}	
							</c:forEach>
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
								alert("정확한 주소를 입력해주세요.");
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
			<h5 id="countMoyos">주변에서 ${fn:length(moyoList)}개의 모여가 진행중입니다.</h5>
			<hr />
			<c:forEach items="${moyoList }" var="mlist">
				<div class="row moyoRow" id="moyoRow-${mlist.m_idx }">
					<div class="moyoSimple">
						<div style="text-align: right;"><i class="material-icons moyoToggleArrow">keyboard_arrow_down</i></div>
						<div>
							<c:if test="${empty mlist.m_sfile }">
								<img class="simpleImg" src="../resources/images/list/${mlist.m_idx }.jpg">
							</c:if>
							<c:if test="${not empty mlist.m_sfile }">
								<img class="simpleImg" src="../resources/images/list/${mlist.m_sfile }.jpg">
							</c:if>
						</div>
						<div>
						
							<jsp:useBean id="today" class="java.util.Date" />
							<fmt:formatDate value='${today}' pattern='yyyy-MM-dd HH:mm:ss' var="nowDate"/>
							
<%-- 							<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" /> --%>
							
<%-- 							<fmt:parseDate value="${today }" var="parsetoday" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
							<fmt:parseDate value="${mlist.m_start }" var="strmstart" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${strmstart }" var="frmmstart" pattern="yyyy-MM-dd"/>
							<fmt:parseDate value="${mlist.m_end }" var="strmend" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${strmend }" var="frmmend" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber var="endDate_N" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" /> 
							<fmt:parseNumber var="nowDate_N" value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" />
	
							
<%-- 							<c:if test="${strmend - today lt 3}"> --%>
								<h5><span class="badge">D-2</span> ${mlist.m_name }</h5>
<%-- 							</c:if> --%>
							<fmt:parseDate value="${mlist.m_dday }" var="strmdday" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${strmdday }" pattern="yyyy년 MM월 dd일"/>에 모여 !

							<h6 style="text-align: right;">모일 인원수 <span class="moyoMax">${mlist.m_goal }</span> 명</h6>
							
							<c:forEach var="usercount" items="${countMoyoUser }">
								<c:if test="${mlist.m_idx eq usercount.key }">
									<c:set var="achievementRate" value="${usercount.value / mlist.m_goal * 100}" />
								</c:if>
<%-- 								<c:if test="${mlist.m_idx ne usercount.key }"> --%>
<%-- 									<c:set var="achievementRate" value="50" /> --%>
<%-- 								</c:if> --%>
							</c:forEach>
							<div style="font-size: 0.75em; margin-top: -15px;">달성률</div>
							<div class="progress">
								<div class="progress-bar bg-warning" style="width:${achievementRate}%; color:white;">${achievementRate }%</div>
<!-- 								<div class="progress-bar bg-warning" style="width:70%; color:white;">70%</div> -->
							</div>
						</div>
						<div class="moyoDetail">
							<button type="button" class="form-control moyoFormBtn" 
								onclick="javascript:location.href='../movingcloset/moyoForm.do?m_idx=${mlist.m_idx}';">모여 !</button>

							<h6>📌 모집기간</h6>${frmmstart } - ${frmmend } <br />&mdash;
							<h6>📌 모임일자</h6><fmt:formatDate value="${strmdday }" pattern="yyyy년 MM월 dd일 E요일"/><br />&mdash;
							<h6>📌 모일장소</h6> ${mlist.m_addr } <br />&mdash;
							<h6>📌 판매자 공지사항</h6> ${mlist.m_desc }  <br />&mdash;
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${empty moyoList }">
				💀 주변에 모여가 없습니다 💀
			</c:if>
				<!-- <div class="row">
					<div class="moyoSimple">
						<img class="simpleImg" src="../resources/images/list/5.jpg"></a>
						Click to slide the panel down or up
					</div>
					<div class="moyoDetail">Hello world!</div>
				</div> -->
			</div>
		</div>
		<hr />
	</div>

</body>
</html>