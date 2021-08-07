<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지01</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mypage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item main">My Page</li>
                    <li class="list-group-item profile">
                        <i class="material-icons" style="font-size:36px">account_circle</i>
                    </li>
                    <li class="list-group-item category">쇼핑정보</li>
                    <a href="mypage_coupon.jsp" class="list-group-item list-group-item-action">쿠폰함</a>
                    <a href="mypage_order.jsp" class="list-group-item list-group-item-action">주문내역</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">활동정보</li>
                    <a href="mypage_please.jsp" class="list-group-item list-group-item-action">조르기</a>
                    <a href="mypage_zzim.jsp" class="list-group-item list-group-item-action">찜한상품</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">나의정보</li>
                    <a href="mypage_manage.jsp" class="list-group-item list-group-item-action">회원정보관리</a>
                    <a href="mypage_moyoBus.jsp" class="list-group-item list-group-item-action">모여버스</a>
                    <a href="mypage_out.jsp" class="list-group-item list-group-item-action">회원탈퇴</a>
                </ul>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item category">문의/리뷰</li>
                    <a href="mypage_myqna.jsp" class="list-group-item list-group-item-action">문의내역</a>
                    <a href="mypage_review.jsp" class="list-group-item list-group-item-action">리뷰내역</a>
                </ul>
            </div>
            <div class="col-lg-9">
                <div class="jumbotron">
                    <h3>리뷰내역</h3>
                    <p class="설명">
                        상품에 리뷰한 내역이 보여집니다.
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
                                    등록된 리뷰내역이 없습니다.
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








</body>
</html>