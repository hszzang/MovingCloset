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
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	
  	<script>
	  	window.onload = function() {
	        $("onGoing").show();
	        $("Expired").hide();
	    }
		function openPage(pageName,elmnt,color) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].style.backgroundColor = "";
		  }
		  document.getElementById(pageName).style.display = "block";
		  elmnt.style.backgroundColor = color;
		  
		}
		
		document.getElementById("default").click();
  	</script>
  	
    <style>
		.container{
			border:none;
			/* width:80%;  */
            height:auto;
			float:right; margin-top:100px;
		}
		.tablink {
            background-color: white;
            padding: 8px 30px !important;
            width: 25%;
            font-size: 14px;
            color: gray;
            border: 1px solid lightgray;
            float: right;
        }
		.tablink:focus{outline:none;}
        .tablink:hover {
            background-color:white; color:#FF6C2F;
            border:#FF6C2F solid 1px;
        }
		
        .tabcontent{
            border:none;
            width:80%; height:auto;
            margin:2% 10% 5% 5%;
            display: block;
            float: left;
        }
        #Expired{ display:none; }
        
		.outDiv{
			width:90%; height:auto;
			border:none;
			margin-bottom:1%; padding:0;
		}
		.innerDiv{
			width:100%; height:auto;
			/*border:#FF6C2F solid 1px;*/
			border:lightgray solid 1px;
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
			border:lightgray solid 1px; 
			padding-left:1%; padding-top:1%;
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
		.progress{ width:80%; margin:7% 7% 0 7%; }
		.plzAchivementRate{ 
			float:right; margin-right:15%;
			font-size:12pt; font-weight:bold;
		}
		.pleaseBtn{
			width:100%; height:50px;
			border:none; background-color:#FF6C2F; color:white;
			font-size:14pt; font-weight:bold;
		}
		.pleaseBtn:focus{outline:none;}
		
		
		
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
        
    </style>
</head>
<body>
<div class="container">
<button class="tablink" onclick="openPage('Expired', this, 'white')" >마감한 쪼르기</button>
     	<button class="tablink" onclick="openPage('onGoing', this, 'white')" id="default">진행중인 쪼르기</button>
         
		<!-- 진행중인 쪼르기 -->
        <div id="onGoing" class="tabcontent">

			<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
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
                                <img class="plzImg" src="../resources/images/please/p2.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">SnowPeak Apparel</div>
         					<div class="plzPName">
         						블랙 멀티캠 롱다운 자켓_CA <br />
         						S20WME-DJ12
         					</div>
         					<div class="plzOriPrice"><strike>599,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>40%</em></span>
         						<span class="plzPrice">359,s00</span>
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
         				<button class="pleaseBtn">쪼르기 !</button>
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
                                <img class="plzImg" src="../resources/images/please/p3.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">SnowPeak Apparel</div>
         					<div class="plzPName">
         						에디트 아웃포켓형 숏다운 자켓_MS <br />
         						S20WMP-DJ86</div>
         					<div class="plzOriPrice"><strike>439,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>40%</em></span>
         						<span class="plzPrice">263,400</span>
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
         				<button class="pleaseBtn">쪼르기 !</button>
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
                                <img class="plzImg" src="../resources/images/please/p4.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">EASTLOGUE</div>
         					<div class="plzPName">
         						FLAK SHIRT / MULTI MADRAS <br />
         						1179095</div>
         					<div class="plzOriPrice"><strike>298,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>50%</em></span>
         						<span class="plzPrice">149,000</span>
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
         				<button class="pleaseBtn">쪼르기 !</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 4 끝 -->
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p5.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">BURBERRY</div>
         					<div class="plzPName">
         						버버리 8038569 패치워크 퀼팅 체크 자켓<br />
         						1175028
         					</div>
         					<div class="plzOriPrice"><strike>1,431,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>22%</em></span>
         						<span class="plzPrice">1,113,000</span>
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
         				<button class="pleaseBtn">쪼르기 !</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 5 끝 -->
        	
        	<div class="outDiv">
        		<div class="innerDiv">
        			<!-- <div class="plzTitleDiv">
        				<span class="plzTitle">쪼르기상품</span>
        			</div> -->
        			<hr />	
        			<div class="plzProduct">
        				<span class="plzImgs">
                            <!-- <span id="mainImg"> -->
                                <img class="plzImg" src="../resources/images/please/p6.jpg"/>
                            <!-- </span> -->
        				</span>
        				
         			<span class="plzInfo">
         				<div class="plzUpperDiv">
         					<div class="plzBrand">Acne Studios</div>
         					<div class="plzPName">
         						아크네 모크 라이더 가죽 자켓 <br />
         						1AZ166 900</div>
         					<div class="plzOriPrice"><strike>2,133,000</strike></div>
         					<!-- <div class="plzNowPrice"> -->
         						<span class="plzPercent"><em>29%</em></span>
         						<span class="plzPrice">1,523,000</span>
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
         				<button class="pleaseBtn">쪼르기 !</button>
         			</span>
        			</div>
        		</div>
        	</div> <!-- 6 끝 -->
        
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