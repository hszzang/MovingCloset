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
    
    <script type="text/javascript">
        window.onload = function() {
            $("#table1").show();
            $("#table2").hide();
        }
        $(document).ready(function() {
            $("#btn1").click(function() {
                $("#table1").show();
                $("#table2").hide();
            })
            $("#btn2").click(function() {
                $("#table1").hide();
                $("#table2").show();
            })
        })
    </script>
    
    <style>
        #help{
        	width:1000px; height:800px;
        	border: solid black 1px;
        	margin: 100px 20% 200px 20%;
        	padding: 30px 0 0 20px;
        }
        * {
            box-sizing: border-box;
        }
        #helptable{
        	margin: 0;
        }
        body{
            margin-top: 0;
            margin-left: 0;
        }
        .col {
            border-collapse: collapse;
        }

        .tabBtn {
            background-color: white;
            padding: 8px 30px !important;
            width: 200px;
            font-size: 14px;
            color: gray;
            border: 1px solid gray;
            float: left;
        }
		.tabBtn:focus{outline:none;}
        .tabBtn:hover {
        	border:black;
        	color:white;
            background-color: black;
        }
        .col-100 {
            width: 100%;
        }

        table {
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
            font-size: 12px;
        }
        #pages{ margin-top:15px; }
        #askBtn{
        	width:150px; height:40px;
        	margin:0;
        	border:none; background-color:black;
        	color:white; font-size:12pt; font-weight:lighter;	
        }
        #askBtn:focus{outline:none;}
        
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
        	color:white; font-size:10pt; font-weight:bold;
        }
        .pageMove:focus{outline:none;}
        #pmL{background-color:gray;}
        #pmR{background-color:black;}
        
        select, input, textarea:focus{outline:none;}
    </style>
   
</head>
<body>
    <div id="help">
		<div class="tabs">
			<button class="tabBtn" id="#btn1" >자주 묻는 질문</button>
			<button class="tabBtn" id="#btn2" >1:1 문의</button>
		</div>
		<div style="clear:both;"></div>
	    <div id="helpTable" style="width : 950px; height: 750px;">
	        <div id="table1">
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
	        
	        <div id="table2">
	            <table class="col-100 col">
	                <colgroup>
	                    <col width="10%">
	                    <col width="80%">
	                    <col width="10%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>번호</th>
	                        <th>제목</th>
	                        <th>등록일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>2</td>
							<td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>5</td>
							<td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>6</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>7</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>8</td>
							<td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>9</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>10</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>11</td>
							<td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>12</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>13</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>14</td>
							<td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>15</td>
	                        <td>질문과 답변 </td>
	                        <td>2021.08.01</td>
	                    </tr>
	                </tbody>
	            </table>
	
	        </div>
			<div id="pages">
		        <span>
		        	<button id="askBtn"><a href="/movingcloset/project/question.do" style="text-decoration:none;color:white;">문의하기</a></button>
		        </span>
		        <span style="float:right;">
				    <select name="pageSel" id="pageSel" placeholder="1">
						<option value="pageNum">1</option>
				    </select>
				    <span id="pgTotal">of 1</span>
				    <button class="pageMove" id="pmL"> < </button>
				    <button class="pageMove" id="pmR"> > </button>
				</span>
			</div>

    </div>
</body>
</html>