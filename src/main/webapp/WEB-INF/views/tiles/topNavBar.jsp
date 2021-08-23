<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<style>

		#logo{
			text-decoration:none;
		}
		#logo:link{
			color: #ff6c2f;
		}
		
		.large-logo{
	        font-size: 35px;
	        transition: all 1s;
	        color:white;
	    }
	    .large-logo:hover{
	    	color:#daa520;
	    }
	    
	    .small-logo{
	        font-size: 25px;
	        color: #ff6c2f;
	    }
	
		/*navbar 변환전*/
		.nav-menu {
		 	display: flex;
		    justify-content: space-around;
		    padding: 15px;
		    align-items: center;
		    background-color: #000000;
		    position: fixed; top:0px; right:0px; left:0px;
		    z-index: 5;
		    width: 100%;
		    height: 115px;
		    color: white;
		}
		/*navbar 변환후 */
		.nav-black{
	        background-color: #000000;
	        color: #ff6c2f;
	        opacity: 1;
	        transition: all 1s;
	        height:80px;
	        opacity: 0.8;
	    }
	    
	    .nav-link{
	    	color:white;
	    }
	    
	    .nav-link:hover{
	    	color:#FFEBCD;
	    }
	    
	    #icon{
	    	align-items: center;
	    	color: white;
	    }
	    #icon:hover{
	    	color:#FFEBCD;
	    }
	    
	    .nav-sub1{
	    	background-color: #000000;
	    	width:100%;
	    	height:115px;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	    .nav-sub2{
	    	background-color: #000000;
	    	width:100%;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	height:115px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	    .nav-sub3{
	    	background-color: #000000;
	    	width:100%;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	height:115px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	    .nav-sub4{
	    	background-color: #000000;
	    	width:100%;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	height:115px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	    .nav-sub5{
	    	background-color: #000000;
	    	width:100%;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	height:115px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	    .nav-sub6{
	    	background-color: #000000;
	    	width:100%;
	    	position: fixed; top:80px; right:0px; left:0px;
	    	height:115px;
	    	z-index:4;
	    	display:none;
	    	opacity:0.8;
	    }
	  
	    .nav-content{
	    	padding-top:60px;
	    }
	    
	    #sub-content{
	    	text-decoration:none;
	    	color: white;
	    }
	    #sub-content:hover{
	    	color: #daa520;
	    }
	    .contentLink{
	    	width:100%;
	    }
	

	</style>
	<script>

		$(document).on('scroll', function(){
	        if($(window).scrollTop() > 50){
	            $('.nav-menu').addClass('nav-black');
	            $('#logo').addClass('small-logo');
	        }
	        else{
	        	$('.nav-menu').removeClass('nav-black');
	            $('#logo').removeClass('small-logo');
	        };
        });
		
		$(window).ready(function(){
			$('#nav-title1').click(function(){
				$('.nav-sub1').slideToggle();
				$('.nav-sub2').slideUp();
				$('.nav-sub3').slideUp();
				$('.nav-sub4').slideUp();
				$('.nav-sub5').slideUp();
				$('.nav-sub6').slideUp();
			});
			$('#nav-title2').click(function(){
				$('.nav-sub2').slideToggle();
				$('.nav-sub1').slideUp();
				$('.nav-sub3').slideUp();
				$('.nav-sub4').slideUp();
				$('.nav-sub5').slideUp();
				$('.nav-sub6').slideUp();
			});
			$('#nav-title3').click(function(){
				$('.nav-sub3').slideToggle();
				$('.nav-sub1').slideUp();
				$('.nav-sub2').slideUp();
				$('.nav-sub4').slideUp();
				$('.nav-sub5').slideUp();
				$('.nav-sub6').slideUp();
			});
			$('#nav-title4').click(function(){
				$('.nav-sub4').slideToggle();
				$('.nav-sub1').slideUp();
				$('.nav-sub2').slideUp();
				$('.nav-sub3').slideUp();
				$('.nav-sub5').slideUp();
				$('.nav-sub6').slideUp();
			});
			$('#nav-title5').click(function(){
				$('.nav-sub5').slideToggle();
				$('.nav-sub1').slideUp();
				$('.nav-sub2').slideUp();
				$('.nav-sub3').slideUp();
				$('.nav-sub4').slideUp();
				$('.nav-sub6').slideUp();
			});
			$('#nav-title6').click(function(){
				$('.nav-sub6').slideToggle();
				$('.nav-sub1').slideUp();
				$('.nav-sub2').slideUp();
				$('.nav-sub3').slideUp();
				$('.nav-sub4').slideUp();
				$('.nav-sub5').slideUp();
			});
		});
		

		
		function logout(){

			var result = confirm("로그아웃 하시겠습니까?");
			if(result){
				location.href = "../../movingcloset/logout.do";
			}else{
				location.href = "#";
			}
			
		}
		
		
    </script>
	<div class="nav-menu">
		<a class="large-logo" href="#" id="logo">Moving Closet<a>
		<a class="nav-link" id="nav-title1" href="javascript:void(0);">About</a>
		<a class="nav-link" id="nav-title2" href="javascript:void(0);">MOYO</a>
		<a class="nav-link" id="nav-title3" href="javascript:void(0);">NewD</a>
		<a class="nav-link" id="nav-title4" href="javascript:void(0);">STORE</a>
		<a class="nav-link" id="nav-title5" href="javascript:void(0);">Events&nbsp;|&nbsp;Coupons</a>
		<a class="nav-link" id="nav-title6" href="javascript:void(0);">CS center</a>
		<div id="icons">
			<a href=""><i class="material-icons" id="icon">search</i></a>
			&nbsp;
			<a href=""><i class="material-icons" id="icon">shopping_basket</i></a>
			&nbsp;
			
			<c:choose>
				<c:when test="${sessionScope.siteUserInfo != null}">
					<a href="#" onclick="logout();"><i class="material-icons" id="icon">exit_to_app</i></a>&nbsp;
					<a href="../movingcloset/mypage/coupon.do"><i class="material-icons" id="icon" onclick="infoclick();">info_outline</i></a>
				</c:when>
				<c:otherwise>  
					<a href="../movingcloset/login.do"><i class="material-icons" id="icon">person</i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


<!-- 	<div class="nav-black"> -->
<!-- 		<a class="large-logo" href="#" id="logo">Moving Closet<a> -->
<!-- 		<a class="nav-link" id="nav-title1" href="javascript:void(0);">About</a> -->
<!-- 		<a class="nav-link" id="nav-title2" href="javascript:void(0);">MOYO</a> -->
<!-- 		<a class="nav-link" id="nav-title3" href="javascript:void(0);">NewD</a> -->
<!-- 		<a class="nav-link" id="nav-title4" href="javascript:void(0);">STORE</a> -->
<!-- 		<a class="nav-link" id="nav-title5" href="javascript:void(0);">Events&nbsp;|&nbsp;Coupons</a> -->
<!-- 		<a class="nav-link" id="nav-title6" href="javascript:void(0);">CS center</a> -->
<!-- 		<div id="icons"> -->
<!-- 			<a href=""><i class="material-icons" id="icon">search</i></a> -->
<!-- 			&nbsp; -->
<!-- 			<a href=""><i class="material-icons" id="icon">shopping_basket</i></a> -->
<!-- 			&nbsp; -->
<!-- 			<a href=""><i class="material-icons" id="icon">person</i></a> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<div class="nav-sub1" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-around">
	            <a href="../movingcloset/introduce.do" id="sub-content" style="margin-right:-30px">회사소개</a>
	            <a href="../movingcloset/recruit.do" id="sub-content">채용정보</a>
	            <a href="../movingcloset/map.do" id="sub-content" style="margin-right:30px">오시는 길</a>
	        </div>
		</div>
	</div>
	<div class="nav-sub2" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-around">
	            <a href="../movingcloset/moyo.do" id="sub-content">모여</a>
<!-- 	            <a href="../movingcloset/moyoForm.do" id="sub-content">모여신청</a> -->
	            <a href="" id="sub-content">조르기</a>
	            <a href="" id="sub-content">지난 모여&nbsp;/&nbsp;조르기</a>
	        </div>
		</div>
	</div>
	<div class="nav-sub3" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-around">
	            <a href="../movingcloset/newD.do" id="sub-content">New Designer</a>
	            <a href="" id="sub-content">New Designer</a>
	            <a href="" id="sub-content">New Designer</a>
	        </div>
		</div>
	</div>
	<div class="nav-sub4" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-around">
	            <a href="/movingcloset/movingcloset/store.do" id="sub-content">STORE</a>
	        </div>
		</div>
	</div>
	<div class="nav-sub5" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-center">
	            <a href="../movingcloset/event_main.do" id="sub-content" style="margin-right:30px">EVENT</a>
	            <a href="../movingcloset/coupon_main.do" id="sub-content" style="margin-left:30px">COUPON</a>
	        </div>
		</div>
	</div>
	<div class="nav-sub6" id="nav-sub">
		<div class="nav-content container-fluid">
			 <div class="contentLink d-flex justify-content-around">
	            <a href="../movingcloset/notice.do" id="sub-content">공지사항</a>
	            <a href="" id="sub-content">1&nbsp;:&nbsp;1&nbsp;문의</a>
	            <a href="../movingcloset/qnalist.do" id="sub-content">FAQ</a>
	            <a href="../movingcloset/qnadetail.do" id="sub-content">Q&A</a>
	        </div>
		</div>
	</div>
	
	 
<!-- 	    <div id="wrapper"> -->
	    <!-- <div class="container">
	        <div class="megaLinks">
	            <a href="" class="megaA">회사소개</a>
	            <a href="" class="megaA">인재상</a>
	            <a href="" class="megaA">채용</a>
	            <a href="" class="megaA">오시는길</a>
	        </div>
	        <div class="megaLinks">
	            <a href="../movingcloset/moyo.do" class="megaA">모여</a>
	            <a href="../movingcloset/moyoForm.do" class="megaA">모여신청</a>
	            <a href="" class="megaA">지난(모여/조르기)</a>
	        </div>
	        <div class="megaLinks">
	            <a href="../movingcloset/newD.do" class="megaA">뉴디</a>
	            <a href="" class="megaA">뉴디</a>
	            <a href="" class="megaA">뉴디</a>
	        </div>
	        <div class="megaLinks">
	            <a href="../movingcloset/store.do" class="megaA">스토어</a>
	            <a href="" class="megaA">스토어</a>
	            <a href="" class="megaA">스토어</a>
	        </div>
	        <div class="megaLinks">
	            <a href="../movingcloset/event_main.do" class="megaA">이벤트</a>
	            <a href="../movingcloset/coupon_main.do" class="megaA">쿠폰</a>
	            <a href="" class="megaA">이벤트/쿠폰</a>
	        </div>
	        <div class="megaLinks">
	            <a href="../movingcloset/notice.do" class="megaA">공지사항</a>
	            <a href="" class="megaA">1:1문의</a>
	            <a href="../movingcloset/qnalist.do" class="megaA">FAQ</a>
	            <a href="../movingcloset/qnadetail.do" class="megaA">QnA</a>
	        </div>
	    </div>
	</div> --> 
 
 

