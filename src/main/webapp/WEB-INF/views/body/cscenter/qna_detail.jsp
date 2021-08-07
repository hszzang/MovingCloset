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

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #whole{
        	width:1000px; height:800px;
        	border: solid black 1px;
        	margin: 100px 20% 200px 20%;
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
        #modBtn{
        	width:250px; height:40px;
        	margin:10px 36% 0 38%;
        	border:none; background-color:black;
        	color:white; font-size:15pt; font-weight:lighter;	
        }
        #modBtn:focus{outline:none;}
        select, input, textarea:focus{outline:none;}
    </style>
   
</head>
<body>
    <div id="whole">
	    <div style="width : 950px; height: 750px;">
	    	<span id="title">1:1문의</span>
	        <div>
	        	<form action="">
		            <table class="col-100 col" id="tableFrm">
		                <colgroup>
		                    <col width="15%">
		                    <col width="85%">
		                </colgroup>
		                    <tr>
		                        <td>유형</td>
		                        <td>
									<div>
										기타
									</div>
		                        </td>
		                    </tr>
		                    <tr>
								<td>제목</td>
		                        <td>
		                        	<div id="qTitle">
		                        		궁금한게 있어용
		                        	</div>
								</td>
		                    </tr>
		                    <tr>
		                        <td>내용</td>
		                        <td>
		                        	<div id="qText">
		                        		질문 있어요. <br />
		                        		이건 어쩌고 저쩌구 하나요? <br />
		                        		또 저건 왱알왱알 블라블라 할 수 있을까요? <br />
		                        		노고가 많으십니다. <br />
		                        		답변 기다릴게용 <br />
		                        	</div>
		                        </td>
		                    </tr>
		  					<tr>
		                        <td>첨부파일</td>
		                        <td>
									<div></div>
		                        </td>
		                    </tr>
		            </table>
					<button id="modBtn">수정하기</button>
	        	</form>
	        </div>

	
	    </div>
	

    </div>
</body>
</html>