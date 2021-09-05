<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="mybatis.ProductDTO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
    <style>
    	.container{width:100%; height:auto; margin:200px 0 100px 0; }
    	
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
            border:black;
            width:100%; height:auto; padding:0%;   
        }

        #filter{
            width:80%; height:150px; border:none;
            text-align:center;
            margin:50px 10% 100px 10%;
        }
        
        .radiobtn{
    		border:none; background-color:white;
    		font-weight:lighter;	
    	}
    	.radiobtn:checked{ display:none; }
		.radiobtn{ font-size:1.3em; font-weight:light; display:none; }
    	.filterLbl{
    		font-size:1.3em; font-weight:100;
    		margin-left:2%;
    	}

        #filterBtn{
            display:inline;
            margin:10px 0 10px 0;
            font-size:20pt;
        }
        
        
        /*
        #filterBtn{
            display:inline; text-align:center;
            font-size:12pt;
        }
        */
        #filterDropdown{
            margin-left:82%; margin-bottom:100px; text-align:right;
            display:inline;
        }
        #order{
            width:150px; height:50px;
            text-align: center; border: none;
        }
		#order:focus{outline:none;}
		
        .products{
            width: 274px; height:420px;
            border:none; padding: 0;
            display:inline-block;
        }
        .img{ width:250px; height:290px; }
        .brand{ font-size: 10pt; font-color:darkgray; font-weight:bolder;}
        .as{ text-decoration: none; color:black;}
        .name{ font-size: 11pt; }
        .origPrice{ 
            font-size:12pt; 
            color:lightgray;
        }
        .discountedPrice{
            color: #FF6C2F;
            font-size:14pt;
            font-weight: bold;
        }
        .won{color:gray; font-size:12pt; }
        .heart{ font-size:15pt; }

        #pages{
        	text-align:right;
			margin: 50px 0% 100px 81%;
			display:inline-block;
        }
        #pageSel{
        	width:70px; height:40px;
        	border:lightgray solid 1px;
        	text-align:center; font-size:11pt; display:inline;
        }
        #pgTotal{
        	color:gray; font-size: 10pt; 
        	margin:0 10px 0 10px;display:inline;
        }
        .pageMove{
        	width:40px; height:40px; display:inline;
        	border:none; padding:0;
        	color:white; font-size:10pt; font-weight:bold;}
        .pageMove:focus{outline:none;}
        #pmL{background-color:black; display:inline;}
        #pmR{background-color:black; display:inline;}

		#productInsert{width:100px; height:40px; background-color:black; color:white; }

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
    	location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order="+order+"&pageShow=${pageC}";	
	}
    
    function selectPage(page){ 
    	//obj.submit(); //obj자체가 form이다.
    	var page = page.value;
    	location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order=${order}&pageShow="+page;
	}
    
    function flagSubmit(val){
    	var flag = val;
    	flag.submit();
    }
    /*
    function check() {
    	var flag;
    		
    	  if(document.frm.flag[1].checked == true){
    		  var flag = document.frm.flag[1];
    		  flag.submit();
    	  }
    	  else if(document.frm.flag[2].checked == true){
    		  var flag = document.frm.flag[2];
    		  flag.submit();
    	  }
    	  else if(document.frm.flag[3].checked == true){
    		  var flag = document.frm.flag[3];
    		  flag.submit();
    	  }
    	  else if(document.frm.flag[4].checked == true){
    		  var flag = document.frm.flag[4];
    		  flag.submit();
    	  }
    	  else if(document.frm.flag[5].checked == true){
    		  var flag = document.frm.flag[5];
    		  flag.submit();
    	  }
    	}
    */
    function lpBtn(page){
    	var left = document.getElementById("pmL");
    	if(page <= ${start}){
    		/*
    		left.style.background = 'gray';
    		*/
    		left.disabled="true";
    	}	
    	else{
    		/*
    		left.style.background = 'black';
    		*/
    		left.disabled= "false";
    		page = page - 1;
    		location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order=${order}&pageShow="+page;
    	}
    }
    
    function rpBtn(page){
    	var right = document.getElementById("pmR");
    	if(page >= ${pageEnd}){
    		/*
    		right.style.backgroundColor = "gray";
    		*/
    		right.disabled="true";
    	}	
    	else{
    		/*
    		right.style.backgroundColor = "black";
    		*/
    		right.disabled="false";
    		page = page + 1;
    		location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order=${order}&pageShow="+page;
    	}
    }
    
