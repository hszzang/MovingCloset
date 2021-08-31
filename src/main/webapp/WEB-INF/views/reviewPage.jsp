<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</head>
<script>

    $( document ).ready(function() {
    	
    	
        $( ".star_rating a" ).click(function() {
            $(this).parent().children("a").removeClass("on");
            $(this).addClass("on").prevAll("a").addClass("on");
            return false;
       });
     
	    $('.text100').keyup(function (e){
	        var content = $(this).val();
	        $('#counter').html(content.length+" / 100");    //글자수 실시간 카운팅
	    
	        if (content.length > 100){
	            alert("최대 100자까지 입력 가능합니다.");
	            $(this).val(content.substring(0, 100));
	            $('#counter').html("100 / 100");
	        }
	    });
    
	});
    
   function checkReviewFrm(frm){
	   //var frm = document.reviewFrm;
	   
	   if(frm.reviewText.value=""){
		   alert("한줄평을 작성해주세요.");
		   frm.reviewText.focus();
		   return false;
	   }   
	   if(frm.starRate.value=""){
		   alert("평점을 선택해주세요");
		   return false;
	   }
	   
   }
   
   function starRate(rate){
	   var star =  document.reviewFrm.starRate;
	   	star.value = "";
	   	
		if(rate==1){
			star.value=1;
		}
		if(rate==2){
			star.value=2;
		}
		if(rate==3){
			star.value=3;
		}
		if(rate==4){
			star.value=4;
		}
		if(rate==5){
			star.value=5;
		}
		
   }
    
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var before = document.getElementById("r_image");
			if(before != null){
				before.remove();				
			}
			
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			document.reviewFrm.ofileCheck.value="fileOK";
		};
		reader.readAsDataURL(event.target.files[0]);
	}
    
</script>
<style>

* ,*::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: inherit;
}

#img01{
    width: 300px;
    float: left; 
    padding-right: 15px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

div{
    text-align: center;
}

span{
    font-size: 30px;
    font-weight: bold;
}

.productInfo{
    margin-bottom: 20px; text-align: left; font-size: 20px;

}

.productInfo::after {
    content: "";
    clear: both;
    display: table;
}


.text{
    font-size: 22px;
    padding-left: 10px;
}

.text100{
    resize: none;
    width: 90%; height: 100px;
    padding-left: 15px;
    padding-top: 15px;
    font-size: 15px;
   

}

textarea::placeholder{
     color: rgb(167, 161, 161);
}

#reviewTOP{
	font-size: 25px; padding: 15px 0px; 
	margin-left: -20px; margin-right:-20px;
    background-color: #FF6C2F;
    color: white;
    font-weight: bold;
    margin-bottom: 20px;
}

#photoIcon{
    width: 10%; height: 80px;
    font-size:23px ; border: none;
    font-weight: bold; color: white;
    background-color: #FF6C2F; margin-left:5%;
    padding-top:30px;
    outline: 0;
}

#btnPhoto{
    width: 80%; height: 80px;
    font-size:23px ; border: none;
    font-weight: bold; color: white;
    background-color: #FF6C2F;
    padding-left:200px;
    padding-top:20px;
    outline: 0;
}

#btnPhoto:hover{
    background-color: #fcba9e;
}

#btnCancel, #btnSubmit{
    width: 43%;  height: 50px;
    background-color: white;
    outline: none;
    border: solid 1px rgb(182, 179, 179);
    font-size: 20px;
    font-weight: bold;
}

#btnCancel:hover, #btnSubmit:hover{

    background-color: lightgray;

}


/* 별점 매기는 부분 */
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:70px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#FF6C2F;}




/* 라디오 버튼 처리를 위한 css */
:root {
    --primary-light: #8abdff;
    --primary: #FF6C2F;
    --primary-dark: #5b0eeb;
    --white: #fff;
    --greyLight-1: #e4ebf5;
    --greyLight-2: #c8d0e7;
    --greyLight-3: #bec8e4;
    --greyDark: #fcba9e;
}

html {
    box-sizing: border-box;
    font-size: 62.5%;
    overflow-y: scroll;
    background: var(--greyLight-1);
}
@media screen and (min-width: 900px) {
    html {
        font-size: 75%;
   }
}




/* RADIO 버튼 */
.radio {
    grid-column: 0.5;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    justify-items: center;
}
.radio input {
    display: none;
}

.radio div span{
    font-size: 20px;
    font-weight: normal;
}

