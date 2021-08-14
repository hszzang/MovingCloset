<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<style>
#maintain{
	padding-top: 200px;
	padding-bottom: 100px;
}

.main{
    font-size: 25px;
    font-weight: bold;
    color: black;
}

.category{
    font-weight: bold;
    font-size: 15px;
}

#jumbo{
    background-color: black;
    border-radius: 50px;
    color: white;
    opacity: 0.9;
}

.설명{
    font-size: 12px;
}

.result_title {
    text-align: center;
    border-bottom: solid 0.5px black;
    padding-bottom: 15px;
 }
 
.result{
   text-align: center;
   border-top: solid 0.5px black;
   padding-top: 25px;
 }
</style>
<body>
	<div class="container" id="maintain">
        <div class="row">
            <div class="col-lg-3">
                <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action main">MyPage</div>
		            <div class="list-group-item list-group-item-action profile">
		                <i class="material-icons" style="font-size:36px; color:black">account_circle</i>
		            </div>
		            <div class="list-group-item list-group-item-action category">쇼핑정보</div>
		            <a href="./coupon.do" class="list-group-item list-group-item-action">쿠폰함</a>
		            <a href="./order.do" class="list-group-item list-group-item-action">주문내역</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">활동정보</div>
		            <a href="./please.do" class="list-group-item list-group-item-action">조르기</a>
		            <a href="./zzim.do" class="list-group-item list-group-item-action">찜한상품</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">나의정보</div>
		            <a href="./manage.do" class="list-group-item list-group-item-action">회원정보관리</a>
		            <a href="./bus.do" class="list-group-item list-group-item-action">모여버스</a>
		            <a href="./out.do" class="list-group-item list-group-item-action">회원탈퇴</a>
		        </div>
		        <div class="list-group list-group-flush">
		            <div class="list-group-item list-group-item-action category">문의/리뷰</div>
		            <a href="./myqna.do" class="list-group-item list-group-item-action">문의내역</a>
		            <a href="./review.do" class="list-group-item list-group-item-action">리뷰내역</a>
		        </div>
            </div>
            <div class="col-lg-9">
                <div class="jumbotron" id="jumbo">
                    <h3>문의내역</h3>
                    <p class="설명">
                        문의한 내역이 보여집니다.
                    </p>
                </div>
                    <table class="table">
                        <tr>
                            <td align="center">
                                <select name="searchField">
                                    <option value="date">기간별</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th width="10%">번호</th>
                                <th width="50%">제목</th>
                                <th width="15%">작성자</th>
                                <th width="10%">조회수</th>
                                <th width="15%">작성일</th>
                            </tr>
                        </thead>
                        <c:choose>
                            <c:when test="${empty boardLists }">
                                <tr>
                                    <td colspan="6" align="center">
                                        등록된 문의내역이 없습니다.
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${boardLists }" var="row" varStatus="loop">
                                <tr>
                                    <td width="10%">
                                        ${map.totalCount - (((map.pageNum-1) * map.pageSize)
                                            + loop.index) }	
                                    </td>
                                    <td width="50%" align="left">
                                        <a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a>
                                    </td>
                                    <td width="15%" align="left">${row.name }</td>
                                    <td width="10%" align="left">${row.visitcount }</td>
                                    <td width="15%" align="left">${row.postdate }</td>
                                </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>