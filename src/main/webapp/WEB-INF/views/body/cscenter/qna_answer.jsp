<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="mybatis.QnaDTO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일대일문의 :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #whole{
        	width:100%; height:auto;
        	border: solid black 1px;
        	margin-top: 200px;
        	margin-bottom: 100px;
        	padding: 1% 1% 0 1%;
        }
        #title{
        	color:black; font-size:25pt; font-weight:bold;
        }

        table {
        	border-top: black solid 2px;
        	padding-left:2%;
            text-align: left;
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
            padding: 1% 0 1% 2%;
            border-bottom:lightgray solid 1px;
            height:40px;
            font-size: 12pt;
        }
        
        #qTitle{
        	width:98%; height:35px;
        	border:none; padding-top:5px;
        }
        #qText{
        	width:98%; height:350px;
        	border:none; padding-top:10px;
        }
        
        #fileBtn{
        	width:70px; height:70px; 
        	border:none; padding:0 1% 1% 1%; background-color:black;
        	color:white; font-size:30pt; font-weight:lighter;
        	margin-bottom:15px;
        }
        #fileBtn:focus{outline:none;}
        #info{ color:gray; font-size:11pt;}
        #replyBtn{
        	width:250px; height:40px;
        	margin:10px 36% 0 38%;
        	border:black solid 1px; background-color:white;
        	color:black; font-size:14pt; font-weight:lighter;	
        }
        #delBtn{
        	width:124px; height:40px;
        	border:black solid 1px; background-color:white;
        	color:black; font-size:14pt; font-weight:lighter;	
        }

        #modBtn{
        	width:250px; height:40px;
        	margin:10px 0 0 38%;
        	border:black solid 1px; background-color:white;
        	color:black; font-size:14pt; font-weight:lighter;	
        }
        #modBtn:focus{outline:none;}
        #backBtn{
        	width:250px; height:40px;
        	margin:10px 36% 0 38%;
        	border:black solid 1px; background-color:white;
        	color:black; font-size:14pt; font-weight:lighter;	
        }
        #backBtn:focus{outline:none;}
        
        #delBtn:focus{outline:none;}
        select, input, textarea:focus{outline:none;}
    </style>
   
</head>
<body>
<div class=container>
    <div id="whole">
	    	<span id="title">1:1문의</span>
	        <div>
		            <table class="col-100 col" id="tableFrm">
		                <colgroup>
		                    <col width="15%">
		                    <col width="85%">
		                </colgroup>
		                    <tr>
		                        <td>유형</td>
		                        <td>
									<div>
										<c:out value="${qnaDTO.q_cate }"/>
									</div>
		                        </td>
		                    </tr>
		                    <tr>
								<td>제목</td>
		                        <td>
		                        	<div id="qTitle">
		                        		${qnaDTO.q_title }
		                        	</div>
								</td>
		                    </tr>
		                    <tr>
		                        <td>내용</td>
		                        <td>
		                        	<div id="qText">
		                        		${qnaDTO.q_content }
		                        	</div>
		                        </td>
		                    </tr>
		  					
		            </table>
		        <div>
	        		<form method="post" action="<c:url value="/movingcloset/adminansweract.do" />">
		        		<input type="hidden" name="userid" value="admin" />
		        		<input type="hidden" name="q_flag" value="관리자" />
		        		<input type="hidden" name="q_status" value="답변" />
		        		
						<button id="modBtn" type="submit" style="text-decoration:none;color:white;">답변작성</button>
						<button id="backBtn" onClick="history.back(); return false;" style="text-decoration:none;color:white;">돌아가기</button>
						<!--  
						<button id="delBtn" type="reset" style="text-decoration:none;color:white;">삭제</button>
						-->
					<br/>
	        		</form>
	        	</div>
	        </div>
	

    </div>
</div>
</body>
</html>