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
    	/*
        #filter{
            width:100%; height:50px;
            border:solid white 1px;
            padding: 5px 0 0 0;
            margin:15px 0 25px 0;
        }
        #filterBtn{
            display:inline;
            margin-left:38.5%;
            font-size:12pt;
        }
        #filterDropdown{
            margin-left:80%;
            display:inline;
        }
        #filterSel{
            width:150px; height:35px;
            text-align: center;
            border: white;
        }
		*/
		#wrap{
			border:solid black 1px;
			width:80%; height:auto;
			float:right;
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
            background-color: lightgray; color:white;
            border:lightgray solid 1px;
        }
		
        .tabcontent{
            border:none;
            width:80%; height:auto;
            margin:2% 10% 5% 5%;
            display: block;
            float: left;
        }
        #Expired{ display:none; }
        
		#outDiv{
			width:90%; height:auto;
			border:lightgray solid 1px;
			margin-bottom:1%; padding:1%;
		}
		#innerDiv{
			width:100%; height:auto;
			border:#FF6C2F solid 1px;
			padding:3%;
		}

		#titleDiv{
			width:100%; height:auto;
			border:none;
			padding-left:0; margin-left:1%;	
			font-size:14pt; font-weight:bold;
		}
		#product{
			width:100%; height:360px;
			border:none;
			padding:0; margin:0;
		}

		#imgs{
			width:40%; height:350px;
			border:none;
			/*border:black solid 1px;*/
			padding:0; margin:0;
			float:left; display:inline-block;
		}
		#img{
			width:95%; height:auto; margin:0 2% 0 2%;
		}
		/*
		#mainImg{
			width:75%; height:300px;
			border: black solid 1px;
			float:left; display:inline-block;
		}
		#sides{
			width:25%; height:300px;
			border:black solid 1px;
			padding:0; 
			float:left; display:inline-block;
		}
		.side{
			width:100%; height:75px;
			border:lightgray solid 1px;
			display:block;
		}
		*/
		#desc{
			width:60%; height:350px;
			border:none; margin:0;
			float:left; display:inline-block;
		}
		
		#upper{
			width:100%; height:30%;
			border:none; 
			padding-left:1%; margin:0;
		}
		#brand{font-size:10pt; color:gray; display:block; }
		#pName{font-size:12pt; font-weight:bold; display:block;}
		#oriPrice{font-size:10pt; color:gray; font-weight:lighter; display:inline;}
		#nowPrice{display:inline;}
		#per{color:#FF6C2F; display:inline; font-size:12pt;}
		#price{color:#FF6C2F; font-size:14pt; font-weight:bold; display:inline;}
		#won{color:black; font-weight:bold; display:inline;}
		
		#down{
			width:100%; height:55%; margin:0;
			border:lightgray solid 1px; 
			padding-left:1%; padding-top:1%;
		}
		#expNums{
			padding:50px; margin-left:5%; display:inline;
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
		#until{
			color:gray; font-size:10pt; font-weight:lighter;
			margin:1% 0 0 5%;
		}
		.progress{ width:80%; margin:7% 7% 0 7%; }
		#finish{ 
			float:right; margin-right:15%;
			font-size:12pt; font-weight:bold;
		}
		#pleaseBtn{
			width:100%; height:50px;
			border:none; background-color:#FF6C2F; color:white;
			font-size:14pt; font-weight:bold;
		}
		#pleaseBtn:focus{outline:none;}
		
		
		
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
    <div id="wrap">
			<button class="tablink" onclick="openPage('Expired', this, 'lightgray')" >마감한 쪼르기</button>
        	<button class="tablink" onclick="openPage('onGoing', this, 'lightgray')" id="default">진행중인 쪼르기</button>
            
            <div id="onGoing" class="tabcontent">
            	<!--  
                <div id="filter">
                    <span id="filterBtn">
                        <button type="button" class="btn btn-dark">전체</button>
                        <button type="button" class="btn btn-dark">의류</button>
                        <button type="button" class="btn btn-dark">신발</button>
                        <button type="button" class="btn btn-dark">가방</button>
                        <button type="button" class="btn btn-dark">잡화</button>
                    </span>
                    <span id="filterDropdown">
                        <select name="filterSelect" id="filterSel" placeholder="신상품순">
                            <option value="best">베스트순</option>
                            <option value="lowprice">낮은가격순</option>
                            <option value="highprice">높은가격순</option>
                            <option value="discount">높은할인순</option>
                            <option value="interest">높은관심순</option>
                        </select>
                    </span>
                </div>
				-->			
					
            <!-- 진행중인 쪼르기 -->
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p1.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">TEN C</div>
	            					<div id="pName">
	            						TEN C_ARCTIC PARKA <br />
	            						17CTCUC03075003780 888 BLUE</div>
	            					<div id="oriPrice"><strike>1,180,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>34%</em></span>
	            						<span id="price">778,800</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 1 끝 -->
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p2.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">SnowPeak Apparel</div>
	            					<div id="pName">
	            						블랙 멀티캠 롱다운 자켓_CA <br />
	            						S20WME-DJ12
	            					</div>
	            					<div id="oriPrice"><strike>599,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>40%</em></span>
	            						<span id="price">359,s00</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 2 끝 -->
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p3.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">SnowPeak Apparel</div>
	            					<div id="pName">
	            						에디트 아웃포켓형 숏다운 자켓_MS <br />
	            						S20WMP-DJ86</div>
	            					<div id="oriPrice"><strike>439,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>40%</em></span>
	            						<span id="price">263,400</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 3 끝 -->
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p4.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">EASTLOGUE</div>
	            					<div id="pName">
	            						FLAK SHIRT / MULTI MADRAS <br />
	            						1179095</div>
	            					<div id="oriPrice"><strike>298,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>50%</em></span>
	            						<span id="price">149,000</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 4 끝 -->
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p5.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">BURBERRY</div>
	            					<div id="pName">
	            						버버리 8038569 패치워크 퀼팅 체크 자켓<br />
	            						1175028
	            					</div>
	            					<div id="oriPrice"><strike>1,431,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>22%</em></span>
	            						<span id="price">1,113,000</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 5 끝 -->
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p6.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">Acne Studios</div>
	            					<div id="pName">
	            						아크네 모크 라이더 가죽 자켓 <br />
	            						1AZ166 900</div>
	            					<div id="oriPrice"><strike>2,133,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>29%</em></span>
	            						<span id="price">1,523,000</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:70%">70%</div>
  									</div>
  									<span id="finish">490 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 !</button>
	            			</span>
            			</div>
            		</div>
            	</div> <!-- 6 끝 -->
            
            </div>	
            <!-- 진행중 쪼르기 끝 -->   
            
            
            
            <!-- 마감한 쪼르기  -->    
            <div id="Expired" class="tabcontent">
            	
            	<div id="outDiv">
            		<div id="innerDiv">
            			<div id="titleDiv">
            				<span id="title">쪼르기상품</span>
            			</div>
            			<hr />	
            			<div id="product">
            				<span id="imgs">
	            				<span id="mainImg">
	            					<img id="img" src="../resources/images/please/p7.jpg"/>
	            				</span>
            				</span>
            				
	            			<span id="desc">
	            				<div id="upper">
	            					<div id="brand">PRADA</div>
	            					<div id="pName">
	            						프라다 체크 코트 <br />
	            						P625NE 1XF9 F0008</div>
	            					<div id="oriPrice"><strike>3,983,000</strike></div>
	            					<div id="nowPrice">
	            						<span id="per"><em>22%</em></span>
	            						<span id="price">3,098,000</span>
	            						<span id="won">원</span>	
	            					</div>
	            				</div>
	            				<div id="down">
	            					<div id="until">마감까지</div><br />
	            					<div id="expNums">
	            						<span class="expNum" style="margin-left:10px;">20</span><span class="expWord">일</span>
	            						<span class="expNum">12</span><span class="expWord">시</span>
	            						<span class="expNum">35</span><span class="expWord">분</span>
	            						<span class="expNum">20</span><span class="expWord">초</span>
	            					</div>
	            					 <div class="progress">
    									<div class="progress-bar bg-warning" style="width:100%">100%</div>
  									</div>
  									<span id="finish">700 / 700 달성</span>
	            				</div>
	            				<button id="pleaseBtn">쪼르기 성공!</button>
	            			</span>
            			</div>
            		</div>
            	</div> 
                      
            </div>
            <!-- 마감한 쪼르기 끝  -->
                

    </div>
</body>
</html>