<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String isCorrect = request.getParameter("isCorrect");
	boolean isFirstConnect = false;
	if (isCorrect == null || isCorrect.isEmpty()) {
		isFirstConnect = true;
	}	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마일리지 사용/적립</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
</head>
<body>
  <div class="header"><span>마일리지 사용/적립</span></div>
  <div class="payment-card" style='border-left-width: 2px; border-right-width: 2px; border-bottom-width: 2px;'>
  	<img src="../../assets/svg/smile.svg" alt="coupon" width='100' style='margin-bottom: 5px;' />
  	<form name="smileForm" method="post" action="./process/process-coupon.jsp">
  	  <input type="text" id='smilePhone' name='couponCode' size="20" style='margin-bottom: 12px;'></input>
  	</form>
  	<div id="couponText">회원 휴대폰 번호를 입력해 주세요.</div>
  </div>
  <div class="rowbox">
    <div class="payment-cancle" onClick="handleCouponForm()">확인</div>
    <div class="payment-cancle" onClick="back()">취소</div>
  </div>
  <script>
  	const back = () => {
   	  localStorage.setItem('coupon', false);
  	  location.href = 'main.jsp';
  	}
  	if (!<%=isFirstConnect%>) {
  		if (<%=isCorrect%>) {
  			location.href = 'main.jsp';
  		} else {
  			const couponTextElement = document.getElementById('couponText');
  			let text = '';
  			couponTextElement.innerHTML = '<span style="color: red;">유효한 쿠폰이 아니거나 사용할 수 있는 기간이 아닙니다.</span>';
  			setTimeout(() => {
  				couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
  			}, 3000);
  		}
  	}
  	const couponRegex = /^[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}$/;
  	const handleCouponForm = () => {
  		const couponCode = document.couponForm.couponCode.value;
  		if (!couponRegex.test(couponCode)) {
  			const couponTextElement = document.getElementById('couponText');
  			couponTextElement.innerHTML = '<span style="color: red;">올바르지 않은 쿠폰 코드입니다.</span>';
  			setTimeout(() => {
  				couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
  			}, 3000);
  			return;
  		} else {
  			document.couponForm.submit();
  		}
  	}
  </script>
</body>
</html>