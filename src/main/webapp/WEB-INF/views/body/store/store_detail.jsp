<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
	$(function(){

		zzimList();
			
	});
	
	function zzimList() {
	
		var zzimDTO = {};
		zzimDTO.userid = "<c:out value='${siteUserInfo}' />";
		zzimDTO.p_code = "<c:out value='${storeDetail.p_code}' />";
	
		
		$.ajax({
		
	        url:'../zzimList',
	        type : 'POST',
	        data : zzimDTO,
	        dataType:'json',
	        success :  function(result){
	        	
				let res = "";
				
				if(result[0] != null) {
					res += "<button type='button' id='wish' style='width: 45%;height:60px;' onclick='zzimRemove("+result[0].z_idx+");'>위시리스트&nbsp;<img src='../resources/images/heart4.png' width='25'/></button>"    	  
					$('.wishButton').empty();
		        	$('.wishButton').append(res);
				}
				else if(result[0] == null){
					res += "<button type='button' id='wish' style='width:45%; height:60px;' onclick='zzimCreate();'>위시리스트&nbsp;<img src='../resources/images/heart3.png' width='25'/></button>"    	  
					$('.wishButton').empty();
			        $('.wishButton').append(res);
				}
	        },
	        error : function(request, status, error) {
	        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	        }
	    });
		
	}
	
	function zzimRemove(z_idx) {
		
		var zzimDTO = {};
		zzimDTO.z_idx = z_idx;
		
		$.ajax({
			url : '../zzimremove',
			type : 'POST',
			data : zzimDTO,
			success : function(result) {
				
				zzimList(0, 0);
			},
			error : function(request, status, error) {
		    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		    }
		});
	}
	
 	function zzimCreate() {
		
 		if(${empty siteUserInfo}) {
            alert("로그인 후 이용해주세요.");
            location.href="../movingcloset/login.do";
        }
 		else {
			var zzimDTO = {};
			zzimDTO.userid = "<c:out value='${siteUserInfo}' />";
			zzimDTO.p_code = "<c:out value='${productDetail.p_code}' />";
			
			$.ajax({
				url : '../zzimcreate',
				type : 'POST',
				data : zzimDTO,
				dataType:'json',
				success : function(result) {
					zzimList();
				},
				error : function(request, status, error) {
			    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    }
			});
 		}
	} 
	
	function addCart() {
		
		if(${empty siteUserInfo}) {
            alert("로그인 후 이용해주세요.");
            location.href="../movingcloset/login.do";
        }
 		else {
			var cartDTO = {};
			
			cartDTO.c_qty = document.getElementById("quantity").value;
			cartDTO.userid = "<c:out value='${siteUserInfo}' />";
			cartDTO.p_code = "<c:out value='${storeDetail.p_code}' />";
			cartDTO.p_sfile = "<c:out value='${storeDetail.p_sfile}' />";
			cartDTO.p_flag = "<c:out value='${storeDetail.p_flag}'/>";
			cartDTO.pd_size = document.getElementById("sizeNum").value;
			cartDTO.p_price = "<c:out value='${storeDetail.p_price}'/>";
			cartDTO.p_brand = "<c:out value='${storeDetail.p_brand}'/>";
			cartDTO.pd_color = "<c:out value='${productDetail.pd_color}'/>";
			
			$.ajax({
				url : '../addcart',
				type : 'POST',
				data : cartDTO,
				success : function(result) {
					alert("장바구니에 담았습니다.")
				},
				error : function(request, status, error) {
			    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    }
			});
 		}
	}
	
   function plusminus(id){
      //console.log("넘어온 값 "+id);
      var num = document.getElementById("quantity");
	
      if(id=="minus"){ 
         if(num.value <= 1){
            num.value = 1;
         }else{
            num.value = parseInt(num.value) - 1;
         }
      }
      if(id=="plus"){ 
         num.value = parseInt(num.value) + 1;
      }      
   }

   $(function(){
      $('#btnReview').click(function(){
         
         if(${empty siteUserInfo}) {
            alert("로그인 후 이용해주세요.");
            location.href="../movingcloset/login.do";
         }else{
            var p_idx = "<c:out value='${storeDetail.p_idx}'/>";
            var child;
            child = window.open("./reviewPage.do?p_idx="+p_idx, "reviewpopup", "height:400px, width:200px");            
         }
      
      });

      
   });
   

   
   function delReview(r_idx, p_idx){
      if(confirm("정말 리뷰를 삭제하시겠습니까?")){
         location.href="/movingcloset/store/deleteReview.do?r_idx=" + r_idx +"&p_idx=" + p_idx;
      }
   }
   
   function setThumbnail(event,rid){
      var reader = new FileReader();
      
      reader.onload = function(event){
         var before = document.getElementById("r_image"+rid);
         if(before != null){
            before.remove();         
         }
         
         var img = document.createElement("img");
         img.setAttribute("src", event.target.result);
         img.style.display ='none';
         img.setAttribute("id","r_image"+rid);
         document.querySelector("div#image_container").appendChild(img);
         document.reviewUpdate.ofileCheck.value="fileOK";
         
      };
      reader.readAsDataURL(event.target.files[0]);
   }
   
    function rUpdate(rid){
   
       console.log(rid);
       
      var htmls = "";
      htmls += '<div class="r_content" id="rid'+rid+'">';
      htmls += '<textarea maxlength="100"; style="resize: none;width:350px;height:50px;" name="r_content" class="text100" cols="30" rows="10" placeholder="최대 100자 까지 등록 가능합니다." ></textarea>';
      htmls += '</div>';


      var photoHtml = "";
      photoHtml += '<div id="photo'+rid+'">';
      photoHtml += '<i class="fa fa-camera" id="photoIcon"></i>';
      photoHtml += '<input id="btnPhoto" type="file" class="form-control" name="ofile" accept="image/*" ';
      photoHtml += 'onchange="setThumbnail(event,'+rid+');" /> ';
      photoHtml += '</div>';  
      photoHtml += '<br />';  
      photoHtml += '<div id="image_container">';
      photoHtml += '</div>';
   
      var buttonHtml = "";  
      buttonHtml += '<div id="btnDiv'+rid+'">';
      buttonHtml += '<button class="btnstyle" type="button" onclick="textCheck();" >확인</button>';
      buttonHtml += '<button class="btnstyle" type="button" onclick="javascript:history.back();">취소</button>';
      buttonHtml += '</div>';
      
      document.getElementById("rid"+rid).innerHTML = htmls;
      document.getElementById("photo"+rid).innerHTML = photoHtml;
      document.getElementById("btnDiv"+rid).innerHTML = buttonHtml;
      
      document.reviewUpdate.action = '../store/updateReview.do?r_idx='+rid+'';         
      
        
   }


    function textCheck(){   
      if(document.reviewUpdate.r_content.value == ""){
         alert("한줄평을 작성해주세요.");
         return false;
      }else{
         document.reviewUpdate.submit();
      }   
    }  
    
    function buyCheck(){         
       var frm = document.detailFrm;
       
      if(${empty siteUserInfo}) {
         alert("로그인 후 이용해주세요.");
         location.href="../movingcloset/login.do";
         
      }else{
         if(frm.size.value==""){
            alert("상품의 사이즈를 선택해주세요.");
            return false;
         }else{
            frm.submit();            
         }

      }
      
    }
    



