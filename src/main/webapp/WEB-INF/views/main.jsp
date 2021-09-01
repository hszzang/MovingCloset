<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovingCloset</title>
<style type="text/css">
.submenu{
	font-size:45px;
	opacity:30%; 
	transition : font-size 1s;
}


 li > a > span:hover{
	color:white; 
	opacity:1;
	font-size:60px;
	transform: scale(1.5);
	transition: transform 1s;

} 

 li > a > span:hover span{
	color:white; 
	opacity:1;
	font-size:60px;
	transform: scale(1.5);
	transition: transform 1s;


} 



</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
									
    <link rel="stylesheet" href="../resources/main/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../resources/main/css/animate.css">
    
    <link rel="stylesheet" href="../resources/main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/main/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/main/css/magnific-popup.css">

    <link rel="stylesheet" href="../resources/main/css/aos.css">

    <link rel="stylesheet" href="../resources/main/css/ionicons.min.css">

    <link rel="stylesheet" href="../resources/main/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/main/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../resources/main/css/flaticon.css">
    <link rel="stylesheet" href="../resources/main/css/icomoon.css">
    <link rel="stylesheet" href="../resources/main/css/style.css">
  </head>
  <body>

    <div class="page">
    <nav id="colorlib-main-nav" role="navigation">
      <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle active"><i></i></a>
      <div class="js-fullheight colorlib-table">
        <div class="img" style="background-image: url(../resources/main/images/closet01.jpg);"></div>
        <div class="colorlib-table-cell js-fullheight">
          <div class="row no-gutters">
            <div class="col-md-12 text-center">
              <h1 class="mb-4"><a href="#" class="logo">Moving Closet</a></h1>
              <ul >
                <li><a href="../movingcloset/moyo.do"><span class="submenu">모여</span></a></li>
                <li><a href="../movingcloset/newD.do"><span class="submenu">New D</span></a></li>
                <li><a href="../movingcloset/store.do"><span class="submenu">STORE</span></a></li>
                <li><a href="../movingcloset/event_main.do"><span class="submenu">Event</span></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>
    
    <div id="colorlib-page">
      <header>
      	<div class="container">
	        <div class="colorlib-navbar-brand">
	          <a class="colorlib-logo" href="./moyo.do">Moving Closet</a>
	        </div>
	        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
        </div>
      </header>

      <section class="hero-wrap js-fullheight">
	      <div class="container-fluid px-0">
	        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
	          <div class="col-md-12 ftco-animate text-center">
	          	<div class="desc">
	          		<span class="subheading"></span>
		            <h1 style="background-image: url(../resources/main/images/bg_1.jpg);">Moving Closet</h1>
		            <span class="subheading-2"></span>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>

	    <section class="ftco-section ftco-no-pb ftco-no-pt">
	    	<div class="container-fluid px-0">
	    		<div class="row no-gutters">
	    		
	    			<!-- 첫번째부분 -->
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							
	    							<h2 class="mb-4"><a href="../movingcloset/store.do">All the brands you're looking for are here, click!</a></h2>
	    							<p>우리집 앞에서 유명브랜드 쇼핑을 할 수 있을까?<br> 쇼핑의 시작은 바로 지금 MovingCloset 입니다.<br> 평소 즐겨입던 브랜드의 제품들을 만나보세요.<br/>
	    							 사이트에서 바로 구매할수도, 집 앞에서 받아볼 수도 있답니다.<br>
	    							 당신이 찾는 모든 브랜드 MovingCloset과 함께합니다.</p>
	    							 
	    							<p class="mb-0 mt-4"><a href="../movingcloset/store.do" class="btn btn-primary">Store 바로가기 <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							
	    							<h2 class="mb-4"><a href="../movingcloset/newD.do">Do you want new designer merchandise?</a></h2>
	    							<p>나만의 특별한 감성적인 제품을 찾고 싶다면<br>
	    							MovingCloset NewDesigner 를 주목해주세요.<br>
	    							지금까지 만나보지 못했던 트렌디한 제품들을<br>
	    							합리적인 가격에 만나볼 수 있답니다.<br>
	    							망설임은 구매를 늦추는 것 뿐! MovingCloset에서 만나보세요.
	    							</p>
	    							<p class="mb-0 mt-4"><a href="../movingcloset/newD.do" class="btn btn-primary">NewD 바로가기 <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			
	    			
	    			
	    		
	    			<div class="col-md-12 blog-wrap bg-darken">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 d-flex justify-content-center align-items-center order-md-last js-fullheight">
	    						<div class="img" style="background-image: url(../resources/main/images/image_4.jpg);"></div>
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_2.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="https://forms.gle/Xn98gS7ELfe5cMLh9" target="_blank">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="https://forms.gle/Xn98gS7ELfe5cMLh9" target="_blank" class="btn btn-primary">입점신청 <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			
	    			
	    			
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_5.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_2.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_6.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_3.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_7.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_4.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_8.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_3.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_9.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_3.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>

	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_10.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_3.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>

	    			<div class="col-md-12 blog-wrap bg-darken">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 d-flex justify-content-center align-items-center order-md-last js-fullheight">
	    						<div class="img" style="background-image: url(../resources/main/images/image_11.jpg);"></div>
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_2.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>

	    			<div class="col-md-12 blog-wrap">
	    				<div class="row no-gutters align-items-center">
	    					<div class="col-md-6 img js-fullheight" style="background-image: url(../resources/main/images/image_12.jpg);">
	    						
	    					</div>
	    					<div class="col-md-6">
	    						<div class="text p-md-5 p-4 ftco-animate">
	    							<div class="icon d-flex align-items-center mb-5">
	    								<div class="img" style="background-image: url(../resources/main/images/person_3.jpg);"></div>
	    								<div class="position pl-3">
	    									<h4 class="mb-0">Jamie Jonson</h4>
	    									<span>fashion.com</span>
	    								</div>
	    							</div>
	    							<h2 class="mb-4"><a href="blog-single.html">Make Peace With Your Broken Pieces</a></h2>
	    							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
	    							<p class="mb-0 mt-4"><a href="#" class="btn btn-primary">Read more <span class="ion-ios-arrow-forward"></span></a></p>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </section>

      
      <footer class="ftco-footer ftco-section img">
	    	<div class="overlay"></div>
	      <div class="container">
	        
	        <div class="row">
	          <div class="col-md-12 text-center">

	            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This website is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="../movingcloset/introduce.do" target="_blank">MovingCloset</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	          </div>
	        </div>
	      </div>
	    </footer>
	    
	    

      <!-- loader -->
      <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

      </div>
    </div>


    <script src="../resources/main/js/jquery.min.js"></script>
    <script src="../resources/main/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../resources/main/js/popper.min.js"></script>
    <script src="../resources/main/js/bootstrap.min.js"></script>
    <script src="../resources/main/js/jquery.easing.1.3.js"></script>
    <script src="../resources/main/js/jquery.waypoints.min.js"></script>
    <script src="../resources/main/js/jquery.stellar.min.js"></script>
    <script src="../resources/main/js/owl.carousel.min.js"></script>
    <script src="../resources/main/js/jquery.magnific-popup.min.js"></script>
    <script src="../resources/main/js/aos.js"></script>
    <script src="../resources/main/js/jquery.animateNumber.min.js"></script>
    <script src="../resources/main/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="../resources/main/js/google-map.js"></script>
    <script src="../resources/main/js/main.js"></script>
    
  </body>
</html>