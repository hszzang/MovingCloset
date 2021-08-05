<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <style>
        #divNotice{
        	width:1000px; height:800px;
        	padding: 30px 50px 0 50px;
        	margin: 100px 20% 200px 20%;
        	border: solid black 1px;
        }
		#title{
			font-size:20pt; font-weight:bolder;
			padding-left: 2%;
		}
		#date{
			text-align:right;
			padding: 0 2% 0 0;
		}
		#notice{
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
    <div id="divNotice">
		<div id="title">제목입니다.</div>
		<hr />
	    <div id="date">2021.08.10</div>
		<div id="notice">
			공지 내용입니다... <br />
			혹시.... 넘 휑한가요....? ㅠ  <br />
			FAQ양식으로도 쌉가능..!ㅁ7ㅁ8 <br />
			제목 색깔 어떻게 바뀌는지 아시는 분 ㅠ
		</div>
		<hr />
		<span style="float:right;">
		    <button id="listBtn"><a href="/movingcloset/project/notice.do" style="text-decoration:none;color:white;">뒤로가기</a></button>
		</span>
    </div>
</body>
</html>