function clickPb(btn) {
	var flag;
	console.log(btn);
		//if(btn.checked == true){
		if(btn.checked == true || ${flag}!=null){
			if(btn.value == "all") {
				flag="all";
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[4].style.fontWeight = "100";
				location.href="/movingcloset/movingcloset/store.do?flag="+flag;
			}
			else if(btn.value == "의류") {
				flag="의류";
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[4].style.fontWeight = "100";
				location.href="/movingcloset/movingcloset/store.do?flag="+flag;
			}
			else if(btn.value == "신발") {
				flag="신발"; 
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[4].style.fontWeight = "100";
				location.href="/movingcloset/movingcloset/store.do?flag="+flag;
			}
			else if(btn.value == "가방") {
				flag="가방"; 
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "500";
				document.getElementsByClassName("filterLbl")[4].style.fontWeight = "100";
				location.href="/movingcloset/movingcloset/store.do?flag="+flag;
			}
			else if(btn.value == "잡화") {
				flag="잡화"; 
				document.getElementsByClassName("filterLbl")[0].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[1].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[2].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[3].style.fontWeight = "100";
				document.getElementsByClassName("filterLbl")[4].style.fontWeight = "500";
				location.href="/movingcloset/movingcloset/store.do?flag="+flag;
			}
			
		}
	}
    
    </script>
    
</head>
<body>
    <div class="container">
	    <div class="section-title">
			<h2>STORE</h2>
		</div>
        
            <div id="list">
	                <div id="filter">
		            	<form name="listFrm" action="/movingcloset/movingcloset/store.do?flag=${flag }&order=${order }&pageShow=${pageC }" method="get" >
		            		<hr /><br />
		            		<div id="filterBtn">
								<span><label class="filterLbl"><input type="radio" name="flag" checked value="all" class="radiobtn" onclick="clickPb(this);" />ALL</label></span>
								<span><label class="filterLbl"><input type="radio" name="flag" value="의류" class="radiobtn" onclick="clickPb(this);" />CLOTHES</label></span>
								<span><label class="filterLbl"><input type="radio" name="flag" value="신발" class="radiobtn" onclick="clickPb(this);" />SHOES</label></span>
								<span><label class="filterLbl"><input type="radio" name="flag" value="가방"  class="radiobtn" onclick="clickPb(this);" />BAGS</label></span>
								<span><label class="filterLbl"><input type="radio" name="flag" value="잡화"  class="radiobtn" onclick="clickPb(this);" />ETC</label></span>
	                   		</div>
	                   		<br /><hr />
		            	<!-- 
		                    <span id="filterBtn">
		                        <button type="submit" class="btn btn-dark" name="flag" value="all" onClick="flagSubmit(this.form.value)">전체</button>
		                        <button type="submit" class="btn btn-dark" name="flag" value="의류" onClick="flagSubmit(this.form.value)">의류</button>
		                        <button type="submit" class="btn btn-dark" name="flag" value="신발" onClick="flagSubmit(this.form.value)">신발</button>
		                        <button type="submit" class="btn btn-dark" name="flag" value="가방" onClick="flagSubmit(this.form.value)">가방</button>
		                        <button type="submit" class="btn btn-dark" name="flag" value="잡화" onClick="flagSubmit(this.form.value)">잡화</button>
		                    </span>
		                 -->
		                    <span id="filterDropdown">
			                        <select name="order" id="order" onchange="selectOrder(this)">
			                        	<option value="" diabled select hidden>정렬</option>
			                            <option value="idx" >신상품순</option>
			                            <option value="asc">낮은가격순</option>
			                            <option value="desc">높은가격순</option>
			                        </select>
		                            <!-- 
			                        <option value="best" >베스트순</option>
		                            <option value="discount">높은할인순</option>
		                            <option value="interest">높은관심순</option>
		                             -->
		                    </span>
		                </form>      
	                </div>
                
					 <c:forEach items="${pagedList }" var="product">	
						<span class="products">
							<a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}"><img class="img" src="../resources/upload/${product.p_sfile }"></a>
                            <div class="brand">${product.p_brand }</div>
                            <div class="name"><label>${product.p_name }</label></div>
                            <div class="price">
                                <!--  <span class="origPrice"><strike>${product.p_price}</strike></span> -->
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
            <div id="pages">
            	<form action="/movingcloset/movingcloset/store.do?flag=${flag }&order=${order }&pageShow=${pageC }" method="get" >
	            	<select name="pageShow" id="pageSel" onchange="selectPage(this)">
	            		<option value="" diabled select hidden >${pageC }</option>
		            		<c:forEach  items="${pages }" var="page" >
		            			<option value="${page }">${page }</option>
		            		</c:forEach>
			    	</select>
			    	
				    <span id="pgTotal">of ${pageEnd }</span>
				    <button type="button" class="pageMove" id="pmL" onclick="lpBtn(${pageC })"> < </button>
				    <button type="button" class="pageMove" id="pmR" onclick="rpBtn(${pageC })"> > </button>
			    </form>
            </div>
            <!-- 
            <div style="text-align:right;">
            	<button type="button" id="productInsert" onclick="javascript:location.href='/movingcloset/store/insert.do';">상품추가</button>
            </div>
             -->
    </div>
</body>
</html>