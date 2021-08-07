<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://jacoblett.github.io/bootstrap4-latest/bootstrap-4-latest.min.js"></script>
<!-- 
<script src="https://bootstrapcreative.com/wp-bc/wp-content/themes/wp-bootstrap/codepen/bootstrapcreative.js?v=11"></script>
-->
<style>
    /*Nav 시작*/
        /* adds some margin below the link sets  */
        .navbar .dropdown-menu div[class*="col"] {
        margin-bottom:1rem;
        }

        .navbar .dropdown-menu {
        border:none;
        background-color:#000000!important;
        /*background-color:#343A40!important; */
        /*background-color:#0060c8!important; */
        }

        /* breakpoint and up - mega dropdown styles */
        @media screen and (min-width: 992px) {
        
        /* remove the padding from the navbar so the dropdown hover state is not broken */
        .navbar {
        padding-top:0px;
        padding-bottom:0px;
        }

        /* remove the padding from the nav-item and add some margin to give some breathing room on hovers */
        .navbar .nav-item {
        padding:.5rem .5rem;
        margin:0 .25rem;
        }

        /* makes the dropdown full width  */
        .navbar .dropdown {position:static;}

        .navbar .dropdown-menu {
        width:100%;
        left:0;
        right:0;
        /*  height of nav-item  */
        top:45px;
        
        display:block;
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s, opacity 0.3s linear;
        
        }
        /* shows the dropdown menu on hover */
        .navbar .dropdown:hover .dropdown-menu, .navbar .dropdown .dropdown-menu:hover {
        display:block;
        visibility: visible;
        opacity: 1;
        transition: visibility 0s, opacity 0.3s linear;
        }
        
        .navbar .dropdown-menu {
            border: 1px solid #343A40;
            /*background-color: #fff;*/
        }

        }
        /*Nav 끝*/
</style>
<script>
        $(document).ready(function() {
        // executes when HTML-Document is loaded and DOM is ready

        // breakpoint and up  
        $(window).resize(function(){
            if ($(window).width() >= 980){   

            // when you hover a toggle show its dropdown menu
            $(".navbar .dropdown-toggle").hover(function () {
                $(this).parent().toggleClass("show");
                $(this).parent().find(".dropdown-menu").toggleClass("show"); 
            });

            // hide the menu when the mouse leaves the dropdown
            $( ".navbar .dropdown-menu" ).mouseleave(function() {
                $(this).removeClass("show");  
            });
        
                // do something here
            }   
        });  

        // document ready  
        });
    </script>
</head>
<body>
   
 <!--nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="background-color: #000000;"-->
    <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
        <a class="navbar-brand" href="#">MovingCloset</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">링크1</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">링크2</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                드롭다운메뉴1
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      
                <div class="container">
                  <div class="row">
                    <div class="col-md-6">
                      <span class="text-uppercase text-white">드롭다운메뉴 1</span>
                      <ul class="nav flex-column">
                      <li class="nav-item">
                        <a class="nav-link active" href="#">링크(효과없)</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">링크(효과있)</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">링크(효과없)</a>
                      </li>
                    </ul>
                    </div>

                    <!-- /.col-md-4  -->
                    <div class="col-md-6">
                      <a href="">
                        <img src="https://dummyimage.com/200x100/ccc/000&text=image+link" alt="" class="img-fluid">
                      </a>
                      <p class="text-white">미니 이미지</p>
      
                    </div>
                    <!-- /.col-md-4  -->
                  </div>
                </div>
                <!--  /.container  -->

              </div>
            </li>


            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                드롭다운메뉴 2
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      
      
                <div class="container">
                    <div class="row">
                      <div class="col-md-6">
                        <span class="text-uppercase text-white">드롭다운메뉴 2</span>
                        <ul class="nav flex-column">
                        <li class="nav-item">
                          <a class="nav-link active" href="#">링크(효과없)</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">링크(효과있)</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">링크(효과없)</a>
                        </li>
                      </ul>
                      </div>
  
                      <!-- /.col-md-4  -->
                      <div class="col-md-6">
                        <a href="">
                          <img src="https://dummyimage.com/200x100/ccc/000&text=image+link" alt="" class="img-fluid">
                        </a>
                        <p class="text-white">미니 이미지</p>
        
                      </div>
                      <!-- /.col-md-4  -->
                    </div>
                  </div>
                  <!--  /.container  -->

              </div>
            </li>

          </ul>


          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      
      
      </nav>

<!--  
   여기는 나중에 NavBar 생성
<div class="Header">NavBar 생성할 부분</div>
-->
</body>
</html>