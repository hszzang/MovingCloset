<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MovingCloset_Admin_STORE</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <style>
    	.as{ text-decoration: none; color:black;}
    	.as:hover{ text-decoration:none; color:gray;}
    	
    	#order{ display:inline; float:right; margin-right:5px;}
    	.pBtns{
    		width:42px; height:auto; font-size:10pt; text-align:center;
    		border:slategray solid 1px; border-radius:3px; background-color:slategray; color:white;
    	}
    	#productInsert{
    		width:70px; background-color:#FF6C2F; border:#FF6C2F solid 1px; display:inline; float:right;
    	}
    	#datatablesSimple{ width:100%; margin-bottom:30px; }
    	
	    </style>
	    <script>
		    function delProduct(p_idx){
				if(confirm("정말 상품을 삭제하시겠습니까?")){
					location.href="/movingcloset/store/delete.do?p_idx=" + p_idx;
				}
			}
		    
		    function lpBtn(page){
		    	var left = document.getElementById("pmL");
		    	if(page <= ${start}){
		    		/*
		    		left.style.background = 'gray';
		    		*/
		    		left.disabled="true";
		    	}	
		    	else{
		    		/*
		    		left.style.background = 'black';
		    		*/
		    		left.disabled= "false";
		    		page = page - 1;
		    		location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order=${order}&pageShow="+page;
		    	}
		    }
		    
		    function rpBtn(page){
		    	var right = document.getElementById("pmR");
		    	if(page >= ${pageEnd}){
		    		/*
		    		right.style.backgroundColor = "gray";
		    		*/
		    		right.disabled="true";
		    	}	
		    	else{
		    		/*
		    		right.style.backgroundColor = "black";
		    		*/
		    		right.disabled="false";
		    		page = page + 1;
		    		location.href="/movingcloset/movingcloset/store.do?flag=${flag}&order=${order}&pageShow="+page;
		    	}
	    </script>
    </head>
    <body class="sb-nav">
    <br /><br /><br /><br />
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                             <a class="nav-link" href="/movingcloset/movingcloset/admin.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                ADMIN
                            </a>
                            <a class="nav-link" href="/movingcloset/movingcloset/adminmember.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                MEMBER
                            </a>
                             <a class="nav-link" href="/movingcloset/movingcloset/adminstore.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                STORE
                            </a>
                            <a class="nav-link" href="/movingcloset/movingcloset/adminnewd.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                NewD
                            </a>
                            <a class="nav-link" href="/movingcloset/movingcloset/adminmoyo.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                MOYO
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                             <!-- 
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                             -->
                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h4 class="mt-4">뉴디 관리</h4>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">NewD</li>
                        <!-- 
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                         -->
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                뉴디 목록
                                <button type="button" class="pBtns" id="productInsert" onclick="javascript:location.href='/movingcloset/store/insert.do';">추가</button>
                                 <select name="order" id="order" onchange="selectOrder(this)" >
			                        	<option value="" diabled select hidden>정렬</option>
			                            <option value="idx" >신상품순</option>
			                            <option value="asc">낮은가격순</option>
			                            <option value="desc">높은가격순</option>
			                            <option value="sales">판매량순</option>
			                    </select>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead style="text-align:center;">
                                        <tr style="text-align:center;">
                                            <th style="width:5%;" >상품번호</th>
                                            <th style="width:5%;">상품코드</th>
                                            <th style="width:5%;">브랜드</th>
                                            <th style="width:35%;">상품명</th>
                                            <th style="width:10%;">가격</th>
                                            <th style="width:10%;">사이즈</th>
                                            <th style="width:5%;">재고</th>
                                            <th style="width:5%;">판매량</th>
                                            <th style="width:5%;">댓글</th>
                                            <th style="width:5%;">새 댓글</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${NewDList }" var="product">
                                        <tr style="text-align:center;">
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_idx }</a></td>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_code}</a></td>
                                            <td>${product.p_brand}</td>
                                            <td style="text-align:left;"><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_name}</a></td>
                                            <td>${product.p_price}</td>
                                            <td>${product.pd_size}</td>
                                            <td>${product.pd_stock}</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <th>
                                            	<button type="button" class="pBtns" id="productUpdate" onclick="javascript:location.href='/movingcloset/store/update.do?p_idx=${product.p_idx }';">수정</button>
                                            	<button type="button" class="pBtns" id="productDelete" onclick="delProduct(${product.p_idx});">삭제</button>	
                                            </th>
                                        </tr>
                                    	</c:forEach>   
                                    </tbody>
                                </table>
                                <div class="dataTable-bottom" style="padding:20px;">
                                <!-- 
                                	<form action="/movingcloset/movingcloset/adminstore.do?pageShow=${pageC }&order=${order }" method="get" >
                                -->
                                	<form action="/movingcloset/movingcloset/adminstore.do?pageShow=${pageC }" method="get" >
                                	<span class="dataTable-info" style="display:inline;">${pageC } of ${pageEnd }</span>
	                                	<nav class="dataTable-pagination" style="diaplay:inline;float:right;">
	                                		<ul class="dataTable-pagination-list" style="text-align:right;">
		                                		<li class="pager"><a id="pmL" href="javascript:void(0);" onclick="lpBtn(${pageC })" data-page="1">‹</a></li>
	                                			<c:forEach items="${pages }" var="page">
	                                				<li value="${ page}"><a href="/movingcloset/movingcloset/adminnewd.do?pageShow=${ page}" data-page="${ page}">${ page}</a></li>
	                                			</c:forEach>
		                                		<li class="pager"><a id="pmR" href="javascript:void(0);" onclick="rpBtn(${pageC })" data-page="2">›</a></li>
	                                		</ul>
	                                	</nav>
                                	</form>
                               </div>
                               
                            </div>
                        </div>
                    </div>
                </main>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>