<%@page import="mybatis.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/coupon_main.css" />

<title>COUPON :: MovingCloset</title>

<%
CouponDTO couponDTO = new CouponDTO();
couponDTO.setUserid((String)session.getAttribute("siteUserInfo"));
%>
<script>

$(function() {
    $.ajax({
        url:'../couponlist',
        type : 'POST',
        dataType:'json',
        success :  function(result){
        	let res = "";
        	for(let i=0 ; i<result.length ; i++){
        		res += "<div class='list_coupon'>"
				+ "<img src='../resources/images/coupon/musinsa_blackfriday.jpg'>"
				+ "<div class='list_coupon_cont'>"
				+ "<strong>"+ result[i].cou_name +"</strong>"
				+ "<p>"+ result[i].cou_content +"</p>"
				+ "</div>"
				+ "<div class='list_coupon_down'>"
				+ "<button style='outline:none; border:none; background-color:transparent;' id='"+ result[i].cou_code +"' onclick='callBydownload(this.id);'>DOWNLOAD</button>"
				+ "</div>"
				+ "</div>";
        	}
        	$('.list_wrap').append(res);
        },
        error : function(request, status, error) {
        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
        }
    });
});

var couponDTO = {};
function callByBrand(brand) {
	couponDTO.cou_brand = brand;
	
	search(couponDTO);
};

function callByCate(cate) {
	couponDTO.cou_cate = cate;
	
	search(couponDTO);
};

function callByType(type) {
	couponDTO.cou_name = type;
	
	search(couponDTO);
};
 
function callBydownload(code) {
	couponDTO.cou_code = code;
	download(couponDTO);
};

function download(couponDTO) {
	
	$.ajax({
		url : '../download',
		type : 'POST',
		data : couponDTO,
		dataType : 'json',
		success : function(map) {
			alert(map.alert);
		},
		error : function(request, status, error) {
	    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	    }
	});
};

function search(couponDTO) {

	$.ajax({
        url:'../couponlist',
        type : 'POST',
        data : couponDTO,
        dataType:'json',
        success :  function(result){
        	let res = "";
        	for(let i=0 ; i<result.length ; i++){
        		res += "<div class='list_coupon'>"
				+ "<img src='../resources/images/coupon/musinsa_blackfriday.jpg'>"
				+ "<div class='list_coupon_cont'>"
				+ "<strong>"+ result[i].cou_name +"</strong>"
				+ "<p>"+ result[i].cou_content +"</p>"
				+ "</div>"
				+ "<div class='list_coupon_down'>"
				+ "<button style='outline:none; border:none; background-color:transparent;' id='"+ result[i].cou_code +"' onclick='callBydownload(this.id);'>DOWNLOAD</button>"
				+ "</div>"
				+ "</div>";
        	}
        	$('.list_wrap').empty();
        	$('.list_wrap').append(res);
        },
        error : function(request, status, error) {
        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
        }
    });
	
};


</script> 
<style type="text/css">
ul > li > a{
	text-decoration: none;
	color:black;
}

ul > li > a:hover{
	text-decoration: none;
	color:black;
	font-weight: bold;
}

div.coupon_brand:hover{
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
.sectiontitle {
   text-align: center;
   padding-bottom: 10px;
   padding-top: 50px;
}

.sectiontitle h2 {
   font-size: 32px;
   font-weight: bold;
   text-transform: uppercase;
   margin-bottom: 10px;
   padding-bottom: 20px;
   position: relative;
}

.sectiontitle h2::after {
   content: '';
   position: absolute;
   display: block;
   width: 50px;
   height: 3px;
   background: #555555;
   bottom: 0;
   left: calc(50% - 25px);
}
</style>
</head>
<body>
	<div class="container">

	    <div class="sectiontitle" style="margin-top:150px;">
	    	<h2>COUPON</h2>
	    </div>
	    
	<div class="coupon_wrap">

		<a id="nike" href="javascript:void(0);" onclick="callByBrand(this.id);" style="text-decoration: none;">
			<div class="coupon_brand">
				<img src="../resources/images/coupon_brand/nike.png">
			</div>
		</a>
		<a id="gucci" href="javascript:void(0);" onclick="callByBrand(this.id);" style="text-decoration: none;">
			<div class="coupon_brand">
				<img src="../resources/images/coupon_brand/gucci.png">
			</div>
		</a>
		<a id="musinsa" href="javascript:void(0);" onclick="callByBrand(this.id);" style="text-decoration: none;">
			<div class="coupon_brand">
				<img src="../resources/images/coupon_brand/musinsa.png">
			</div>
		</a>
		<a id="newbalance" href="javascript:void(0);" onclick="callByBrand(this.id);" style="text-decoration: none;">
			<div class="coupon_brand">
				<img src="../resources/images/coupon_brand/new balance.png">
			</div>
		</a>
		<a id="adidas" href="javascript:void(0);" onclick="callByBrand(this.id);" style="text-decoration: none;">
			<div class="coupon_brand">
				<img src="../resources/images/coupon_brand/adidas.png">
			</div>
		</a>
		
		<div class="category" style="margin-top:30px;">
			<span>CATEGORY</span>
			<ul class="category_list">
				<li class="category_detail"><a href="javascript:void(0);" onclick="callByCate();">전체</a></li>
				<li class="category_detail"><a href="javascript:void(0);" id="cou_idx" onclick="callByCate(this.id);">최신순</a></li>
				<li class="category_detail"><a href="javascript:void(0);" id="cou_per" onclick="callByCate(this.id);">할인율순</a></li>
				<li class="category_detail"><a href="javascript:void(0);" id="cou_views" onclick="callByCate(this.id);">인기순</a></li>
			</ul>
		</div>
		<div class="category">
			<span>TYPE</span>
			<ul class="category_list">
				<li class="category_detail"><a href="javascript:void(0);" onclick="callByType();">전체</a></li>
				<li class="category_detail"><a href="javascript:void(0);" onclick="callByType('상의');">상의</a></li>
				<li class="category_detail"><a href="javascript:void(0);" onclick="callByType('하의');">하의</a></li>
				<li class="category_detail"><a href="javascript:void(0);" onclick="callByType('신발');">신발</a></li>
			</ul>
		</div>
		
		<hr width="80%">

		
		<div class="list_wrap">
		
		<%--
			<c:forEach items="${couponList }" var="row">
			
				<div class="list_coupon">
					<img src="../resources/images/coupon/musinsa_blackfriday.jpg">
					<div class="list_coupon_cont">
						<strong>${row.cou_name }</strong>
						<p>의류, 신발 최대 80%할인행사</p>
					</div>
					<div class="list_coupon_down">
						<a href="#">DOWNLOAD</a>
					</div>
				</div>
				
			</c:forEach>
		 --%>
			
		</div>
 
	</div>
	</div>
</body>

</html>