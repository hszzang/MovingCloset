<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<style>
/* 		nav{ width:100%; height:60px; margin:0px;} */
/* 	    #homeBtn{margin:0 3% 0 5%;} */
/* 	    li{ width:100px; margin-right:1%;} */
/* 	    i{ font-size:28px; color:white;} */
/* 	    #rightNav{ display:inline; float:right; margin:20px 0 0 600px; } */
	      
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
/* 	    a{  text-decoration:none; } */
	</style>
	
	<script>
		$(document).ready(function(){
			var delay = 200, setTimeoutConst;

		    $("#navi").click(function(){
		      $("#megaMenu").slideToggle("slow");
		    });
// 		    $("#navi").hover(function(){
// 		    	setTimeoutConst = setTimeout(function() {
// 		      		$("#megaMenu").slideDown("slow");
// 		    	}, delay);
// 		    }
// 		    , function() {
// 		    	clearTimeout(setTimeoutConst);
// 		    	if($("#megaMenu").hover()){
		    		
// 		    	}
// 		    	else if($("#megaMenu").mouseleave()) {
// 		    		$("#megaMenu").slideUp("slow");
// 		    	}
// 			});
		  });

    </script>


	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top d-flex">
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
	  
	  <span id="rightNav" class="ml-auto">
	      <label for=""><a href="../movingcloset/search.do"><i class="material-icons">search</i></a></label>
	      <label for=""><a href="../movingcloset/login.do"><i class="material-icons">shopping_basket</i></a></label>
	      <label for=""><a href="../movingcloset/mypage.do"><i class="material-icons">person</i></a></label>
	    </span>
	</nav>
	
	
	<div id="megaMenu">
<!-- 	    <div id="wrapper"> -->
	    <div class="container">
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
	</div> 
 
 
