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
        <title>MovingCloset_Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    
    <style>
    	.as{ text-decoration: none; color:black;}
    	.as:hover{ text-decoration:none; color:gray;}
    </style>
    <script>
    
    </script>
    </head>
    <body class="sb-nav">
    <br /><br /><br /><br />
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#"></a>
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
                                MEMBERS
                            </a>
                            <a class="nav-link" href="/movingcloset/movingcloset/adminqna.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                QnA
                            </a>
                            <a class="nav-link" href="/movingcloset/movingcloset/adminorder.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ORDER
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
                            <a class="nav-link" href="/movingcloset/movingcloset/adminzzim.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ZZIM
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
                        <h3 class="mt-4">관리자모드</h3><br />
                        <!-- 
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                         -->
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">MEMBERS</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">QnA</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">STORE</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">SALES</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        -->
                        <div class="card mb-4" style="width:49%;display:inline;float:left;">
                            <div class="card-header">
                            	<a href="/movingcloset/movingcloset/adminstore.do">
                                <i class="fas fa-table me-1"></i></a>
                                모여
                                <!--  
                                <button type="button" id="productInsert" onclick="javascript:location.href='/movingcloset/store/insert.do';">상품추가</button>
                           		-->
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	[진행] 테스트 모여1 &nbsp;&nbsp;&nbsp;(83 / 120명 달성)
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:71%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	[진행] 테스트 모여2 &nbsp;&nbsp;&nbsp;(62 / 100명 달성)
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" style="width:62%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	<strike>[실패] 테스트 모여3 &nbsp;&nbsp;&nbsp;(88 / 100명 달성)</strike>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-warning progress-bar-striped progress-bar" style="width:88%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                       <tr>
                                        	<strong>[성공] 테스트 모여4 &nbsp;&nbsp;&nbsp;(100 / 100명 달성) </strong>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-warning progress-bar-striped progress-bar" style="width:100%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                       <tr>
                                        	<strong>[성공] 테스트 모여4 &nbsp;&nbsp;&nbsp;(100 / 100명 달성) </strong>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-warning progress-bar-striped progress-bar" style="width:100%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                    <!--  
                                   		<%--c:forEach items="${StoreList }" var="product"--%>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_idx }</a></td>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_code}</a></td>
                                            <td>${product.p_brand}</td>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_name}</a></td>
                                            <td>${product.p_price}</td>
                                            <td>${product.pd_size}</td>
                                            <td>${product.pd_stock}</td>
                                            <td></td>
                                            <th>
                                            	<button type="button" id="productUpdate" onclick="javascript:location.href='/movingcloset/store/update.do?p_idx=${product.p_idx }';">수정</button>
                                            	<button type="button" id="productDelete" onclick="delProduct(${product.p_idx});">삭제</button>	
                                            </th>
                                    	<%--/c:forEach --%>   
                                    -->
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                        
                        <div class="card mb-4" style="width:49%;display:inline;float:right;">
                            <div class="card-header">
                            	<a href="/movingcloset/movingcloset/adminstore.do">
                                <i class="fas fa-table me-1"></i></a>
                                쪼르기
                                <!--  
                                <button type="button" id="productInsert" onclick="javascript:location.href='/movingcloset/store/insert.do';">상품추가</button>
                            	-->
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                    </thead>
                                    <tbody>
                                   		 <tr>
                                        	[진행] 테스트 쪼르기1 &nbsp;&nbsp;&nbsp;(22 / 120명 달성) 
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" style="width:20%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	[진행] 테스트 쪼르기2 &nbsp;&nbsp;&nbsp;(76 / 100명 달성)
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" style="width:76%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	<strong>[성공] 테스트 쪼르기3 &nbsp;&nbsp;&nbsp;(100 / 100명 달성) </strong>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-danger progress-bar-striped progress-bar" style="width:100%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	<strike>[실패] 테스트 쪼르기4 &nbsp;&nbsp;&nbsp;(94 / 100명 달성) </strike>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-danger progress-bar-striped progress-bar" style="width:94%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        <tr>
                                        	<strike>[실패] 테스트 쪼르기5 &nbsp;&nbsp;&nbsp;(84 / 100명 달성) </strike>
                                        	<div class="progress" style="width:90%; height:10px; margin-left:10px;">
												<div class="progress-bar bg-danger progress-bar-striped progress-bar" style="width:84%; height:20px"></div>
											</div>
											<hr />
                                        </tr>
                                        
                                    <!--  
                                   		<%--c:forEach items="${StoreList }" var="product"--%>
                                        <tr>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_idx }</a></td>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_code}</a></td>
                                            <td>${product.p_brand}</td>
                                            <td><a class="as" href="/movingcloset/store/detail.do?p_idx=${product.p_idx }&p_code=${product.p_code}">${product.p_name}</a></td>
                                            <td>${product.p_price}</td>
                                            <td>${product.pd_size}</td>
                                            <td>${product.pd_stock}</td>
                                            <td></td>
                                            <th>
                                            	<button type="button" id="productUpdate" onclick="javascript:location.href='/movingcloset/store/update.do?p_idx=${product.p_idx }';">수정</button>
                                            	<button type="button" id="productDelete" onclick="delProduct(${product.p_idx});">삭제</button>	
                                            </th>
                                        </tr>
                                    	<%--/c:forEach --%>   
                                    -->
                                    </tbody>
                                </table>
                                
                            </div>
                        </div>
                        
                        
                    </div>
                </main>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