</script>

<style>
   .img{width:100%; height:300px; margin:0 0 10px 10px; }
   span.a { display:inline; float:left; }
   #btnBuy, #basket, #wish{
      padding: 5%;
      border-radius: 5px;
      background-color: black;
      color: white;
      font-size: 1em;
      font-weight: bold;
      border: black solid 1px;
      outline: 0;
   }
   #basket, #wish{ background-color: white; color: black; }
   #btnBuy:hover{background-color:darkgray; border:#343A40;}
   #basket, #with:hover{border:gray;}
   
   #brandName ,#shoes ,#prodCount ,#price {
      font-size: 1em;
   }
   #brandName{ display: inline; }
   #prodName {font-size:1.5em;}
   #prodCount{text-align:right; vertical-align:center;}
   
   #sizeNum{ width:100%; height:40px; font-size:1em;}
    #sizeNum:focus{outline:none;}
    
   #btnReview{
      width:200px; height:40px;
      border-radius: 3px;
      background-color: black; color: white;
      outline: 0;   
   }
</style>
<style>
   body {font-family: Arial, Helvetica, sans-serif;}
   
   .myImg {
     border-radius: 5px;
     cursor: pointer;
     transition: 0.3s;
   }
   .myImg:hover {opacity: 0.7;}
   
   /* The Modal (background) */
   .modal {
     display: none; /* Hidden by default */
     position: fixed; /* Stay in place */
     z-index: 1; /* Sit on top */
     padding-top: 100px; /* Location of the box */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
   }
   
   /* Modal Content (image) */
   .modal-content {
     margin: auto;
     display: block;
     width: 80%;
     max-width: 700px;
   }
   
   /* Caption of Modal Image */
   #caption {
     margin: auto;
     display: block;
     width: 80%;
     max-width: 700px;
     text-align: center;
     color: #ccc;
     padding: 10px 0;
     height: 150px;
   }
   
   /* 애니메이션 효과 있는 부분 주석처리함 */
   /* Add Animation */
   /* .modal-content, #caption {  
     -webkit-animation-name: zoom;
     -webkit-animation-duration: 0.6s;
     animation-name: zoom;
     animation-duration: 0.6s;
   } */
   
   @-webkit-keyframes zoom {
     from {-webkit-transform:scale(0)} 
     to {-webkit-transform:scale(1)}
   }
   
   @keyframes zoom {
     from {transform:scale(0)} 
     to {transform:scale(1)}
   }
   
   /* The Close Button */
   .close {
     position: absolute;
     top: 100px;
     right: 300px;
     color: #f1f1f1;
     font-size: 40px;
     font-weight: bold;
     transition: 0.3s;
     
   }
   .close:hover,
   .close:focus {
     color: #bbb;
     text-decoration: none;
     cursor: pointer;
   }
   
   /* 100% Image Width on Smaller Screens */
   @media only screen and (max-width: 700px){
     .modal-content {
      width: 100%;
     }
   }

   .modaltext{
      color: white;
      word-spacing: 20px;
   }

   a{ color:black; text-decoration: none; }
   a:hover{
      text-decoration: none;
      color:black;
   }
   button a, button a:hover{
      color: black; text-decoration:none;
   }
   
   #pages{
          text-align:right;
      margin:2% 2% 3% 0;
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
    
    .container{
       width:990px;
    }
    #productUpdate{
    
    }
    .delBtn{
       width:35px; height:25px; font-size:5pt; 
       background-color:black; color:white; border:none; border-radius:1px;
       display:inline;
    }
    .btnstyle{
        width:35px; height:25px; font-size:5pt; 
       background-color:black; color:white; border:none; border-radius:1px;
       display:inline;
    }
    
    #p_image{
       width:500px; height:570px;
    }
    
    #newR_content{
       display:none;
    }
    .info, .info:focus{
       border:none;
       outline:none;
       
    }
    
    
   </style>
