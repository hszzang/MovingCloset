<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용정보 :: MovingCloset</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script type="text/javascript">
		window.onload = function() {
	        $("Regular").show();
	        $("Always").hide();
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
        	margin-top: 90px; margin-bottom: 100px;
        	margin-left: 14%;
/*         	margin: 200px 15% 200px 150px; */
        	padding: 0;
        }
        #title{font-size:3em; color:black; font-weight:bold;
        	margin-left:10px;
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
            width: 33.3%;
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
        
		#Always{ display:none; }
		
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
            height: 60px;
            font-size: 12px;
        }
        tr,
        td {
            padding: 4px 0px;
            border-bottom:darkgray solid 1px;
            height:60px;
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
        #pmR{background-color:black;}
        
        select, input, textarea:focus{outline:none;}
    </style>
    
<!-- Template Main CSS File -->
<link href="../resources/assets/css/style.css" rel="stylesheet">

</head>
<body>
    <div id="wrapper">
		<br>
    	<div class="section-title">
          <h2>Recruit</h2>
        </div>

			<div class="tabs">
				<button class="tablink" onclick="openPage('Regular', this, 'black')" id="defaultOpen">상시채용</button>
				<button class="tablink" onclick="openPage('Always', this, 'black')" >정기채용</button>
				

			</div>
			<div style="clear:both;"></div>
		    <div id="regularTable" style="width:100%; height:auto;">
		    
		    	<div id="Regular" class="tabcontent">
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
				                    <a href="/movingcloset/movingcloset/recruitdetail.do" style="text-decoration:none;color:black;">
				                        신입사원 모집</a></td>
				                <td>2021.08.01</td>
				            </tr>
				            <tr>
				                <td>2</td>
				                <td style="text-align:left;">경력사원 모집</td>
				                <td>2021.08.01</td>
				            </tr>
				        </tbody>
				    </table>
				</div>
	
				<div id="Always" class="tabcontent">
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
				                <td style="text-align:left;">디자이너 모집</td>
				                <td>2021.08.01</td>
				            </tr>
				            <tr>
				                <td>2</td>
				                <td style="text-align:left;">마케터 모집</td>
				                <td>2021.08.01</td>
				            </tr>
				            <tr>
				                <td>3</td>
				                <td style="text-align:left;">UI개발자 모집</td>
				                <td>2021.08.01</td>
				            </tr>
				        </tbody>
				    </table>
				</div>
	        	
	        	
	        	
	        	
    	</div>
    		<br />

<!-- 			<div id="pages"> -->
<!-- 			    <select name="pageSel" id="pageSel" placeholder="1"> -->
<!-- 					<option value="pageNum">1</option> -->
<!-- 					<option value="pageNum">2</option> -->
<!-- 					<option value="pageNum">3</option> -->
<!-- 					<option value="pageNum">4</option> -->
<!-- 					<option value="pageNum">5</option> -->
<!-- 			    </select> -->
<!-- 			    <span id="pgTotal">of 5</span> -->
<!-- 			    <button class="pageMove" id="pmL"> < </button> -->
<!-- 			    <button class="pageMove" id="pmR"> > </button> -->
<!-- 			</div> -->
	
    </div>
</body>
</html>