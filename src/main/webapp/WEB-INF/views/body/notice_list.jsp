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
    <script>
	    $(document).ready(function(){
	    	
	    	$('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
	    		var tab_id = $(this).attr('data-tab');
	
	    		$('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
	    		$('.tab-content').removeClass('current');		
	
	    		$(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
	    		$("#" + tab_id).addClass('current');
	    	})
	
	    });
    
    	function change(pageName){
    		var i, showContent;
    		showContent = document.getElementById(pageName);
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
		}
		
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
    <style>
        #notice{
        	width:1000px; height:800px;
        	border: solid black 1px;
        	margin: 100px 20% 200px 20%;
        	padding: 30px 0 0 20px;
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
    </style>
   
</head>
<body>
    <div id="notice">
		<div class="tabs">
			<button class="tabBtn" id="#btn1" >공지사항</button>
			<button class="tabBtn" id="#btn2" >이벤트 당첨 안내</button>
		</div>
		<div style="clear:both;"></div>
	    <div id="noticeTable" style="width : 950px; height: 750px;">
	        <div id="table1">
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
	                        <td><a href="/movingcloset/project/noticedetail.do" style="text-decoration:none;">
	                        	공지사항 어쩌고저쩌고 블라블라 시끌시끌</a></td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>2</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>5</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>6</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>7</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>8</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>9</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>10</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>11</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>12</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>13</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>14</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>15</td>
	                        <td>공지사항 어쩌고저쩌고 블라블라 시끌시끌</td>
	                        <td>2021.08.01</td>
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
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>2</td>
							<td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>5</td>
							<td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>6</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>7</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>8</td>
							<td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>9</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>10</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>11</td>
							<td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>12</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>13</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
							<td>14</td>
							<td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                    <tr>
	                        <td>15</td>
	                        <td>이벤트 당첨 안내 ㄱㄱ</td>
	                        <td>2021.08.01</td>
	                    </tr>
	                </tbody>
	            </table>
	
	        </div>
	

    </div>
</body>
</html>