<title>Store 상세보기 :: MovingCloset</title>
</head>
<body>

   <div class="container" style="margin-top:10%;margin-bottom:3%;">
      <form name="detailFrm" method="POST"  enctype="multipart/form-data"
         action="../store/buy.do">
         <div class="row" style="height: 600px;">
            <input type="hidden" name="p_idx" value="${storeDetail.p_idx }"/>   
            <input type="hidden" name="code" value="${storeDetail.p_code }"/>   
            <div class="col-8 d-flex justify-content-center" >
               <div id="image_container">
                  <img src="../resources/upload/${storeDetail.p_sfile }" alt="상품이미지" id="p_image" />
               </div>
            <!--  
               <div class="col-6" style="padding:0;display:block;height:300px;">
                  <span class="a">
                     <img src="../resources/images/details/1.1.png" alt="상품이미지" class='img' class="rounded"/>
                  </span>
                  <span class="a">
                     <img src="../resources/images/details/1.2.png" alt="상품이미지" class='img' class="rounded"/>
                  </span>
               </div>
               <div class="col-6" style="padding:0;display:block;height:300px;">
                  <span class="a">
                     <img src="../resources/images/details/1.3.png" alt="상품이미지" class='img' class="rounded"/>
                  </span>
                  <span class="a">
                     <img src="../resources/images/details/1.4.png" alt="상품이미지" class='img' class="rounded"/>
                  </span>
               </div>
               -->
            </div>
            
            <div class="col-4" style="padding-left:3%; padding-top:5%;">
               <div id="brandName" ><input class="info" type="text" name="p_brand" value="${ storeDetail.p_brand}" readonly/></div>
               <div id="prodName"><input class="info" type="text" name="p_name" value="${storeDetail.p_name }" readonly/></div>
               <div id="price" ><input class="info" type="text" name="p_price" value="${storeDetail.p_price } 원" readonly/></div>
               <br>
   
               <div class="row">
                  <div class="col-11">
                     <select name="size" id="sizeNum" style="border: solid lightgray 1px; border-radius:2px; padding:3px;">
                        <option value=""diabled select hidden>사이즈</option>
                           <c:forEach items="${sizes }" var="size" >
                              <option value="${size}">${size}
                                 <!-- varStatus="status"  <input type="hidden" value="${stocks[status.index] }"/>    -->
                              </option>
                           </c:forEach>
                     </select>
                  </div>
               </div>
               <br>
               <div class="row">
                  <div class="col-4" style="vertical-align:center; text-align:right; padding-top:5px;">
                     <span id="prodCount">수량</span>
                  </div>
                  <div class="col-8">
                     <button type="button" class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
                     <input type="text" id="quantity" value="1" name="bd_count" style="border:none; width:50px; background-color: none;text-align:center;" />
                     <button type="button" class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
                  </div>
               </div>
               <hr />
               <br>
               <div>
                  <button type="button" id="btnBuy" style="width:92%;" onclick="buyCheck();">구매하기</button>
               </div><br> 
               <div>
                  <span><button type="button" style="width: 45%;height:60px;border:black solid 1px;" id="basket" onclick="addCart();">장바구니</button></span>
                  <span class="wishButton"><!-- <button type="button" style="width: 45%;height:60px;" id="wish" onclick="wishList();">위시리스트&nbsp;<img id="wishImg" src="../resources/images/heart4.png" alt="하트_회색" width="25"/></button> --></span>
               </div>
            </div>
         </div>
