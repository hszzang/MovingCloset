<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="mybatis.NoticeDTO"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
		window.onload = function() {
	        $("Notice").show();
	        $("Events").hide();
	    }
		function openPage(pageName,elmnt,color) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].style.backgroundColor = "";
		  }
		  document.getElementById(pageName).style.display = "block";
		  elmnt.style.backgroundColor = color;
		  elmnt.style.color= white;
		}
		
		document.getElementById("defaultOpen").click();
	</script>
	
    <style>
        #wrapper{
        	width:70%; height:auto;
        	border: none;
        	margin: 100px 15% 200px 15%;
        	padding: 0;
        }
        #title{font-size:3em; color:black; font-weight:bold;
        	margin-left:10px;
        }
        #workD{
        	font-size:1em; color:gray; 
        	margin-left:10px;
        }
        #workTime{
        	font-size:1em; color:gray; 
        	margin-left:15px;
        }
        
        * { box-sizing: border-box; }
        .col { border-collapse: collapse; }
        .col-100 { width: 100%; }
        
        /*a:link{ color:black; text-decoration:none; }*/
        a:hover{ color:black; text-decoration:none; !important}
        a:focus{ color:black; text-decoration:none; }
        
        .tablink {
            background-color: white;
            padding: 8px 30px !important;
            width: 50%;
            font-size: 14px;
            color: gray;
            border: 1px solid gray; border-bottom:none;
            float: left;
        }
		.tablink:focus{outline:none;}
        .tablink:hover {
        	border:black; 
            background-color: black; color:white;
        }
        
		#Events{ display:none; }
		#FAQ{display:none;}
        table {
        	border-bottom:black solid 1px;
        	width:100%;
            text-align: center;
            font-size: 14px;
		}
        th {
        	color:black;
            background-color:none;
            border-top:black solid 2.5px;
            border-bottom:black solid 1px;
            height: 40px;
            font-size: 12px;
        }
        tr,
        td {
            padding: 4px 0px;
            border-bottom:darkgray solid 1px;
            height:40px;
            font-size: 10pt;
        }
        
        #gotoqna{
        	display:inline; float:left;
        	width:200px; height:40px; background-color:black;
        }
        #gotoqna:focus{outline:none;}
        
        #pages{
        	text-align:right;
			margin:0 5% 0 0;
        }
        #pageSel{
        	width:80px; height:40px;
        	border:lightgray solid 1px;
        	text-align:center; font-size:11pt;
        }
        #pgTotal{
        	color:gray; font-size: 10pt; 
        	margin:0 10px 0 10px;
        }
        .pageMove{
        	width:40px; height:40px;
        	border:none; padding:0;
        	color:white; font-size:10pt; font-weight:bold;}
        .pageMove:focus{outline:none;}
        #pmL{background-color:gray;}
        #pmR{background-color:gray;}
        
        select, input, textarea:focus{outline:none;}
    </style>
</head>
<body>
    <div id="wrapper">
			<br/><br/><br/>
    		
    		<div id="titleDiv">
    			<span id="title">CS Center</span>
    			<span id="workTime">MON - FRI / 9AM - 6PM</span>
    		</div>

			<div class="tabs">
				<button class="tablink" onclick="openPage('Notice', this, 'black')" id="defaultOpen">공지사항</button>
				
				<button class="tablink" onclick="openPage('FAQ', this, 'black')" >자주 묻는 질문</button>

			</div>
			<div style="clear:both;"></div>
		    <div id="noticeTable" style="width:100%; height:auto;">
		    
		    	<form method="post" action="notiList">
		    	<input type="hidden" name="noti_idx" value="${notice.noti_idx }"/> 
		    	<div id="Notice" class="tabcontent">
				    <table class="col-100 col">
				        <colgroup>
				            <col width="15%">
				            <col width="70%" >
				            <col width="15%">
				        </colgroup>
				        <thead>
				            <tr>
				                <th>번호</th>
				                <th style="text-align:left;">제목</th>
				                <th>등록일</th>
				            </tr>
				        </thead>
				        <c:forEach items="${notiList }" var="notice">
				        <input type="hidden" name="noti_idx" value="${notice.noti_idx }"/>
				        <tbody>
				            <tr>
				                <td>${notice.noti_idx }</td>
				                <td style="text-align:left;">
				                    <a href='<c:url value='/movingcloset/noticedetail.do?noti_idx=${notice.noti_idx }'/>' style="text-decoration:none;color:black;">
				                        ${notice.noti_title }</a></td>
				                <td><fmt:formatDate value="${notice.noti_postdate}" pattern="yyyy-MM-dd" /></td>
				            </tr>
				            
				        </tbody>
				        </c:forEach>
				    </table>
				</div>
				</form>
	
				
	        	
	        	<div id="FAQ" class="tabcontent">
	            <table class="col-100 col">
	                <colgroup>
	                    <col width="10%">
	                    <col width="15%">
	                    <col width="75%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>번호</th>
	                        <th>분류</th>
	                        <th>제목</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td>[주문]</td>
	                        <td> FAQ 어쩌고저쩌고 블라블라 시끌시끌</td>
	                    </tr>
	                    <tr>
							<td>2</td>
	                        <td>[배송]</td>
	                        <td> FAQ 어쩌고저쩌고 블라블라 시끌시끌</td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td>[결제]</td>
	                        <td> FAQ 어쩌고저쩌고 블라블라 시끌시끌</td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td>[교환/환불]</td>
	                        <td>FAQ 어쩌고저쩌고 블라블라 시끌시끌</td>
	                    </tr>
	                    <tr>
							<td>5</td>
	                        <td>[기타]</td>
	                        <td>FAQ 어쩌고저쩌고 블라블라 시끌시끌</td>
	                    </tr>
	                   
	                </tbody>
	            </table>
	        </div>
	        	
	        	
    	</div>
    		<br />
    		<button id="gotoqna">
    			<a href="/movingcloset/movingcloset/question.do" style="text-decoration:none;color:white;">1:1문의하러 가기</a>
    		</button>
			<div id="pages">
			    <select name="pageSel" id="pageSel" placeholder="1">
					<option value="pageNum">1</option>
					
			    </select>
			    <span id="pgTotal">of 1</span>
			    <button class="pageMove" id="pmL"> < </button>
			    <button class="pageMove" id="pmR"> > </button>
			</div>
	
    </div>
</body>
</html>