<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪼르기 :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<script>
  	
  	</script>
  	
    <style>
		.bodyContainer{
			border:none;
			/* width:80%;  */
            height:auto;
			margin-top:100px;
			margin-bottom: 100px;
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
			width:90%; height:340px; object-fit: cover; margin:0 2% 0 2%;
		}

		.plzInfo{
			width:60%; height:350px;
			border:none; margin:0;
			float:left; display:inline-block; padding-top: 20px;
		}
		
		.plzUpperDiv{
			width:100%; height:25%;
			border:none; 
			padding-left:1%; margin:0;
			margin-bottom: 1%;
		}
		.plzBrand{font-size:12pt; color:gray; display:block; }
		.plzPName{font-size:16pt; font-weight:bold; display:block;}
		.plzOriPrice{font-size:10pt; color:gray; font-weight:lighter; display:inline;}
		.plzNowPrice{display:inline; text-align: right; display: block; margin-top: -2%; margin-right: 3%; border-bottom: 0.7px solid #ff6c2f; }
		.plzPercent{color:#FF6C2F; display:inline; font-size:12pt;}
		.plzPrice{color:#FF6C2F; font-size:20pt; font-weight:bold; display:inline; font-style: italic;}
	    .plzWon{color:black; font-size:18pt; font-weight:bold; display:inline;}
		
		.plzDownDiv{
			width:100%; height:55%; margin-top: 40px;
			border: solid 1px #800000; 
			background-color:#800000;
			border-radius:10px;
			padding-left:1%; padding-top:1%; padding-bottom:1%;
		}
		.plzDownDiv2{
			width:100%; height:55%; margin-top: 40px;
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
       	    margin-bottom: 5%; margin-top: 5%;
        	color:white;
        }
        
        .progress-info{
        	padding-top:5px; padding-right: 20px;
        	text-align:right;
        	color:white;
        }
        
        /* 마감임박 */
        .deadTitle{
			padding-bottom:0px;
			padding-left:55px;
			margin-top: 40px;
		}
        
        .deadline {
		  height: 20px;
		  
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
        
        .cateBtn { width: 150px; }
        .btn-warning, .btn-warning:focus {
		    color: white !important;
		}
        
    </style>
</head>
<body>
<div class="container bodyContainer">
	<div class="section-title">
		<h2>지난 모여 / 쪼르기</h2>
	</div>
	<div class="deadTitle">
		<button type="button" onclick="javascript:location.href='../movingcloset/endMoyoPlz.do?category=moyo'" class="btn ${moyoBtn } cateBtn">모여</button>
		<button type="button" onclick="javascript:location.href='../movingcloset/endMoyoPlz.do?category=plz'" class="btn ${plzBtn } cateBtn">쪼르기</button>
	</div>
	
	<!-- 진행중인 쪼르기 -->
	<div id="onGoing" class="tabcontent">
		<c:if test="${not empty moyoList }">
			<c:forEach items="${moyoList }" var="mList">
				<c:set var="statusColor" value="" />
				<c:if test="${mList.m_status eq '성공' }">
					<c:set var="statusColor" value="2" />
				</c:if>
				<div class="outDiv">
		       		<div class="innerDiv2">
		       			<div class="plzProduct">
		       				<span class="plzImgs">
		                           <span id="mainImg">
		                               <img class="plzImg" src="../resources/upload/${mList.m_sfile }"/>
		                           </span>
		       				</span>
		       				
		        			<span class="plzInfo">
		        				<div class="plzUpperDiv">
									<fmt:parseDate value="${mList.m_dday }" var="moyoday" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${moyoday }" var="moyoday" pattern="yyyy-MM-dd" />
		        					
		        					<div class="plzBrand">모여 DAY : ${moyoday }</div>
		        					<div class="plzPName">
		        						${mList.m_name } 
		        					</div>
  									<fmt:parseDate value="${mList.m_start }" var="startday" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${startday }" var="startday" pattern="yyyy-MM-dd" />
  									<fmt:parseDate value="${mList.m_end }" var="endday" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${endday }" var="endday" pattern="yyyy-MM-dd" />
		        					진행기간 : ${startday } ~ ${endday }<br/>
		        					${mList.m_desc } 
		        				</div>
		        				<div class="plzDownDiv${statusColor }">
									<div class="CountDown" id="time2">모여 ${mList.m_status } !</div>
									<c:forEach items="${countMoyoUser }" var="countMoyoUser">
										<c:if test="${countMoyoUser.key eq mList.m_idx }">
											<c:set var="achievementRate" value="${countMoyoUser.value / mList.m_goal * 100}" />
											<c:set var="countMoyoUserVar" value="${countMoyoUser.value }" />
										</c:if>
									</c:forEach>
									<div class="progress" style="width:95%; height:20px; margin-left:10px;">
										<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:${achievementRate }%; height:20px"></div>
									</div>
									<div class="progress-info"><b>${countMoyoUserVar } / ${mList.m_goal }(명)</b></div>
		       					</div>
		        			</span>
		       			</div>
		       		</div>
		       	</div>
				
			</c:forEach>
		</c:if>
		<c:if test="${empty moyoList }">
			<c:forEach items="${plzProduct }" var="pList" varStatus="pListLoop">
				<c:set var="statusColor" value="" />
				<c:if test="${plzList[pListLoop.index].plz_status eq '성공' }">
					<c:set var="statusColor" value="2" />
				</c:if>
				<div class="outDiv">
		       		<div class="innerDiv2">
		       			<div class="plzProduct">
		       				<span class="plzImgs">
		                           <span id="mainImg">
		                               <img class="plzImg" src="../resources/upload/${pList.p_sfile }"/>
		                           </span>
		       				</span>
		       				
		        			<span class="plzInfo">
		        				<div class="plzUpperDiv">
		        					<div class="plzBrand">${pList.p_brand }</div>
		        					<div class="plzPName">
		        						${pList.p_name } ${pList.p_code }
		        					</div>
  									<fmt:parseDate value="${plzList[pListLoop.index].plz_start }" var="startday" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${startday }" var="startday" pattern="yyyy-MM-dd" />
  									<fmt:parseDate value="${plzList[pListLoop.index].plz_end }" var="endday" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${endday }" var="endday" pattern="yyyy-MM-dd" />
		        					
		        					진행기간 : ${startday } ~ ${endday }
		        					<div class="plzNowPrice">
		        						<span class="plzPrice"><fmt:formatNumber type="number" value="${pList.p_price }" /></span>
		        						<span class="plzWon">원</span>	
		        					</div>
		        				</div>
		        				<div class="plzDownDiv${statusColor }">
									<div class="CountDown" id="time2">쪼르기 ${plzList[pListLoop.index].plz_status } !</div>
									<c:forEach items="${countPlzUser }" var="countPlzUser">
										<c:if test="${countPlzUser.key eq plzList[pListLoop.index].plz_idx }">
											<c:set var="achievementRate" value="${countPlzUser.value / plzList[pListLoop.index].plz_goal * 100}" />
											<c:set var="countPlzUserVar" value="${countPlzUser.value }" />
										</c:if>
									</c:forEach>
									<div class="progress" style="width:95%; height:20px; margin-left:10px;">
										<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:${achievementRate }%; height:20px"></div>
									</div>
									<div class="progress-info"><b>${countPlzUserVar } / ${plzList[pListLoop.index].plz_goal }(명)</b></div>
		       					</div>
		        			</span>
		       			</div>
		       		</div>
		       	</div>
			</c:forEach>
		</c:if>
    </div>
</div>
</body>
</html>