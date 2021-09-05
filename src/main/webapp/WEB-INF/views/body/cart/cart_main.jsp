<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/cart.css">
<title>Insert title here</title>
</head>
<script>
$(function(){
	cartList();
});

function cartList() {
    $.ajax({
        url:'../cartlist',
        type : 'POST',
        dataType:'json',
        success :  function(result){
        	
        	let info = "";
			let res = "";
        	let total = 0;
        	for(let i=0 ; i<result.length ; i++){
        		let p_price = result[i].p_price*result[i].c_qty;
        		
        		let p_priceString = p_price.toString();
        		let price1 = "";
        		if(p_priceString.length <= 4){
        			price1 = p_priceString.substr(0,1);
        		}else if(p_priceString.length <= 5){
        			price1 = p_priceString.substr(0,2);
        		}else if(p_priceString.length <= 6){
        			price1 = p_priceString.substr(0,3);
        		}
        		let price2 = p_priceString.substr(p_priceString.length-3,3);        			
        		p_priceString = price1+","+price2;
        		
        		
        		info += "<div class='bucket_info'>"
        		+ "<div style='width: 3%;'>"
                + "<input type='checkbox' id='check_sol' name='check_sol' onclick='totalPrice("+i+","+p_price+")'/>"
                + "</div>"
                + "<div>"
                + "<a>"
                + "<img src='../resources/upload/"+result[i].p_sfile+"'>"
                + "</a>"
                + "</div>"
                + "<div style='width: 37%; height: 140px; padding: 0 10px; border-right: solid rgb(230, 230, 230) 1px;'>"
                + "<p>"+ result[i].p_brand +"</p>"
                + "<a href='' style='text-decoration: none; color: black;'>"
                + "<strong>"+ result[i].p_code +"</strong>"
                + "</a>"
                + "</div>"
                + "<div style=' width: 30%; height: 140px; padding: 0 10px; border-right: solid rgb(230, 230, 230) 1px;'>"
                + "<p>"+ result[i].p_flag +" / "+ result[i].pd_color +" / "+ result[i].pd_size +" / "+ result[i].c_qty +"</p>"
                + "<div>"
                + "수량 :"
                + "<button class='btn' id='plus"+i+"' onclick='plusminus(this.id, "+i+", "+result[i].c_qty+", "+result[i].c_idx+");'><i class='fa fa-plus'></i></button>"
                + "<input type='text' id='quantity"+i+"' value='"+ result[i].c_qty +"' style='border:none; width:50px; background-color: none;text-align:center;'>"
                + "<button class='btn' id='minus"+i+"' onclick='plusminus(this.id, "+i+", "+result[i].c_qty+", "+result[i].c_idx+");'><i class='fa fa-minus'></i></button>"
                + "</div>"
                + "</div>"
                + "<div style=' width: 17%; height: 140px; text-align: center; border-right: solid rgb(230, 230, 230) 1px;'>"
                + "<span style=' line-height: 140px; font-size: 20px; font-weight: bold;'>"+ p_priceString +"원</span>"
                + "</div>"
                + "<div style='width: 3%; margin-left: 15px;'>"
                + "<button onclick='listRemove("+ result[i].c_idx +");'')>"
                + "<img src='../resources/images/icon/cancle.png' style='height: 15px; width: 14px;'>"
                + "</button>"
                + "</div>"
                + "</div>";
                              	  
        	}
        	$('.bucket_info_wrap').empty();
        	$('.bucket_info_wrap').append(info);
	
        /* 	res += "<div style='text-align: center; font-weight: bold; font-size: 25px; margin-top: 15px;'>총 결제 금액</div>"
                + "<div style='text-align: center; color: red; font-size: 30px; font-weight: bold;' id='totalDiv'>"+ total +"원</div>"
            $('.bucket_result').empty();
            $('.bucket_result').append(res); */
        },
        error : function(request, status, error) {
        	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
        }
    });
};

var cartDTO = {};
function listRemove(c_idx) {
	
	cartDTO.c_idx = c_idx;
	
	$.ajax({
		url : '../listremove',
		type : 'POST',
		data : cartDTO,
		success : function(map) {
			alert("삭제하였습니다.");
			cartList();
		},
		error : function(request, status, error) {
	    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
	    }
	});
}

let total = 0;
function totalPrice(i, p_price) {
		
	var sol = document.getElementsByName("check_sol")[i];

	if(sol.checked == true) {
		total += p_price;
	}
	else if(sol.checked == false) {
		total -= p_price;
	}
	
	if(total <= 0) {
		total = 0;
	}
	
	let totalString = total.toString();
	let total1 = "";
	let total2 = "";
	if(totalString.length <= 4 || totalString.length==7){
		total1 = totalString.substr(0,1);
		total2 = totalString.substr(1,3);
	}else if(totalString.length <= 5 || totalString.length==8){
		total1 = totalString.substr(0,2);
		total2 = totalString.substr(2,3);
	}else if(totalString.length <= 6 || totalString.length==9){
		total1 = totalString.substr(0,3);
		total2 = totalString.substr(3,3);
	}    			
	let total3 = totalString.substr(totalString.length-3,3);
	
	if(totalString.length <= 6){
    	totalString = total1+","+total2;        		
	}
	else if(totalString.length <=9){
    	totalString = total1+","+total2+","+total3;        		
	}
	
	document.getElementById("totalDiv").innerText = totalString+"원";
};

