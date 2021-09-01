<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        	width:1000px; height:800px;
        	border: solid black 1px;
        	margin-top: 200px;
        	margin-bottom: 10px;
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
        
        #qSel{
        	width:250px; height:35px;
        	border:lightgray solid 1px;
        }
        #qTitle{
        	width:98%; height:35px;
        	border:none;
        }
        #qText{
        	width:98%; height:350px;
        	border:lightgray solid 1px;
        }
        
        #fileBtn{
        	width:70px; height:70px; 
        	border:none; padding:0 1% 1% 1%; background-color:black;
        	color:white; font-size:30pt; font-weight:lighter;
        	margin-bottom:15px;
        }
        #fileBtn:focus{outline:none;}
        #info{ color:gray; font-size:11pt;}
        #sendBtn{
        	width:250px; height:40px;
        	margin:2% 36% 0 38%;
        	border:none; background-color:darkgray;
        	color:white; font-size:15pt; font-weight:lighter;	
        }
        #sendBtn:focus{outline:none;}
        select, input, textarea:focus{outline:none;}
    </style>
   
</head>
<body>
<div class="container">
    <div id="whole">
	    <div style="width : 950px; height: 750px;">
	    	<span id="title">1:1문의하기</span>
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
			                        <select name="question" id="qSel" placeholder="문의 유형을 선택해주세요.">
			                        	<option value="order">주문</option>
	                        			<option value="delivery">배송</option>
	                        			<option value="refund">교환/환불</option>
				                        <option value="paty">결제</option>
				                        <option value="etc">기타</option>
			                        </select>
		                        </td>
		                    </tr>
		                    <tr>
								<td>제목</td>
		                        <td>
		                        	<input type="text" id="qTitle" /></td>
		                    </tr>
		                    <tr>
		                        <td>내용</td>
		                        <td>
		                        	<textarea name="" id="qText" cols="30" rows="10" placeholder="의견을 입력해주세요.">
		                        	</textarea>
		                        </td>
		                    </tr>
		  					<tr>
		                        <td>첨부파일</td>
		                        <td>
									<button id="fileBtn">
										<span style="color:white; padding:0; margin:0;">
											+
										</span>
									</button>
									
									<div id="info">
										• 용량은 각 20MB 이하, jpg, png, gif 파일만 첨부 가능합니다. <br />
										• 이미지에 개인정보(주민번호 등)가 포함되지 않도록 주의해주세요.
									</div>
		                        </td>
		                    </tr>
		            </table>
					<button id="sendBtn">보내기</button>
	        	</form>
	        </div>

	
	    </div>
	

    </div>
</div>
</body>
</html>