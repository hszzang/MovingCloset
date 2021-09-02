<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="mybatis.NoticeDTO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CS Center :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <style>
        #divNotice{
        	width:100%; height:auto;
        	padding: 0;
        	margin-top: 200px;
        	margin-bottom: 10px;
        	border: solid black 1px;
        }
		.title{
			font-size:20pt; font-weight:bolder;
			padding-left: 2%;
		}
		.date{
			text-align:right;
			padding: 0 2% 0 0;
		}
		.notice{
			width:100%; height:auto;
			padding:2%;
			margin-bottom:100px;
		}
		#listBtn{
        	width:150px; height:40px;
        	margin:0;
        	border:none; background-color:black;
        	color:white; font-size:12pt; font-weight:lighter;	
        }
        #askBtn:focus{outline:none;}
        
        
    </style>
   
</head>
<body>
<div class="container">

    <div id="divNotice">
		<div class="title"><c:out value="${noticeDTO.noti_title }"/></div>
		<hr />
	    <div class="date"><fmt:formatDate value="${noticeDTO.noti_postdate}" pattern="yyyy-MM-dd" /></div>
		<div class="notice">
			${noticeDTO.noti_contents }
		</div>
		
		<span style="float:right;">
			<br>
		    <button id="listBtn"><a href="javascript:window.history.back();" style="text-decoration:none;color:white;">뒤로가기</a></button>
		</span>
		<br/>
    </div>
    
    <br/><br/>
</div>
</body>
</html>