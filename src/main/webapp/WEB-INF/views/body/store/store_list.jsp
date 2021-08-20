<%@page import="mybatis.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--

List<ProductDTO> storeList = (List)session.getAttribute("storeList");

--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovingCloset_Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
    <style>
    	#wrapper{margin-top:90px; margin-bottom:100px; padding:0 2% 0 2%;}
        #list{
            border:black;
            width:85%; height:auto;
            margin:0 7% 0 8%; padding-left:3%;
            display: inline; float: left;
        }

        #filter{
            width:100%; height:50px;
            border:none;
            padding: 5px 0 0 0;
            margin:100px 0 100px 0;
        }
        #filterBtn{
            display:inline;
            margin-left:38%;
            font-size:12pt;
        }
        #filterDropdown{
            margin-left:85%;
            display:inline;
        }
        #filterSel{
            width:150px; height:50px;
            text-align: center;
            border: none;
        }
		#filterSel:focus{outline:none;}
		
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
            font-size:12pt; 
            color:lightgray;
        }
        .discountedPrice{
            color: #FF6C2F;
            font-size:14pt;
            font-weight: bold;
        }
        .won{color:gray; font-size:12pt; }
        .heart{ font-size:15pt; }

        #pages{
        	text-align:right;
			margin: 50px 10% 100px 75%;
			display:inline-block;
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

		.product{width:100px; height:40px; background-color:black; color:white; }

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
        <form action="">
            <div id="list">
                <div id="filter">
                    <span id="filterBtn">
                        <button type="button" class="btn btn-dark">전체</button>
                        <button type="button" class="btn btn-dark">의류</button>
                        <button type="button" class="btn btn-dark">신발</button>
                        <button type="button" class="btn btn-dark">가방</button>
                        <button type="button" class="btn btn-dark">잡화</button>
                    </span>
                    <span id="filterDropdown">
                        <select name="filterSelect" id="filterSel">
                            <option value="new">신상품순</option>
                            <option value="best">베스트순</option>
                            <option value="lowprice">낮은가격순</option>
                            <option value="highprice">높은가격순</option>
                            <option value="discount">높은할인순</option>
                            <option value="interest">높은관심순</option>
                        </select>
                    </span>
                </div>
                
					 <c:forEach items="${storeList }" var="product">	
						<span class="products">
							<!-- <a href="/movingcloset/store/detail.do?p_idx=${product.p_idx }"><img class="img" src="../resources/upload/${product.p_sfile }> -->
							<a href="/movingcloset/store/detail.do?p_idx=${product.p_idx }"><img class="img" src="../resources/images/list/1.jpg"></a>
							<!-- src="../Uploads/${row.sfile }"  -->
                            <!--<a href="/movingcloset/store/detail.do"><img class="img" src="${dto.sfile }"></a> -->
                            <div class="brand">${product.p_brand }</div>
                            <div class="name"><label>${product.p_name }</label></div>
                            <div class="price">
                                <span class="origPrice"><strike>${product.p_price}</strike></span>
                                <span class="discountedPrice">${product.p_price}</span>
                                <span class="won">원</span>
                                <span class="heart" style="text-align:right;"><label class="heart"><i class="fa fa-heart" style="font-size:10pt;color:white;"></i></label></span>
                            </div>
                            <div class="event"></div>
                        </span>   
					 </c:forEach>	
					 
					 
					 
					<%--
					<% for(ProductDTO list : storeList) { %>
					<span class="products">
							<a href="/movingcloset/store/detail.do"><img class="img" src="../resources/images/list/1.jpg"></a>
                            <!--<a href="/movingcloset/store/detail.do"><img class="img" src="${dto.sfile }"></a> -->
                            <div class="brand"><%= list.getP_brand() %></div>
                            <div class="name"><label for=""><%= list.getP_name() %></label></div>
                            <div class="Price">
                                <span class="origPrice"><strike><%= list.getP_price() %></strike></span><br>
                                <span class="discountedPrice"><%= list.getP_price() %></span>
                            </div>
                            <div class="event"></div>
                            <div class="icons">
                                <label class="heart" style="color:white;">♥</label>
                            </div>
                        </span>   
					<% } %>
					--%>
<!--  
                        <span class="products">
                            <a href="/movingcloset/store/detail.do"><img class="img" src="../resources/images/list/1.jpg"></a>
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

                        <span class="products">
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/13.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/14.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/15.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/16.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/17.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/18.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/19.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/20.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/21.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/22.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/23.jpg"></a>
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
                            <a href="https://www.29cm.co.kr/product/950775"><img class="img" src="../resources/images/list/24.jpg"></a>
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
 -->                       
                           
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
            <div style="text-align:right;">
            	<button type="button" class="product" id="productInsert" onclick="javascript:location.href='/movingcloset/store/insert.do';">상품추가</button>
            	<button type="button" class="product" id="productUpload" onclick="javascript:location.href='/movingcloset/store/update.do';">상품수정</button>
            </div>
        </form>
    </div>
</body>
</html>