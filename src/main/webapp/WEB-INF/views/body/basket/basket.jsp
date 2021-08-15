<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/jquery/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="../resources/css/basket.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="bucket_wrap">

        <div class="bucket_title">
            <h1>SHOPPING LIST</h1>
        </div>
        <div class="bucket_select">
            <div class="select_all">
                <input type="checkbox" name="check_all">
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
        <div class="bucket_info">
            <div style="width: 3%;">
               <input type="checkbox" name="check_sol">
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
            </div>
            <div style=" width: 17%; height: 140px; text-align: center; border-right: solid rgb(230, 230, 230) 1px;">
                <span style=" line-height: 140px; font-size: 20px; font-weight: bold;">13,000원</span>
            </div>
            <div style="width: 3%; margin-left: 15px;">
                <button>
                    <img src="../resources/images/icon/cancle.png" style="height: 15px; width: 14px;">
                </button>
            </div>
        </div>
        <div class="bucket_result">
            <div style="text-align: center; font-weight: bold; font-size: 25px; margin-top: 15px;">총 결제 금액</div>
            <div style="text-align: center; color: red; font-size: 30px; font-weight: bold;">13,000원</div>
        </div>
        <div class="bucket_buy">
            <button>
                <img src="../resources/images/icon/buy.png" style="height: 150px; width: 150px;">
            </button>
        </div>
    </div>
</body>
    <script>
        document.querySelector("input[name=check_all]").addEventListener("change", function (e) {
            e.preventDefault();
            var list = document.querySelectorAll("input[name=check_sol]");
            for (var i = 0; i < list.length; i++) {
                list[i].checked = this.checked;
            }
        });
    </script>
</html>