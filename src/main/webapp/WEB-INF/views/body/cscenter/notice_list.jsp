<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
    /*
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
    */
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
        #noticeWrap{
        	width:1000px; height:900px;
        	border: solid black 1px;
        	margin: 100px 20% 200px 20%;
        	padding: 30px 20px 0 20px;
        }
        * {
            box-sizing: border-box;
        }
        
        a:link{ color:black; text-decoration:none; }
        a:hover{ color:black; text-decoration:none; !important}
        a:focus{ color:black; text-decoration:none; }
        
        #noticetable{
        	margin: 0;
        }
        body{
            margin-top: 0; margin-left: 0;
        }
        .col {
            border-collapse: collapse;
        }

        .tablink {
            background-color: white;
            padding: 8px 30px !important;
            width: 200px;
            font-size: 14px;
            color: gray;
            border: 1px solid gray;
            float: left;
        }
		.tablink:focus{outline:none;}
        .tablink:hover {
        	border:black; 
            background-color: black; color:white;
        }
        .col-100 {
            width: 100%;
        }
        
		#Events{ display:none; }
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
            font-size: 10pt;
        }
        #pages{
        	text-align:right;
			margin:1% 2% 0 0;
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
        #pmR{background-color:black;}
        
        select, input, textarea:focus{outline:none;}
    </style>
</head>
<body>
    <div id="noticeWrap">
		<div class="tabs">
			<button class="tablink" onclick="openPage('Notice', this, 'black')" id="defaultOpen">공지사항</button>
			<button class="tablink" onclick="openPage('Events', this, 'black')" >이벤트 당첨 안내</button>
		<!-- 
			<button class="tabBtn" id="#btn1" >공지사항</button>
			<button class="tabBtn" id="#btn2" >이벤트 당첨 안내</button>
		-->	
		</div>
		<div style="clear:both;"></div>
	    <div id="noticeTable" style="width:950px; height:auto;">
	    
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
			        <tbody>
			            <tr>
			                <td>1</td>
			                <td style="text-align:left;">
			                    <a href="/movingcloset/project/noticedetail.do" style="text-decoration:none;color:black;">
			                        공지사항 어쩌고저쩌고 블라블라 시끌시끌</a></td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>2</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>3</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>4</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>5</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>6</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>7</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>8</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>9</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>10</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>11</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>12</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>13</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>14</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>15</td>
			                <td style="text-align:left;">공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
			                <td>2021.08.01</td>
			            </tr>
			        </tbody>
			    </table>
			</div>

			<div id="Events" class="tabcontent">
			    <table class="col-100 col">
			        <colgroup>
			            <col width="15%">
			            <col width="70%">
			            <col width="15%">
			        </colgroup>
			        <thead>
			            <tr>
			                <th>번호</th>
			                <th style="text-align:left;">제목</th>
			                <th>등록일</th>
			            </tr>
			        </thead>
			        <tbody>
			            <tr>
			                <td>1</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>2</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>3</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>4</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>5</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>6</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>7</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>8</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>9</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>10</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>11</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>12</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>13</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>14</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			            <tr>
			                <td>15</td>
			                <td style="text-align:left;">이벤트 당첨 안내 ㄱㄱ</td>
			                <td>2021.08.01</td>
			            </tr>
			        </tbody>
			    </table>
			</div>
	        </div>
			<div id="pages">
			    <select name="pageSel" id="pageSel" placeholder="1">
					<option value="pageNum">1</option>
					<option value="pageNum">2</option>
					<option value="pageNum">3</option>
					<option value="pageNum">4</option>
					<option value="pageNum">5</option>
			    </select>
			    <span id="pgTotal">of 5</span>
			    <button class="pageMove" id="pmL"> < </button>
			    <button class="pageMove" id="pmR"> > </button>
			</div>
	
    </div>
</body>
</html>