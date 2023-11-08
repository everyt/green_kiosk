<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 시스템</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
</head>
<body>
  <div class="header"><span style='margin-left: 2vw;'>할인 쿠폰</span></div>
  <div class="payment-card" style='border-left-width: 2px; border-right-width: 2px; border-bottom-width: 2px;'>
  	<img src="../../assets/svg/coupon.svg" alt="coupon" width='100' style='margin-bottom: 5px;' />
  	<form name="couponForm" method="post" action="./process/process-coupon.jsp">
  	  <input type="text" id='couponCode' name='couponCode' size="20" style='margin-bottom: 12px;'></input>
  	</form>
  	<div id="couponText">할인 쿠폰 코드를 입력해 주세요.</div>
  </div>
  <div class="rowbox">
    <div class="payment-cancle" onClick="handleCouponForm()">확인</div>
    <div class="payment-cancle">취소</div>
  </div>
  <script>
  	const couponRegex = /^[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}$/;
  	const handleCouponForm = () => {
  		const couponCode = document.couponForm.couponCode.value;
  		if (!couponRegex.test(couponCode)) {
  			const couponTextElement = document.getElementById('couponText');
  			couponTextElement.innerHTML = '<span style="color: red;">올바르지 않은 쿠폰 코드입니다.</span>';
  			setTimeout(() => {
  				couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
  			}, 2000);
  			return;
  		} else {
  			document.couponForm.submit();
  		}
  	}
  </script>
</body>
</html>