/* var total = 0;
function totalPrice(i){

	var sol =  document.getElementsByName("check_sol")[i];
	if(sol.checked == true){
		total += parseInt(sol.value);
		
	}else{
		total = total;
	}
	
	
	let totalString = total.toString();
	let total1 = "";
	let total2 = "";
	if(totalString.length <= 4 || totalString.length==7){
		total1 = totalString.substr(0,1);
		total2 = totalString.substr(1,3);
	}else if(totalString.length <= 5 || totalString.length==8){
		total1 = totalString.substr(0,2);
		total2 = totalString.substr(2,3);
	}else if(totalString.length <= 6 || totalString.length==9){
		total1 = totalString.substr(0,3);
		total2 = totalString.substr(3,3);
	}    			
	let total3 = totalString.substr(totalString.length-3,3);
	
	if(totalString.length <= 6){
    	totalString = total1+","+total2;        		
	}else if(totalString.length <=9){
    	totalString = total1+","+total2+","+total3;        		
	}
	
	
	document.getElementById("totalDiv").innerText = totalString;
	
	
} */ 

</script>
<style type="text/css">
	.sectiontitle {
	   text-align: center;
	   padding-bottom: 10px;
	   padding-top: 50px;
	}
	
	.sectiontitle h2 {
	   font-size: 32px;
	   font-weight: bold;
	   text-transform: uppercase;
	   margin-bottom: 10px;
	   padding-bottom: 20px;
	   position: relative;
	}
	
	.sectiontitle h2::after {
	   content: '';
	   position: absolute;
	   display: block;
	   width: 50px;
	   height: 3px;
	   background: #555555;
	   bottom: 0;
	   left: calc(50% - 25px);
	}
</style>
<body> 

	<div class="container">
		<div class="sectiontitle" style="margin-top:150px;">
	    	<h2>SHOPPING LIST</h2>
	    </div>
        <div class="bucket_select">
            <div class="select_all">
                <input type="checkbox" id="check_all"/>
                <label for="check_all">
                    전체선택
                </label>
            </div>
        </div>
        <div class="bucket_division">
            <div style="width: 50%; text-align: center;">
                <h3>상품정보</h1>
            </div>
            <div style="width: 30%; text-align: center;">
                <h3>상품옵션</h1>
            </div>
            <div style="width: 15%; text-align: center;">
                <h3>상품금액</h1>
            </div>
        </div>
        <div class="bucket_info_wrap">
	        <!-- <div class="bucket_info">
	            <div style="width: 3%;">
	               <input type="checkbox" id="check_sol">
	            </div>
	            <div>
	                <a href="">
	                    <img src="../resources/images/coupon/musinsa_blackfriday.jpg">
	                </a>
	            </div>
	            <div style=" width: 37%; height: 140px; padding: 0 10px; border-right: solid rgb(230, 230, 230) 1px;">
	                <p>MUSINSA</p>
	                <a href="" style="text-decoration: none; color: black;">
	                    <strong>[AA4301]</strong>
	                </a>
	            </div>
	            <div style=" width: 30%; height: 140px; padding: 0 10px; border-right: solid rgb(230, 230, 230) 1px;">
	                <p>와이드슬랙스  / black / S / 1</p>
	                 <div>
	                    수량 :
	                    <button class="btn" id="plus" onclick="plusminus(this.id);"><i class="fa fa-plus"></i></button>
	                    <input type="text" id="quantity" value="1" style="border:none; width:50px; background-color: none;text-align:center;">
	                    <button class="btn" id="minus" onclick="plusminus(this.id);"><i class="fa fa-minus"></i></button>
	                </div>
	            </div>
	            <div style=" width: 17%; height: 140px; text-align: center; border-right: solid rgb(230, 230, 230) 1px;">
	                <span style=" line-height: 140px; font-size: 20px; font-weight: bold;">13,000원</span>
	            </div>
	            <div style="width: 3%; margin-left: 15px;">
	                <button>
	                    <img src="../resources/images/icon/cancle.png" style="height: 15px; width: 14px;">
	                </button>
	            </div>
	        </div> -->
        </div>
        <div class="bucket_result" >
        <div style="text-align: center; font-weight: bold; font-size: 25px;">총 결제 금액</div>
            <div id='totalDiv' style="text-align: center; color: red; font-size: 30px; font-weight: bold;">0원</div>
        </div>
        <div class="bucket_buy">
            <button>
                <img src="../resources/images/icon/buy.png" style="height: 150px; width: 150px;">
            </button>
        </div>
    </div>
    
</body>
    <script>
     document.querySelector("input[id=check_all]").addEventListener("change", function (e) {
         e.preventDefault();
         var list = document.querySelectorAll("input[id=check_sol]");
         for (var i = 0; i < list.length; i++) {
             list[i].checked = this.checked;
         }
    });
      
        function plusminus(id, i, c_qty, c_idx){
        	
        	cartDTO.c_idx = c_idx;
       		console.log(i);
            var num = document.getElementById("quantity"+i);
    		
            if(id=="minus"+i){ 
            	
                if(num.value <= 1){
                    num.value = 1;
                    cartDTO.c_qty = c_qty;
                }else{
                    num.value = parseInt(num.value) - 1;
	            	cartDTO.c_qty = c_qty-1;
                }
                $.ajax({
            		url : '../qtytrans',
            		type : 'POST',
            		data : cartDTO,
            		success : function() {
            			cartList();
            		},
            		error : function(request, status, error) {
            	    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
            	    }
            	});
                
            }
            
            if(id=="plus"+i){ 
            	
                num.value = parseInt(num.value) + 1;
                
            	cartDTO.c_qty = c_qty+1;
                $.ajax({
            		url : '../qtytrans',
            		type : 'POST',
            		data : cartDTO,
            		success : function() {
            			cartList();
            		},
            		error : function(request, status, error) {
            	    	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
            	    }
            	});
                
            }
        	
        }
        
    </script>
</html>