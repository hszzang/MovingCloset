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
        #list{
            border:solid white 1px;
            width:80%; height:auto;
            margin:10% 10% 20% 5%;
            display: block;
            float: left;
        }
        
		#outDiv{
			width:90%; height:auto;
			border:lightgray solid 1px;
			margin:10px 0 5px 10px; padding:1%;
		}
		#innerDiv{
			width:100%; height:auto;
			border:#FF6C2F solid 1px;
			padding:3%;
		}

		#titleDiv{
			width:100%; height:auto;
			border:none;
			padding-left:0; margin:0;	
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
        <form action="">
            <div id="list">
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
            					<!--  
            					<span id="sides">
		            				<div class="side"><img src="" /></div>
		            				<div class="side"><img src="" /></div>
		            				<div class="side"><img src="" /></div>
		            				<div class="side"><img src="" /></div>
		            			</span>
		            			-->
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
	            				<button id="pleaseBtn">조르기</button>
	            			</span>
            			</div>
            			
            		</div>
            	</div>
                         
            </div>
            
        </form>
    </div>
</body>
</html>