<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovingCloset_Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <style>
    	#wrapper{ margin-bottom:100px;}
        #list{
            border:none;
            width:85%; height:auto;
            margin:0 5% 10% 10%; padding-left:3%; padding-bottom:3%;
            display: inline; float: left;
        }

        #filter{
            width:100%; height:400px;
            border:none;
            padding: 5% 20% 10% 20%;
            margin:0 0 50px 0;
        }
        #searchSpan{
        	display:inline;
        }
    	#searchIn{
    		width:90%; height:80px;
    		border: none;
    		color:gray; font-size:2em;
    		font-weight:lighter;
        	display:inline;
    	}
    	input:focus{outline:none;}
    	/*
    	#searchBtn{
    		width:70px; height:80px;
    		background-color:black;
        	display:inline;
    	}
    	*/
    	.filterLbl{
    		font-size:1.3em;
    		font-weight:lighter;
    		margin-left:7%;
    	}
    	#ul1{
    	
    	}
        #filterBtn{
            display:inline;
            margin-top:0;
            font-size:20pt;
        }
        #filterDropdown{
            margin-left:80%;
            display:inline;
        }
        #filterSel{
        	float:right;
            width:150px; height:35px;
            text-align: center;
            border: white;
        }
		
        .products{
            width: 350px; height:450px;
            border:solid white 1px;
            padding: 5px 25px 10px 25px;
            display:inline-block;
        }
        .img{ width:300px; height:300px; }
        .brand{ font-size: 10pt; font-color:darkgray; font-weight:bolder;}
        a{ text-decoration: none; color:black;}
        .name{ font-size: 11pt; }
        .origPrice{ 
            font-size:10pt; 
            color:lightgray;
        }
        .discountedPrice{
            color: #FF6C2F;
            font-size:12pt;
            font-weight: bold;
        }
        .heart{ font-size:15pt; }

        #pages{
            width:100%; height:50px;
            border: black 1px;
            text-align: center;
            margin: 500px 0 50px 0;
        }
        .pageNum{
            color:slategray;
            font-size:30pt;
        }
        .pageArrow{
            color:slategray;
            font-size:20pt;
        }


        @media only screen and (max-width:1000px){

        }
        @media only screen and (max-width: 700px) {
        #filterBtn{ margin-left:20%;}
        }
        @media only screen and (max-width: 500px) {
        #filterBtn{ margin-left: 7%; }
        #filterDropdown{ margin-left: 45%;}
        #lists{ margin-left:15%;}
        }
        
    </style>
</head>
<body>
    <div id="wrapper">
    <!--  
        <form action="">
        -->
            <div id="list">
            
                <div id="filter">
                	 <div id="searchSpan">
                	 	<form action="">
 							<input type="text" id="searchIn" placeholder="Search.."/>
 							<i id="searchBtn" class="fas fa-search" style="font-size:40px;"></i> </form>
		                    <hr id="ul1" />
                    </div>
		            <br />
                    <div id="filterBtn">
						<span><label class="filterLbl">PRODUCT</label></span>
						<span><label class="filterLbl">BRAND</label></span>
						<span><label class="filterLbl">COLOR</label></span>
						<span><label class="filterLbl">TAG</label></span>
                    </div>
                    <br /><hr />
                    <span id="filterDropdown">
                        <select name="filterSelect" id="filterSel" placeholder="신상품순">
                            <option value="best">베스트순</option>
                            <option value="lowprice">낮은가격순</option>
                            <option value="highprice">높은가격순</option>
                            <option value="discount">높은할인순</option>
                            <option value="interest">높은관심순</option>
                        </select>
                    </span>
                </div>
				
                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/1.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>       


                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/2.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>       

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/3.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>       

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/4.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>       

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/5.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>     
                        
                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/6.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/7.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/8.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/9.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/10.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/11.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/12.jpg"></a>
                            <div class="brand">Adidas</div>
                            <div class="name"><label for="">오즈위고 트리플블랙 외 4종 택일<br> (FX6029/EE6999/EE7773/EE6464)</label></div>
                            <div class="Price">
                                <span class="origPrice"><strike>119,000</strike></span><br>
                                <span class="discountedPrice">34% 79,000원</span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart">♡</label>
                            </div>
                        </span>  
                        
                
                		        
            </div>
           
           <!--  
        </form>
        --> 
    </div>
</body>
</html>