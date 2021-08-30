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
        #list{
            border:none;
            width:100%; height:auto;
            margin-bottom:200px; padding:0;
            display:inline; float:left;
        }

        #filter{
            width:80%; height:350px; border:none;
            padding:0; margin:0 15% 0 10%;
        }
        #searchSpan{
        	display:inline;
        }
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
    	.fBtns{
    		border:none; background-color:white;
    		font-weight:lighter;	
    	}
    	.fBtns input[type="radio"]{
		    display:none;
		}
		.fBtns input[type="radio"] + label {
			font-size:1.3em; font-weight:lighter;
		}	
		.fBtns input[type="radio"]:checked + label {
		    font-weight:bold;
		}
    	.filterLbl{
    		font-size:1.3em; font-weight:lighter;
    		margin-left:6%;
    	}
    	#ul1{
    	
    	}
        #filterBtn{
            display:inline;
            margin-left:50px;
            font-size:20pt;
        }
        #filterDropdown{
            margin-left:80%;
            display:inline;
        }
        #order{
        	float:right;
            width:150px; height:35px;
            text-align: center;
            border: white;
        }
		
        .products{
            width: 274px; height:420px;
            border:none; padding:0;
            display:inline-block;
        }
        .img{ width:260px; height:300px; }
        .brand{ font-size: 10pt; font-color:darkgray; font-weight:bolder;}
        a{ text-decoration: none; color:black;}
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
    	//obj.submit(); //obj자체가 form이다.
    	//var page = parseInt(val);
    	var order = order.value;
    	location.href="/movingcloset/movingcloset/search.do?search=${search }&keyword=${keyword }&order="+order;	
	}
    </script>
</head>
<body>
    <div class="container">
    <!--  
        <form action="">
        -->
            <div id="list">
            
                <div id="filter">
                	<form action="/movingcloset/movingcloset/search.do?search=${search }&keyword=${keyword }&order=${order }" method="get">
	                	 <div id="searchSpan">
	 							<input type="text" id="searchIn" name="search" placeholder="Search.."/>
	 							<button type="input" id="searchBtn"><i id="searchIcon" class="fas fa-search"></i></button>
			                <hr id="ul1" />
	                    </div>
			            <br />
	                    <div id="filterBtn">
							<span><label class="filterLbl" for="pb"><input type="radio" class="fBtns" id="pb" name="keyword" value="product" >PRODUCT</label></span>
							<span><label class="filterLbl" for="bb"><input type="radio" class="fBtns" id="bb" name="keyword" value="brand" >BRAND</label></span>
							<span><label class="filterLbl" for="cb"><input type="radio" class="fBtns" id="cb" name="keyword" value="color" >COLOR</label></span>
							<span><label class="filterLbl" for="tb"><input type="radio" class="fBtns" id="tb" name="keyword" value="flag" >TAG</label></span>
	                    </div>
	                    <br /><hr />
	                    <span id="filterDropdown">
	                        <select id="order" name="order" onchange="selectOrder(this)">
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
	                    </span>
 					</form>
                </div>
						
					 <c:forEach items="${searchList }" var="product">	
						<span class="products">
							<a href="/movingcloset/store/detail.do?p_idx=${product.p_idx }"><img class="img" src="../resources/upload/${product.p_sfile }"></a>
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