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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<style>
		nav{ width:100%; height:40px; margin:0px;}
	    #homeBtn{margin:0 3% 0 5%;}
	    li{ width:100px; margin-right:1%;}
	    i{ font-size:28px; color:white;}
	    #rightNav{ margin:20px 0 0 50%; }
	      
	    #megaMenu{
	        width:100%; height:12%; display:none;																																																																																					
	        background-color: #212529; color:whitesmoke;
	        padding:55px 20% 0 20%;
	    }
	    .megaLinks{
	        width:100px; height:200px; display:inline-block;
	        color:whitesmoke; font-size:10pt; text-align:left;    
	    }
	    .megaA{
	        color:whitesmoke; font-size:11pt; display:block;
	        margin-bottom:10px;
	    }
	    .megaA:hover{ color:whitesmoke; text-decoration:none; }
	    a{  
	        text-decoration:none;
	    }
	</style>
	
	<script>
		$(document).ready(function(){
		    $("#navi").click(function(){
		      $("#megaMenu").slideToggle("slow");
		    });
		  });

    </script>
    
</head>
<body>

<!-- body style="height:1500px" -->	

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	  <a class="navbar-brand" id="homeBtn"  href="#">Moving Closet</a>
	  <ul class="navbar-nav" id="navi">
	    <li class="nav-item">
	      <a class="nav-link" href="#">HOME</a>
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
	    <li class="nav-item">
	        <a class="nav-link" href="#">Events</a>
	    </li>
	  </ul>
	  
	  <span id="rightNav">
	      <label for=""><a href=""><i class="material-icons">search</i></a></label>
	      <label for=""><a href=""><i class="material-icons">shopping_basket</i></a></label>
	      <label for=""><a href=""><i class="material-icons">person</i></a></label>
	    </span>
	</nav>
	
	<div id="megaMenu">
	    <span id="wrapper">
	        <span class="megaLinks">
	            <a href="" class="megaA">링크1</a>
	            <a href="" class="megaA">링크2</a>
	            <a href="" class="megaA">링크3</a>
	        </span>
	        <span class="megaLinks">
	            <a href="" class="megaA">링크1</a>
	            <a href="" class="megaA">링크2</a>
	            <a href="" class="megaA">링크3</a>
	        </span>
	        <span class="megaLinks">
	            <a href="" class="megaA">링크1</a>
	            <a href="" class="megaA">링크2</a>
	            <a href="" class="megaA">링크3</a>
	        </span>
	        <span class="megaLinks">
	            <a href="" class="megaA">링크1</a>
	            <a href="" class="megaA">링크2</a>
	            <a href="" class="megaA">링크3</a>
	        </span>
	    </span>
	</div> 
 
 
 

</body>
</html>