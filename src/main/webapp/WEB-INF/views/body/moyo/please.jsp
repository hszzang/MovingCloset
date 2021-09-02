<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovingCloset_Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<script>
		
		/*카운트다운*/
		var countDownDate = new Date("Aug 31, 2021 15:37:25").getTime();

		// Update the count down every 1 second
		var x = setInterval(function() {
		
			// Get today's date and time
			var now = new Date().getTime();
			    
			// Find the distance between now and the count down date
			var distance = countDownDate - now;
			    
			// Time calculations for days, hours, minutes and seconds
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			    
			// Output the result in an element with id="demo"
			document.getElementById("time").innerHTML = days + "일 " + hours + "시간 "
			+ minutes + "분 " + seconds + "초";
			document.getElementById("time2").innerHTML = days + "일 " + hours + "시간 "
			+ minutes + "분 " + seconds + "초";
			document.getElementById("time3").innerHTML = days + "일 " + hours + "시간 "
			+ minutes + "분 " + seconds + "초";
			document.getElementById("time4").innerHTML = days + "일 " + hours + "시간 "
			+ minutes + "분 " + seconds + "초";
			document.getElementById("time5").innerHTML = days + "일 " + hours + "시간 "
			+ minutes + "분 " + seconds + "초";
		    
			// If the count down is over, write some text 
			if (distance < 0) {
			  clearInterval(x);
			  document.getElementById("time").innerHTML = "마감되었습니다";
			}
		}, 1000);
		
  	</script>
  	
    <style>
		.container{
			border:none;
			/* width:80%;  */
            height:auto;
			margin-top:50px;
			padding-top:50px;
		}
		
		.section-title {
			text-align: center;
			padding-top: 50px;
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
		
        .tabcontent{
            border:none;
            width:100%; height:auto;
            margin:2% 10% 5% 5%;
            display: block;
        }
        #Expired{ display:none; }
        
		.outDiv{
			width:90%; height:auto;
			border:none;
			margin-bottom:20px;
		}
		.innerDiv{
			width:100%; height:auto;
			border:#A52A2A solid 1px;
			/* border:lightgray solid 1px; */
			border-radius:10px;
			padding:3%;
		}
		.innerDiv2{
			width:100%; height:auto;
			border:#274069 solid 1px;
			/* border:lightgray solid 1px; */
			border-radius:10px;
			padding:3%;
		}

		/* #plzTitleDiv{
			width:100%; height:auto;
			border:none;
			padding-left:0; margin-left:1%;	
			font-size:14pt; font-weight:bold;
		} */
		.plzProduct{
			width:100%; height:360px;
			border:none;
			padding:0; margin:0;
		}

		.plzImgs{
			width:40%; height:350px;
			border:none;
			/*border:black solid 1px;*/
			padding:0; margin:0;
			float:left; display:inline-block;
		}
		.plzImg{
			width:95%; height:auto; margin:0 2% 0 2%;
		}

		.plzInfo{
			width:60%; height:350px;
			border:none; margin:0;
			float:left; display:inline-block;
		}
		
		.plzUpperDiv{
			width:100%; height:30%;
			border:none; 
			padding-left:1%; margin:0;
			margin-bottom: 1%;
		}
		.plzBrand{font-size:10pt; color:gray; display:block; }
		.plzPName{font-size:12pt; font-weight:bold; display:block;}
		.plzOriPrice{font-size:10pt; color:gray; font-weight:lighter; display:inline;}
		.plzNowPrice{display:inline;}
		.plzPercent{color:#FF6C2F; display:inline; font-size:12pt;}
		.plzPrice{color:#FF6C2F; font-size:14pt; font-weight:bold; display:inline;}
	    .plzWon{color:black; font-weight:bold; display:inline;}
		
		.plzDownDiv{
			width:100%; height:55%; margin:0;
			border: solid 1px #800000; 
			background-color:#800000;
			border-radius:10px;
			padding-left:1%; padding-top:1%; padding-bottom:1%;
		}
		.plzDownDiv2{
			width:100%; height:55%; margin:0;
			border: solid 1px #274069; 
			background-color:#274069;
			border-radius:10px;
			padding-left:1%; padding-top:1%; padding-bottom:1%;
		}
		.plzRemainingTime{
			padding:50px; margin-left:5%; display:inline; align-content: center;
		}
		.expNum{
			width:auto; height:auto;
			border:lightgray solid 1px; padding:3%;
			font-size:18pt; color:orangered; font-weight:bold;
		}
		.expWord{
		 	color:gray; font-size:10pt;
		 	margin:0 1% 0 1%;
		 	
		}
		.until{
			color:gray; font-size:10pt; font-weight:lighter;
			margin:1% 0 0 5%;
		}
		.plzAchivementRate{ 
			float:right; margin-right:15%;
			font-size:12pt; font-weight:bold;
		}
		.pleaseBtn{
			width:100%; height:50px;
			border: solid 1px #FF6C2F;
			background-color: white;
			color: #FF6C2F;
			font-size:14pt; font-weight:bold;
			border-radius:5px;
			margin-bottom:10px;
			margin-top:5px;
		}
		.pleaseBtn:hover{
			color: white;
			background-color: #FF6C2F;
		}
		
		
        @media only screen and (max-width:1000px){

        }
        @media only screen and (max-width: 700px) {
        #filterBtn{ margin-left:20%;}
        }
        @media only screen and (max-width: 500px) {
        #filterBtn{ margin-left: 7%; }
        #filterDropdown{ margin-left: 45%;}
        #lists{ margin-left:15%;}
        }
        
        .badge{
        	margin-left:10px;
        }
        
        #time{
        	text-align:center;
        	font-size:30pt;
        	font-family: Noto Sans Korean;
        	margin-top:10px;
        	color:white;
        }
        #time2, #time3, #time4, #time5{
        	text-align:center;
        	font-size:30pt;
        	font-family: Noto Sans Korean;
        	margin-top:10px;
        	color:white;
        }
        
        .progress-info{
        	padding-top:5px;
        	text-align:center;
        	color:white;
        }
        
        /* 마감임박 */
        .deadTitle{
			padding-top:30px;
			padding-bottom:30px;
			padding-left:55px;
		}
        
        .deadline {
		  height: 20px;
		  
		}
		
		.deadline span {
		  position: relative;
		  font-weight:bold;
		  top: 10px;
		  margin-right: -5px;
		  display: inline-block;
		  animation: bounce 0.3s ease infinite alternate;
		  font-size: 30px;
		  color: #A52A2A;
		  /* text-shadow: 0 1px 0 #ccc, 0 2px 0 #ccc, 0 3px 0 #ccc, 0 4px 0 #ccc,
		    0 5px 0 #ccc, 0 6px 0 transparent, 0 7px 0 transparent, 0 8px 0 transparent,
		    0 9px 0 transparent, 0 5px 5px rgba(0, 0, 0, 0.4); */
		}
		
		.deadline span:nth-child(2) {
		  animation-delay: 0.1s;
		}
		.deadline span:nth-child(3) {
		  animation-delay: 0.2s;
		}
		.deadline span:nth-child(4) {
		  animation-delay: 0.3s;
		}
		.deadline span:nth-child(5) {
		  animation-delay: 0.4s;
		}
		.deadline span:nth-child(6) {
		  animation-delay: 0.5s;
		}
		.deadline span:nth-child(7) {
		  animation-delay: 0.6s;
		}
		.deadline span:nth-child(8) {
		  animation-delay: 0.7s;
		}
		
		@keyframes bounce {
		  100% {
		    top: 0px;
		  
		  }
		}
		
		/* 진행중 */
		.ingTitle{
			padding-top:30px;
			padding-bottom:10px;
		}
		
		.ing {
		  position: relative;
		  text-transform: uppercase;
		  letter-spacing: 6px;
		  font-size: 25pt;
		  font-weight:bold;
		  text-decoration: none;
		  color: white;
		  display: inline-block;
		  background-size: 120% 100%;
		  -webkit-background-clip: text;
		  -webkit-text-fill-color: transparent;
		  -moz-background-clip: text;
		  -moz-text-fill-color: transparent;
		  -ms-background-clip: text;
		  -ms-text-fill-color: transparent;
		  background-clip: text;
		  text-fill-color: transparent;
		  background-image: linear-gradient(45deg, #274069, #274069, #274069, #274069);
		  animation: 1.0s shake infinite alternate;
		}
		
		@keyframes shake {
		  0% {
		    transform: skewX(-15deg);
		  }
		  5% {
		    transform: skewX(15deg);
		  }
		  10% {
		    transform: skewX(-15deg);
		  }
		  15% {
		    transform: skewX(15deg);
		  }
		  20% {
		    transform: skewX(0deg);
		  }
		  100% {
		    transform: skewX(0deg);
		  }
		}
        
        /* 구분선 */
        hr{
        	width:1000px;
        	text-align:center;
        	margin-right:30px;
        }
        
        
    </style>
</head>
<body>
<div class="container">
	<div class="section-title">
		<h2>쪼 르 기</h2>
	</div>
	<div class="deadTitle">
		<h1 class="deadline">
			<span>마</span>
			<span>감</span>
			<span>임</span>
			<span>박</span>
			<span>!</span>
		</h1>
	</div>
	<!-- 진행중인 쪼르기 -->
	<div id="onGoing" class="tabcontent">
		<div class="outDiv">
       		<div class="innerDiv">
       			<div class="plzProduct">
       				<span class="plzImgs">
                           <!-- <span id="mainImg"> -->
                               <img class="plzImg" src="../resources/images/please/p1.jpg"/>
                           <!-- </span> -->
       				</span>
       				
        			<span class="plzInfo">
        				<div class="plzUpperDiv">
        					<div class="plzBrand">TEN C</div>
        					<div class="plzPName">
        						TEN C_ARCTIC PARKA <br />
        						17CTCUC03075003780 888 BLUE</div>
        					<div class="plzOriPrice"><strike>1,180,000</strike></div>
        					<!-- <div class="plzNowPrice"> -->
        						<span class="plzPercent"><em>34%</em></span>
        						<span class="plzPrice">778,800</span>
        						<span class="plzWon">원</span>	
        					<!-- </div> -->
        				</div>
        				<div class="plzDownDiv">
        					<span class="badge badge-warning HotTime">
        						모집중!
        					</span>
							<div class="CountDown" id="time"></div>
							<div class="progress" style="width:95%; height:20px; margin-left:10px;">
								<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:70%; height:20px"></div>
							</div>
								<div class="progress-info"><b>70 / 100(명)</b></div>
        				</div>
        				<button class="pleaseBtn">쪼르기</button>
        			</span>
       			</div>
       		</div>
       	</div>
       	<hr style="width:90%; margin-left:0; border: solid 1px #000000; background-color:#000000; margin-top:100px; margin-bottom:50px;" >
        <div class="ingTitle">	
        	<h1 class="ing">진행중</h1>
        </div>	
       	<div class="outDiv">
       		<div class="innerDiv2">
       			<div class="plzProduct">
       				<span class="plzImgs">
                           <span id="mainImg">
                               <img class="plzImg" src="../resources/images/please/p2.jpg"/>
                           </span>
       				</span>
       				
        			<span class="plzInfo">
        				<div class="plzUpperDiv">
        					<div class="plzBrand">SnowPeak Apparel</div>
        					<div class="plzPName">
        						블랙 멀티캠 롱다운 자켓_CA <br />
        						S20WME-DJ12
        					</div>
        					<div class="plzOriPrice"><strike>599,000</strike></div>
        					<div class="plzNowPrice">
        						<span class="plzPercent"><em>40%</em></span>
        						<span class="plzPrice">359,000</span>
        						<span class="plzWon">원</span>	
        					</div>
        				</div>
        				<div class="plzDownDiv2">
	       					<span class="badge badge-warning HotTime">
	       						모집중!
	       					</span>
							<div class="CountDown" id="time2"></div>
							<div class="progress" style="width:95%; height:20px; margin-left:10px;">
								<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:40%; height:20px"></div>
							</div>
								<div class="progress-info"><b>40 / 100(명)</b></div>
       					</div>
        				<button class="pleaseBtn">쪼르기</button>
        			</span>
       			</div>
       		</div>
       	</div>
        	
        	<div class="outDiv">
        		<div class="innerDiv2">
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <span id="mainImg">
                                <img class="plzImg" src="../resources/images/please/p3.jpg"/>
                            </span>
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">SnowPeak Apparel</div>
         					<div class="plzPName">
         						에디트 아웃포켓형 숏다운 자켓_MS <br />
         						S20WMP-DJ86</div>
         					<div class="plzOriPrice"><strike>439,000</strike></div>
         					<div class="plzNowPrice">
         						<span class="plzPercent"><em>40%</em></span>
         						<span class="plzPrice">263,400</span>
         						<span class="plzWon">원</span>	
         					</div>
         				</div>
         				<div class="plzDownDiv2">
	       					<span class="badge badge-warning HotTime">
	       						모집중!
	       					</span>
							<div class="CountDown" id="time3"></div>
							<div class="progress" style="width:95%; height:20px; margin-left:10px;">
								<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:50%; height:20px"></div>
							</div>
								<div class="progress-info"><b>50 / 100(명)</b></div>
       					</div>
         				<button class="pleaseBtn">쪼르기</button>
         			</span>
        			</div>
        		</div>
        	</div>
        	
        	<div class="outDiv">
        		<div class="innerDiv2">
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <span id="mainImg">
                                <img class="plzImg" src="../resources/images/please/p4.jpg"/>
                            </span>
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">EASTLOGUE</div>
         					<div class="plzPName">
         						FLAK SHIRT / MULTI MADRAS <br />
         						1179095</div>
         					<div class="plzOriPrice"><strike>298,000</strike></div>
         					<div class="plzNowPrice">
         						<span class="plzPercent"><em>50%</em></span>
         						<span class="plzPrice">149,000</span>
         						<span class="plzWon">원</span>	
         					</div>
         				</div>
         				<div class="plzDownDiv2">
	       					<span class="badge badge-warning HotTime">
	       						모집중!
	       					</span>
							<div class="CountDown" id="time4"></div>
							<div class="progress" style="width:95%; height:20px; margin-left:10px;">
								<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:20%; height:20px"></div>
							</div>
								<div class="progress-info"><b>20 / 100(명)</b></div>
       					</div>
         				<button class="pleaseBtn">쪼르기</button>
         			</span>
        			</div>
        		</div>
        	</div>
        	
        	<div class="outDiv">
        		<div class="innerDiv2">
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <span id="mainImg">
                                <img class="plzImg" src="../resources/images/please/p5.jpg"/>
                            </span>
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">BURBERRY</div>
         					<div class="plzPName">
         						버버리 8038569 패치워크 퀼팅 체크 자켓<br />
         						1175028
         					</div>
         					<div class="plzOriPrice"><strike>1,431,000</strike></div>
         					<div class="plzNowPrice">
         						<span class="plzPercent"><em>22%</em></span>
         						<span class="plzPrice">1,113,000</span>
         						<span class="plzWon">원</span>	
         					</div>
         				</div>
         				<div class="plzDownDiv2">
	       					<span class="badge badge-warning HotTime">
	       						모집중!
	       					</span>
							<div class="CountDown" id="time5"></div>
							<div class="progress" style="width:95%; height:20px; margin-left:10px;">
								<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:45%; height:20px"></div>
							</div>
								<div class="progress-info"><b>45 / 100(명)</b></div>
       					</div>
         				<button class="pleaseBtn">쪼르기</button>
         			</span>
        			</div>
        		</div>
        	</div>
        	
        	<!-- <div class="outDiv">
        		<div class="innerDiv">
        			<div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div>
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <span id="mainImg">
                                <img class="plzImg" src="../resources/images/please/p6.jpg"/>
                            </span>
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">Acne Studios</div>
         					<div class="plzPName">
         						아크네 모크 라이더 가죽 자켓 <br />
         						1AZ166 900</div>
         					<div class="plzOriPrice"><strike>2,133,000</strike></div>
         					<div class="plzNowPrice">
         						<span class="plzPercent"><em>29%</em></span>
         						<span class="plzPrice">1,523,000</span>
         						<span class="plzWon">원</span>	
         					</div>
         				</div>
         				<div class="plzDownDiv">
         					<div class="until">마감까지</div><br />
         					<div class="plzRemainingTime">
         						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
         						<span class="expNum">12</span><span class="expWord">시</span>
         						<span class="expNum">35</span><span class="expWord">분</span>
         						<span class="expNum">20</span><span class="expWord">초</span>
         					</div>
         					 <div class="progress">
									<div class="progress-bar bg-warning" style="width:70%">70%</div>
							</div>
							<span class="plzAchivementRate">490 / 700 달성</span>
         				</div>
         				<button class="pleaseBtn">쪼르기 !</button>
         			</span>
        			</div>
        		</div>
        	</div> -->
        
        </div>	
        <!-- 진행중 쪼르기 끝 -->   
        
        
        
        <!-- 마감한 쪼르기  -->    
        <div id="Expired" class="tabcontent">
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p7.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">PRADA</div>
         					<div class="plzPName">
         						프라다 체크 코트 <br />
         						P625NE 1XF9 F0008</div>
         					<div class="plzOriPrice"><strike>3,983,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>22%</em></span>
         						<span class="plzPrice">3,098,000</span>
         						<span class="plzWon">원</span>	
         					<!-- </div> -->
         				</div>
         				<div class="plzDownDiv">
         					<div class="until">마감까지</div><br />
         					<div class="plzRemainingTime">
         						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
         						<span class="expNum">12</span><span class="expWord">시</span>
         						<span class="expNum">35</span><span class="expWord">분</span>
         						<span class="expNum">20</span><span class="expWord">초</span>
         					</div>
         					 <div class="progress">
									<div class="progress-bar bg-warning" style="width:100%">100%</div>
							</div>
							<span class="plzAchivementRate">700 / 700 달성</span>
         				</div>
         				<button class="pleaseBtn">쪼르기 성공!</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 1 끝 -->
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p8.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">TEN C</div>
         					<div class="plzPName">
         						TEN C_ARCTIC PARKA <br />
         						17CTCUC03075003780 769 PURPLE PANSE</div>
         					<div class="plzOriPrice"><strike>1,180,000</strike></div>
         					<div class="plzNowPrice">
         						<div class="plzPercent"><em>34%</em></div>
         						<div class="plzPrice">778,000</div>
         						<div class="plzWon">원</div>	
         					</div>
         				</div>
         				<div class="plzDownDiv">
         					<div class="until">마감까지</div><br />
         					<div class="plzRemainingTime">
         						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
         						<span class="expNum">12</span><span class="expWord">시</span>
         						<span class="expNum">35</span><span class="expWord">분</span>
         						<span class="expNum">20</span><span class="expWord">초</span>
         					</div>
         					 <div class="progress">
									<div class="progress-bar bg-warning" style="width:100%">100%</div>
							</div>
							<span class="plzAchivementRate">700 / 700 달성</span>
         				</div>
         				<button class="pleaseBtn">쪼르기 성공!</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 2 끝 -->
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p9.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">TATRAS</div>
         					<div class="plzPName">
         						남성 라구사 RAGUSA <br />
         						MTA19S8064TT01</div>
         					<div class="plzOriPrice"><strike>318,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>53%</em></span>
         						<span class="plzPrice">151,050</span>
         						<span class="plzWon">원</span>	
         					<!-- </div> -->
         				</div>
         				<div class="plzDownDiv">
         					<div class="until">마감까지</div><br />
         					<div class="plzRemainingTime">
         						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
         						<span class="expNum">12</span><span class="expWord">시</span>
         						<span class="expNum">35</span><span class="expWord">분</span>
         						<span class="expNum">20</span><span class="expWord">초</span>
         					</div>
         					 <div class="progress">
									<div class="progress-bar bg-warning" style="width:100%">100%</div>
							</div>
							<span class="plzAchivementRate">700 / 700 달성</span>
         				</div>
         				<button class="pleaseBtn">쪼르기 성공!</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 3 끝 -->
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p10.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">OFF WHITE</div>
         					<div class="plzPName">
         						애로우 체크 플란넬 오버셔츠 <br />
         						OMGA133R21FAB0022500</div>
         					<div class="plzOriPrice"><strike>588,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>22%</em></span>
         						<span class="plzPrice">457,000</span>
         						<span class="plzWon">원</span>	
         					<!-- </div> -->
         				</div>
         				<div class="plzDownDiv">
         					<div class="until">마감까지</div><br />
         					<div class="plzRemainingTime">
         						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
         						<span class="expNum">12</span><span class="expWord">시</span>
         						<span class="expNum">35</span><span class="expWord">분</span>
         						<span class="expNum">20</span><span class="expWord">초</span>
         					</div>
         					 <div class="progress">
									<div class="progress-bar bg-warning" style="width:70%">70%</div>
							</div>
							<span class="plzAchivementRate">490 / 700 달성</span>
         				</div>
         				<button class="pleaseBtn">쪼르기 실패!</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 4 끝 -->
        	
        </div>
        <!-- 마감한 쪼르기 끝  -->
                

</div>
</body>
</html>