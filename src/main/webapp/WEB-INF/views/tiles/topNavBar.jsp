<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<style>
		/* nav{ width:100%; height:60px; margin:0px;}
	    #homeBtn{margin:0 3% 0 5%;}
	    li{ width:100px; margin-right:1%;}
	    i{ font-size:28px; color:white;}
	    #rightNav{ display:inline; float:right; margin:20px 0 0 600px; }
	      
	    #megaMenu{
	        width:100%; height:12%; display:none;																																																																																					
	        background-color: #212529; color:whitesmoke;
	        padding:65px 20% 0 15%; 
	    }
	    .megaLinks{
	        width:100px; height:200px; display:inline-block;
	        color:whitesmoke; font-size:10pt; text-align:center;    
	        padding-top:50px;
	    }
	    .megaA{
	        color:whitesmoke; font-size:11pt; display:block;
	        margin-bottom:10px;
	    }
	    .megaA:hover{ color:whitesmoke; text-decoration:none; }
	    a{  text-decoration:none; } */
	
	
		
		.large-logo{
	        font-size: 30px;
	        transition: all 1s;
	    }
	    
	    .small-logo{
	        font-size: 20px;
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
		    color: white;
		}
		/*navbar 변환후*/
		.nav-black{
	        background-color: #000000;
	        color: #ff6c2f;
	        opacity: 1;
	        transition: all 1s;
	        height:30px;
	    }
	    
	    .nav-link{
	    	color:white;
	    }
	    
	    .material-icons{
	    	align-items: center;
	    	color: white;
	    }
		
	
	</style>
	
	<script>
		
	/* $(document).ready(function(){
		    $("#navi").click(function(){
		      $("#megaMenu").slideToggle("slow");
		    });
		  }); */
		
		
		$(window).on('scroll', function(){
	        if($(window).scrollTop() > 100 ){
	            $('.nav-menu').addClass('nav-black');
	            $('.nav-menu h4').addClass('small-logo');
	        }
	        else{
	            $('.nav-menu').removeClass('nav-black');
	            $('.nav-menu h4').removeClass('small-logo');
	        };
        });
		  
		$('.nav-link').hover(function(){
			
		});

    </script>
    
</head>
<body>

<!-- body style="height:1500px" -->	

	<div class="nav-menu nav-black">
		<h4 style="margin:0" class="large-logo"><i href="#">Moving Closet</i></h4>
		<a class="nav-link" href="#">About</a>
		<a class="nav-link" href="#">MOYO</a>
		<a class="nav-link" href="#">newD</a>
		<a class="nav-link" href="#">STORE</a>
		<a class="nav-link" href="#">Events|Coupons</a>
		<a class="nav-link" href="#">CS center</a>
		<div id="icons">
			<a href=""><i class="material-icons">search</i></a>
			&nbsp;
			<a href=""><i class="material-icons">shopping_basket</i></a>
			&nbsp;
			<a href=""><i class="material-icons">person</i></a>
		</div>
	</div> 
	
	
	
	<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	  <a class="navbar-brand" id="homeBtn" href="#">Moving Closet</a>
	  <ul class="navbar-nav" id="navi">
	    <li class="nav-item">
	        <a class="nav-link" href="#">About</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">MOYO</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">newD</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">STORE</a>
	    </li>
	    <li class="nav-item" style="margin-right:70px;">
	        <a class="nav-link" href="#">Events&nbsp;|&nbsp;Coupons</a>
	    </li>
	    <li class="nav-item">
	        <a class="nav-link" href="#">CS center</a>
	    </li>
	  </ul>
	  
	  <span id="rightNav">
	      <label for=""><a href=""><i class="material-icons">search</i></a></label>
	      <label for=""><a href=""><i class="material-icons">shopping_basket</i></a></label>
	      <label for=""><a href=""><i class="material-icons">person</i></a></label>
	    </span>
	</nav>
	
	<div id="megaMenu" style="width:100%;">
	    <div id="wrapper">
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
	            <a href="" class="megaA">FAQ</a>
	            <a href="" class="megaA">QnA</a>
	        </div>
	    </div>
	</div> -->
 
 
 

</body>
</html>