<!--          <div style="text-align:right;"> -->
<%--             <button type="button" class="product" id="productUpdate" onclick="javascript:location.href='/movingcloset/store/update.do?p_idx=${storeDetail.p_idx }';">상품수정</button>    --%>
<!--          </div> -->
      </form>
   </div>
   <br /><br /><br />
   <hr>



   <div class="container">
      <h4>평균 평점 : <span>5.0</span></h4>
      <div class="row" style="padding: 1%; padding-left:5%;">
         <div class="d-flex mr-auto" >
            <input type="checkbox" name="photocheck" id="photocheck" value="photocheck" class="form-check-input" style="zoom: 1.5;"/>
               <label for="photocheck" style="font-size:1em;">포토리뷰</label>
         </div>
         
         <!-- 해당 상품을 구매한 내역이 있을때만 리뷰 쓰기 버튼 보이게 처리
            userid와 p_code 필요!
          -->
         <c:if test="${siteUserInfo != null && buyAndGroupDTO.p_code != null}"  >
            <div class="d-flex ml-auto">
               <button id="btnReview">리뷰 쓰기</button>
            </div>         
         </c:if>
      
      </div>

<!-- 댓글 시작 ------------------------------------------------------------------------------------------------ -->
      <form action="" name="reviewUpdate" method="POST"  enctype="multipart/form-data">
      <input type="hidden" name="ofileCheck" /> 
      <table class="table table-hover" style="text-align: center;">
         <thead>
         <tr>
            <th style="width: 15%;">평점
               <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
               <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
               <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
               <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
               <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>
            </th>
            <th style="width: 40%;">한줄평</th>
            <th style="width: 10%;">작성일</th>
            <th style="width: 10%;">작성자</th>            
            <th style="width: 20%;">사진</th>
            <th style="width: 20%;"></th>
         </tr>
         </thead>
         <tbody>
         
         <c:forEach items="${reviews }" var="review" >
            <tr >
               <td>
               평점 <!-- 평점 수정했습니다!------>
                  <c:forEach begin="1" end="${review.r_rate }" step="1">
                     <i class="fa fa-star" style="color:#FF6C2F; font-size:14pt;"></i>               
                  </c:forEach>
               </td>
               
               <td>
                  <div class="r_content" id="rid${review.r_idx }">
                     ${review.r_content }
                  </div>


               </td>
               
               <td>${review.r_date }</td>
               <td>
                  ${review.userid }
                  <%-- <input type="hidden" name="r_idx" value="${review.r_idx }"/> --%>
                  <input type="hidden" name="p_code" value="${review.p_code }"/>
                  <input type="hidden" name="p_idx" value="${storeDetail.p_idx }"/>
               </td>
               <td>
               <div id="photo${review.r_idx }">
                  <c:choose>  
                     <c:when test="${review.r_sfile eq null }">
                     </c:when>
                     <c:otherwise>
                        <img class="myImg" id="r_image${review.r_idx }" name="ofile" src="../resources/upload/${review.r_sfile }" alt="상품이미지"
                        style="width: 100px; height: auto;"/>   
                                       
                     </c:otherwise>
                  </c:choose>
               </div>
               </td>
               <td>
                  <div id="btnDiv${review.r_idx }">  
                  <c:if test="${sessionScope.siteUserInfo != null && siteUserInfo eq review.userid }">
                     <button type="button" class="btnstyle" onclick="rUpdate(${review.r_idx});">수정</button>
                     <button type="button" class="delBtn" onclick="delReview(${review.r_idx}, ${storeDetail.p_idx });">삭제</button>
                  </c:if>
                  </div>               
               </td>
            </tr>
            
         </c:forEach>
         </tbody>
      </table>
      
      </form>
         <hr />
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
         <br />
      </div>
      

		
<!-- 댓글 끝 ------------------------------------------------------------------------------------------------ -->
   
   <!-- The Modal -->
   <div id="myModal" class="modal">
      <span class="close">&times;</span>
      <img class="modal-content" id="img01" />
      <div class="modaltext" style="text-align: center;">
         <br>
         <!-- 키, 몸무게, 발사이즈 -->
         <span>키</span>
         <span>몸무게</span>
         <span>발사이즈</span>
         <br><br>
         <!-- 해시태그 부분 -->
         <span>#정사이즈</span>
         <span>#흰색</span>
         <span>#예뻐요</span> 
      </div>
   </div>

<!--    <script>
      // Get the modal
      var modal = document.getElementById("myModal");
      
      // Get the image and insert it inside the modal - use its "alt" text as a caption
      var img = document.getElementById("myImg");

      var modalImg = document.getElementById("img01");
      img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;;
      }
      
      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];
      
      // When the user clicks on <span> (x), close the modal
      span.onclick = function() { 
        modal.style.display = "none";
      }
   </script> -->

</body>
</html>