.radio__1 input:checked ~ label, .radio__2 input:checked ~ label, .radio__3 input:checked ~ label
,.radio__4 input:checked ~ label, .radio__5 input:checked ~ label, .radio__6 input:checked ~ label
,.radio__7 input:checked ~ label, .radio__8 input:checked ~ label, .radio__9 input:checked ~ label
,.radio__10 input:checked ~ label, .radio__11 input:checked ~ label, .radio__12 input:checked ~ label
{
    box-shadow: inset 0.2rem 0.2rem 0.5rem var(--greyLight-2), inset -0.2rem -0.2rem 0.5rem var(--white);
}
.radio__1 input:checked ~ label::after, .radio__2 input:checked ~ label::after, .radio__3 input:checked ~ label::after
,.radio__4 input:checked ~ label::after, .radio__5 input:checked ~ label::after, .radio__6 input:checked ~ label::after
,.radio__7 input:checked ~ label::after, .radio__8 input:checked ~ label::after, .radio__9 input:checked ~ label::after
,.radio__10 input:checked ~ label::after, .radio__11 input:checked ~ label::after, .radio__12 input:checked ~ label::after {
    background: var(--primary);
}
.radio__1 label, .radio__2 label , .radio__3 label
,.radio__4 label, .radio__5 label , .radio__6 label
,.radio__7 label, .radio__8 label , .radio__9 label
,.radio__10 label, .radio__11 label , .radio__12 label{
    box-shadow: 0.3rem 0.3rem 0.6rem var(--greyLight-2), -0.2rem -0.2rem 0.5rem var(--white);
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    width: 4.0rem;
    height: 4.0rem;
    border-radius: 50%;
}
.radio__1 label:hover::after, .radio__2 label:hover::after, .radio__3 label:hover::after 
,.radio__4 label:hover::after, .radio__5 label:hover::after, .radio__6 label:hover::after
,.radio__7 label:hover::after, .radio__8 label:hover::after, .radio__9 label:hover::after
,.radio__10 label:hover::after, .radio__11 label:hover::after, .radio__12 label:hover::after{
    background: var(--primary);
}
.radio__1 label::after, .radio__2 label::after, .radio__3 label::after
,.radio__4 label::after, .radio__5 label::after, .radio__6 label::after
,.radio__7 label::after, .radio__8 label::after, .radio__9 label::after
,.radio__10 label::after, .radio__11 label::after, .radio__12 label::after
{
    content: "";
    position: absolute;
    width: 2.0rem;
    height: 2.0rem;
    background: var(--greyDark);
    border-radius: 50%;
    transition: 0.3s ease;
}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.input-form-wrap {
	width: 70%;
	height: 90%;
}

.input-form {

	padding-bottom: 40px;
	justify-content: center;
	display: flex;
	align-items: center;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(255, 255, 255, 0.493);
	position: absolute;
	bottom: 1000px;
	right: 0px;
	background-color: white;
	color: black;
	padding-left: 20px;
	padding-right: 20px;
}

#mainbtn:focus {
	border-color: #FFFFFF;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 4px #ff6c2f;
}



#mainbtn {
	background-color: #ff6c2f;
	color: white;
	border: 0;
	width:300px;height:50px;
}



</style>

