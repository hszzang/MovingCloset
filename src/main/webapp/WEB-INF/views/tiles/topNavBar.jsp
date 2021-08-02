<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>

* {margin: 0; padding: 0; }
li {list-style: none; }
          
.topMenu {position: relative; width: 100%; margin-bottom: 20px; text-align: center; height: 40px;}
.topMenu:after {content: ""; display: block; clear: both; }
.menu01>li {float: left; width: 20%; line-height: 40px; }
.menu01 span {font-size: 20px; font-weight: bold; }
            
.dept01 {z-index: 999; position: absolute; display: none; 
padding: 20px 0; border-bottom: 1px solid #ccc; padding-left: 9%;
background-color: black; opacity:30%;
}
            
#nop {float: none;}
            
.none:after {content: ""; display: block; clear: both; }

.Header{
background-color: black; color:white; opacity:80%;
}
</style>
<script>

$(document).ready(function() {

    /*
    hover() : 선택한 요소에 마우스를 올렸을 때, 내렸을 때의 효과를 
        부여하기 위해 사용한다.
    */

    $(".topMenu").hover(
        //인자 1 : 마우스 오버 시 실행할 무기명 함수
        function() {
            $('.dept01').slideDown(300)
            //css()사용 시 JSON을 통해 속성을 부여한다.
        }, 
        //인자 2 : 마우스를 아웃했을 때 실행할 무기명 함수
        function() {
            $('.dept01').slideUp(300)
       	}
    );
    
    
});
       


</script>
</head>
<body>

<div class="Header">
    <div class="topMenu" style="display: inline;">
        <ul class="menu01" >
            <li><span class="menu">Menu01</span>
                <ul class="dept01">
                    <li id="nop">sub01</li>
                    <li id="nop">sub02</li>
                    <li id="nop">sub03</li>
                    <li id="nop">sub04</li>
                    <li id="nop">sub05</li>
                </ul>
            </li>
            <li><span class="menu">Menu02</span>
                <ul class="dept01">
                    <li id="nop">sub01</li>
                    <li id="nop">sub02</li>
                    <li id="nop">sub03</li>
                    <li id="nop">sub04</li>
                    <li id="nop">sub05</li>
                </ul>
            </li>
            <li><span class="menu">Menu03</span>
                <ul class="dept01">
                    <li id="nop">sub01</li>
                    <li id="nop">sub02</li>
                    <li id="nop">sub03</li>
                    <li id="nop">sub04</li>
                    <li id="nop">sub05</li>
                </ul>
            </li>
            <li><span class="menu">Menu04</span>
                <ul class="dept01">
                    <li id="nop">sub01</li>
                    <li id="nop">sub02</li>
                    <li id="nop">sub03</li>
                    <li id="nop">sub04</li>
                    <li id="nop">sub05</li>
                </ul>
            </li>
            <li><span class="menu">Menu05</span>
                <ul class="dept01">
                    <li id="nop">sub01</li>
                    <li id="nop">sub02</li>
                    <li id="nop">sub03</li>
                    <li id="nop">sub04</li>
                    <li id="nop">sub05</li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="none">
    </div>
</div>
</body>
</html>