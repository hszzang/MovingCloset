<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovingCloset_Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <style>
    	.container{margin-top:200px; margin-bottom:200px;}
    	
    	.section-title {
			text-align: center;
			padding-bottom: 10px;
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
    	
        #list{
            border:none;
            width:100%; height:auto;
            margin-bottom:200px; padding:0;
            display:inline; float:left;
        }

        #filter{
            width:80%; height:350px; border:none;
            padding:0; margin:0 10% 0 10%;
        }
        #searchSpan{ display:inline; }
    	#searchIn{
    		width:70%; height:80px;
    		border: none; margin-left:10%;
    		color:gray; font-size:2em;
    		font-weight:lighter;
        	display:inline;
    	}
    	#searchBtn{ border:none; background-color:white;}
    	#searchIcon{ font-size:40px; background-color:white; }
    	input:focus{ outline:none;}
    	/*
    	#searchBtn{
    		width:70px; height:80px;
    		background-color:black;
        	display:inline;
    	}
    	*/
    	.radiobtn{
    		border:none; background-color:white;
    		font-weight:lighter;	
    	}
    	.radiobtn:checked{ display:none; }
		.radiobtn{ font-size:1.3em; font-weight:light; display:none; }
		/*	
		.fBtns:checked + .filterLbl{
		    font-weight:900;
		}
		*/
    	.filterLbl{
    		font-size:1.3em; font-weight:100;
    		margin-left:3%;
    	}

        #filterBtn{
            display:inline;
            margin-left:17%;
            font-size:20pt;
        }
        
        #filterDropdown{ display:inline; margin:auto; padding:auto;}
		#colorView{
			width:100%; height:auto; color:gray; margin-left:20%; font-size:10pt; text-align:center;
		}
		.colorpicks{ text-decoration:none; color:gray; }
		.colorpicks:hover{ text-decoration:none; color:black; }
		
		#tagView{
			width:100%; height:auto; color:gray; margin-left:25%; font-size:10pt; text-align:center;
		}
		.tagpicks{ text-decoration:none; color:gray; }
		.tagpicks:hover{ text-decoration:none; color:black; }
		
        #order{
        	float:right; text-align: center;
            width:150px; height:35px; border: none;
        }
        order:focus{ display:none;}
		
        .products{
            width: 274px; height:420px;
            border:none; padding:0;
            display:inline-block;
        }
        .pImg{ width:260px; height:300px; }
        .brand{ font-size: 10pt; font-color:darkgray; font-weight:bolder;}
        .pAs{ text-decoration: none; color:black;}
        .name{ font-size: 11pt; }
        .origPrice{ 
            font-size:10pt; 
            color:lightgray;
        }
        .discountedPrice{
            color: #FF6C2F;
            font-size:12pt;
            font-weight: bold;
        }
        .heart{ font-size:15pt; }

        #pages{
            width:100%; height:50px;
            border: black 1px;
            text-align: center;
            margin: 500px 0 50px 0;
        }
        .pageNum{
            color:slategray;
            font-size:30pt;
        }
        .pageArrow{
            color:slategray;
            font-size:20pt;
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
        
    </style>
    <script>
    function selectOrder(order){ 
    	var order = order.value;
    	location.href="/movingcloset/movingcloset/search.do?search=${search }&keyword=${keyword }&order="+order;	
	}

	function clickPb(btn) {
		
		console.log(btn);
		if(btn.checked == true) {
			if(btn.value == "product") {
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementById("colorView").style.display="none";
				document.getElementById("tagView").style.display="none";
			}
			else if(btn.value == "brand") {
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementById("colorView").style.display="none";
				document.getElementById("tagView").style.display="none";
			}
			else if(btn.value == "color") {
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementById("colorView").style.display="inline";
				document.getElementById("tagView").style.display="none";
			}
			else if(btn.value == "tag") {
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "500";
				document.getElementById("colorView").style.display="none";
				document.getElementById("tagView").style.display="inline";
			}
		}
	}

    </script>
</head>
<body>
    <div class="container">
    <!--  
        <form action="">
        -->
        <div class="section-title">
			<h2>Search</h2>
		</div>
            <div id="list">
            
                <div id="filter">
                	<form action="/movingcloset/movingcloset/search.do?search=${search }&keyword=${keyword }&order=${order }" method="get">
	                	 <div id="searchSpan">
	 							<input type="text" id="searchIn" name="search" placeholder="Search.."  /> <!-- value="${searchW }" -->
	 							<button type="submit" id="searchBtn"><i id="searchIcon" class="fas fa-search"></i></button>
			                <hr id="ul1" />
	                    </div>
			            <br />
	                    <div id="filterBtn">
							<span><label class="filterLbl"><input type="radio" name="keyword" checked value="product" class="radiobtn" onclick="clickPb(this);" />PRODUCT</label></span>
							<span><label class="filterLbl"><input type="radio" name="keyword" value="brand" class="radiobtn" onclick="clickPb(this);" />BRAND</label></span>
							<span><label class="filterLbl"><input type="radio" name="keyword" value="color"  class="radiobtn" onclick="clickPb(this);" />COLOR</label></span>
							<span><label class="filterLbl"><input type="radio" name="keyword" value="tag"  class="radiobtn" onclick="clickPb(this);" />TAG</label></span>
	                    </div>
	                    <br /><hr />
	                    <div id="filterDropdown" style="display:inline;margin:auto;text-align:center">
			                <span id="colorView" style="display:none;">
									<c:forEach items="${viewColors }" var="color">
										<a class="colorpicks" href="/movingcloset/movingcloset/search.do?color=${color }&search=${search }&keyword=${keyword }&order=${order }">${color }</a>&nbsp;&nbsp;
									</c:forEach>
			                </span>
			                <span id="tagView" style="display:none;">
									<c:forEach items="${viewTags }" var="tag">
										<a class="tagpicks" href="/movingcloset/movingcloset/search.do?tag=${tag }&search=${search }&keyword=${keyword }&order=${order }">${tag }</a>&nbsp;&nbsp;
									</c:forEach>
			                </span>
	                        <select id="order" name="order" onchange="selectOrder(this)" style="display:inline;">
	                        	<option value="" diabled select hidden>정렬</option>
		                            <option value="idx" >신상품순</option>
		                            <option value="asc">낮은가격순</option>
		                            <option value="desc">높은가격순</option>
	                        </select>
							<!--                             
	                            <option value="best">베스트순</option>
	                            <option value="discount">높은할인순</option>
	                            <option value="interest">높은관심순</option>
	                        --> 
	                    </div>
	                    <br /><br />
 					</form>
                </div>

					 <c:forEach items="${searchList }" var="product">	
						<span class="products">
							<a class="pAs" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }"><img class="pImg" src="../resources/upload/${product.p_sfile }"></a>
                            <div class="brand">${product.p_brand }</div>
                            <div class="name"><label>${product.p_name }</label></div>
                            <div class="price">
                                <span class="origPrice"><strike>${product.p_price}</strike></span>
                                <span class="discountedPrice">${product.p_price}</span>
                                <span class="won">원</span>
                                <span class="heart" style="text-align:right;">
                                	<label class="heart">
                                		<i class="fa fa-heart" style="font-size:10pt;color:white;"></i>
                                	</label>
                                </span>
                            </div>
                            <div class="event"></div>
                        </span>   
					 </c:forEach>	
                		        
            </div>

    </div>
</body>
</html>