<body>
    
    <div class="container-fluid">

        <div id="reviewTOP">
            리뷰쓰기
        </div>
        <form action="../movingcloset/store/insertReview.do" onsubmit="checkReviewFrm(this.form);" name="reviewFrm" method="POST" enctype="multipart/form-data" >
        	<input type="hidden" name="p_code" value="${productAndDetailDTO.p_code }">
	        <div class="productInfo" style="margin-left: 30%;">
	            <img src="../resources/upload/${productAndDetailDTO.p_sfile }" alt="상품이미지" id="img01" > 
	            <br>
	            [MovingCloset]<br>
	            <span name="p_name">${productAndDetailDTO.p_name }</span><br>
	            사이즈 : <span name="pd_size">${productAndDetailDTO.pd_size}</span>
	        </div>
	            
	        <br>
	
	        <hr>
	        <br>
	        <div>
	            <span>상품은 만족하셨나요?</span><br>
				<input type="hidden" name="starRate">
	            <p class="star_rating" >
	                <a href="#" onclick="starRate(1);">★</a>
	                <a href="#" onclick="starRate(2);">★</a>
	                <a href="#" onclick="starRate(3);">★</a>
	                <a href="#" onclick="starRate(4);">★</a>
	                <a href="#" onclick="starRate(5);">★</a>
	            </p>
	
	
	            <span style="font-size: 20px; font-weight: normal;">선택하세요</span>
	        </div>
	        <br>
	        <hr>
	        <br>
	        <div>
	            <div>
	                <span>원단은 어떤가요?</span>
	            </div>
	            <br>
	            <div class="radio">
	                <div class="radio__1">
	                  <input id="radio-1" type="radio"  name="rt_fabric" value="1">
	                  <label for="radio-1"></label>
	                  <span>부드러워요</span>    
	                </div>
	                
	                <div class="radio__2">
	                  <input id="radio-2" type="radio" name="rt_fabric" value="2" checked>
	                  <label for="radio-2"></label>
	                  <span>보통이에요</span> 
	                </div>
	
	                <div class="radio__3">
	                  <input id="radio-3" type="radio" name="rt_fabric" value="3" >
	                  <label for="radio-3"></label>
	                  <span>뻣뻣해요</span> 
	                </div>
	
	              </div>
	        </div>
	        <br>
	        <hr>
	        <br>
	        <div>
	            <div><span>착용감은 어떤가요?</span></div>
	             <br>
	            <div class="radio">
	                <div class="radio__4">
	                  <input id="radio-4" type="radio"  name="rt_fit" value="4">
	                  <label for="radio-4"></label>
	                  <span>불편해요</span>    
	                </div>
	                
	                <div class="radio__5">
	                  <input id="radio-5" type="radio" name="rt_fit" value="5" checked>
	                  <label for="radio-5"></label>
	                  <span>편해요</span> 
	                </div>
	
	                <div class="radio__6">
	                  <input id="radio-6" type="radio" name="rt_fit" value="6" >
	                  <label for="radio-6"></label>
	                  <span>아주편해요</span> 
	                </div>
	            </div>  
	        </div>  
	        <br>
	        <hr>
	        <br>
	        <div>
	            <div><span>사이즈는 어떤가요?</span> </div><br>
	            
	            <div class="radio">
	                <div class="radio__7">
	                  <input id="radio-7" type="radio"  name="rt_size" value="7">
	                  <label for="radio-7"></label>
	                  <span>한 치수 작게요</span>    
	                </div>
	                
	                <div class="radio__8">
	                  <input id="radio-8" type="radio" name="rt_size" value="8" checked>
	                  <label for="radio-8"></label>
	                  <span>적당해요</span> 
	                </div>
	
	                <div class="radio__9">
	                  <input id="radio-9" type="radio" name="rt_size" value="9" >
	                  <label for="radio-9"></label>
	                  <span>한 치수 크게요</span> 
	                </div>
	            </div>  
	        </div>
	        <br>  
	        <hr>
	        <br>
	        <div>
	            <div><span>마감처리는 어떤가요?</span> </div><br>
	            
	            <div class="radio">
	                <div class="radio__10">
	                  <input id="radio-10" type="radio"  name="rt_finish" value="10">
	                  <label for="radio-10"></label>
	                  <span>엉성해요</span>    
	                </div>
	                
	                <div class="radio__11">
	                  <input id="radio-11" type="radio" name="rt_finish" value="11" checked>
	                  <label for="radio-11"></label>
	                  <span>깔끔해요</span> 
	                </div>
	
	                <div class="radio__12">
	                  <input id="radio-12" type="radio" name="rt_finish" value="12" >
	                  <label for="radio-12"></label>
	                  <span>아주깔끔해요</span> 
	                </div>
	            </div>    
	        </div>    
	        <br>
	        <hr>
	        <br>
	        <div>
	            <span style="font-size: 25px;">상품에 대한 한줄평을 남겨주세요.</span>
	        </div>
	        <br>
	        <div>
	            <textarea name="reviewText" class="text100" cols="30" rows="10" placeholder="최대 100자 까지 등록 가능합니다." ></textarea>
	        </div>
	        
	        <div style="text-align: right; padding-right: 5%;">
	            <span id="counter" style="font-size: 20px;font-weight: normal; color: gray;">0/100</span>
	        </div>
	        <br>
	        
	        <div class="input-container">
		        <i class="fa fa-camera" id="photoIcon"></i>
		        <input id="btnPhoto" type="file" class="form-control" name="ofile" accept="image/*" 
					onchange="setThumbnail(event);" />	
				<input type="hidden" name="ofileCheck" />        
	        </div>
	        <br />
	        
	        
			<div id="image_container" style="display: none;">
				<img src="../resources/upload/${reviewDTO.r_sfile }" alt="상품이미지" id="r_image" />
			</div>
	        
	        <br>
	        <div style="text-align: left;margin-left: 5%;">
	            <span style="font-size: 15px;color: red;font-weight: normal;">상품과 무관한 사진/동영상을 첨부한 리뷰는 통보없이 삭제 및 적립 혜택이 회수됩니다.</span>
	        </div>
	    <br>
	    <div style="padding-bottom: 5%;">
	        <button id="btnSubmit" type="submit" >등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <button id="btnCancel" onclick="javascript:window.close();">취소</button>
	    </div>			
		</form>


	</div>
</body>
</html>