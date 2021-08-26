<%@page import="mybatis.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.css" />
<script src="../resources/jquery/jquery-3.6.0.js" ></script>

<title>NewDesiner</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="../resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="../resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../resources/assets/css/style.css" rel="stylesheet">




<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
  width: 100%;
  height: 100%;
}
</style>



</head>
<body>

<main id="main">

<section id="portfolio" class="portfolio">
  	<div class="container" data-aos="fade-up">
		<br><br><br>
	    <div class="section-title">
	    <h2>New Designer</h2>
	    </div>

	<div id="demo" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
    		<li data-target="#demo" data-slide-to="0" class="active"></li>
    		<li data-target="#demo" data-slide-to="1"></li>
    		<li data-target="#demo" data-slide-to="2"></li>
    		<li data-target="#demo" data-slide-to="3"></li>
    		<li data-target="#demo" data-slide-to="4"></li>
  		</ul>
  
  		<div class="carousel-inner">
  		
			<c:forEach items="${designerList }" var="newd">
	    		<div class="carousel-item active">
	
				<!-- ======= About Section ======= -->
				<section id="about" class="about">
					<div class="container" data-aos="fade-up">
				
				    <div class="row">
				    	<div class="col-lg-6">
				        	<img src="../resources/assets/img/about1.jpg" class="img-fluid" alt="">
				    	</div>
				    	<div class="col-lg-6 pt-6 pt-lg-0 content" align="left">
				        	<h1>﻿${newd.newd_name }</h1>
				        	<br/>
				        	<p>﻿
							${newd.newd_contents }
							<ul>
								<li><i class="icofont-rounded-right"></i> <strong>Style:</strong> ${newd.newd_style }</li>
								<li><i class="icofont-rounded-right"></i> <strong>Off-line Shop:</strong> MovingCloset Only</li>
							</ul>
				        	</p>
				       </div>
				    </div>
				
				   	</div>
				</section><!-- End About Section -->
				
					<div class="carousel-caption">
					
					</div>
					
				</div>
			</c:forEach>
			
			<div class="carousel-item">
    		<!-- ======= About Section ======= -->
			<section id="about" class="about">
			    <div class="container" data-aos="fade-up">
			    	<div class="row">
			    		<div class="col-lg-6">
			        		<img src="../resources/assets/img/about4.jpg" class="img-fluid" alt="">
			       		</div>
			       		<div class="col-lg-6 pt-6 pt-lg-0 content" align="left">
			        	<h1>﻿John Park</h1>
			        	<br/>
			        	<p>
			         ﻿
						세계 속 트랜드를 이끌 MovingCloset의<br/>
						디자이너 Jini Kim을 소개합니다.<br/>
						드디어 소개하는 New Designer Service 첫 주자는<br/>
						실력과 재능을 겸비한 우리나라의 샛별 디자이너 Jini kim.<br/>
						우리나라에 Jini Kim의 Style Selection을 선보이기에 앞서<br/>
						미국과 유럽에서 저명한 평가를 받은 New Designer 입니다.<br/>
						모던한 스타일과 트랜디한 감각을 포커싱하여<br/>
						신드롬을 불러일으킨 Jini Kim<br/>
						패션업계에서 주목하는 샛별의 제품들을<br/>
						MovingCloset에서 먼저 만나볼 수 있답니다.<br/>
						한 눈에 보이는 제품이 있다면 재빨리 구매하세요.<br/>
						이달의 패션 주인공은 바로 당신입니다.<br/><br/>
						<ul>
							<li><i class="icofont-rounded-right"></i> <strong>Style:</strong> Modern, Black, Trendy</li>
							<li><i class="icofont-rounded-right"></i> <strong>Off-line Shop:</strong> MovingCloset Only</li>
						</ul>
			        	</p>
			       		</div>
			    	</div>
				</div>
			</section><!-- End About Section -->
  
			    <div class="carousel-caption">
			    
			    </div>   
		    </div>
    		
    		
 		</div>
  	</div>
  	
	  	<a class="carousel-control-prev" href="#demo" data-slide="prev">
	    	<span class="carousel-control-prev-icon"></span>
	  	</a>
	  	<a class="carousel-control-next" href="#demo" data-slide="next">
	    	<span class="carousel-control-next-icon"></span>
	  	</a>


    </div>
      
	<br/><br/>
    <div class="row" data-aos="fade-up" data-aos-delay="100">
        <div class="col-lg-12 d-flex justify-content-center">
        	<ul id="portfolio-flters">
            	<li data-filter="*" class="filter-active">All</li>
            	<li data-filter=".filter-jini">Jini</li>
	            <li data-filter=".filter-john">John</li>
	            <li data-filter=".filter-sally">Sally</li>
	            <li data-filter=".filter-sophia">Sophia</li>
	            <li data-filter=".filter-kelly">Kelly</li>
            </ul>
        </div>
    </div>


	
    <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
    
    
    	<c:forEach items="${newdList }" var="product">
	    	<!-- 링크(상세보기페이지로이동)버튼 -->
	    	<div class="col-lg-4 col-md-6 portfolio-item filter-${product.p_brand }">
	        	<div class="portfolio-wrap">
	        		<img src="../resources/assets/img/newdd/${product.p_img}" class="img-fluid" alt="">
	            		<div class="portfolio-info">
	            		
	              			<h4>${product.p_name }</h4>
	            				<p>${product.p_price}</p>
	              					<div class="portfolio-links">
	                					<a href="../resources/assets/img/newdd/${product.p_img}" data-gall="portfolioGallery" class="venobox"><i class="bx bx-plus"></i></a>
	                					<a href="/movingcloset/store/detail.do"><i class="bx bx-link"></i></a>
	              					</div>
	            		</div>
	          	</div>
	     	</div>
     	</c:forEach>
    
 
      	

    </div>
</section><!-- End Portfolio Section -->
</main><!-- End #main -->




<div id="preloader"></div>
<a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>

<!-- Vendor JS Files -->
<script src="../resources/assets/vendor/jquery/jquery.min.js"></script>
<script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="../resources/assets/vendor/php-email-form/validate.js"></script>
<script src="../resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="../resources/assets/vendor/counterup/counterup.min.js"></script>
<script src="../resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../resources/assets/vendor/venobox/venobox.min.js"></script>
<script src="../resources/assets/vendor/aos/aos.js"></script>

<!-- Template Main JS File -->
<script src="../resources/assets/js/main.js"></script>




</body>
</html>