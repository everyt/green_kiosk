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
  <div class="payment-card within-top-border">
  	<img src="../../assets/svg/smile.svg" alt="coupon" width='100' style='margin-bottom: 5px;' />
  	<form name="smileForm" method="post" action="./process/process-smile.jsp">
  	  <input type="text" id='smilePhone' name='smilePhone' size="20" style='margin-bottom: 12px;' readOnly></input>
  	</form>
  	<div class="colbox">
  	  <div class="rowbox">
  	    <div class="numeric-keypad">1</div>
        <div class="numeric-keypad">2</div>
        <div class="numeric-keypad">3</div>
  	  </div>
      <div class="rowbox">
        <div class="numeric-keypad">4</div>
        <div class="numeric-keypad">5</div>
        <div class="numeric-keypad">6</div>
      </div>
      <div class="rowbox">
        <div class="numeric-keypad">7</div>
        <div class="numeric-keypad">8</div>
        <div class="numeric-keypad">9</div>
      </div>
      <div class="rowbox">
        <div class="numeric-keypad">0</div>
        <div class="numeric-keypad numeric-clear">Clear</div>
      </div>
  	</div>
  	<div id="couponText">회원님의 휴대폰 번호를 입력해 주세요.</div>
  </div>
  <div class="rowbox">
    <div class="payment-cancle" onClick="handleSmileForm()">확인</div>
    <div class="payment-cancle" onClick="back()">취소</div>
  </div>
  <script>
  	const back = () => {
  		sessionStorage.setItem('smile', false);
  	  location.href = 'main.jsp';
  	}
  	if (!<%=isFirstConnect%>) {
  		if (!<%=isCorrect%>) {
  			const smileTextElement = document.getElementById('smileText');
  			smileTextElement.innerHTML = '<span style="color: red;">등록되어 있지 않은 휴대폰 번호입니다.</span>';
  			setTimeout(() => {
  				smileTextElement.innerHTML = '회원님의 휴대폰 번호를 입력해 주세요.';
  			}, 3000);
  		}
  	}
  	const smileRegex = /^01([1|||6|7|8|9])-\d{3,4}-\d{4}$/;
  	const handleSmileForm = () => {
  		const smileCode = document.smileForm.smileCode.value;
  		if (!smileRegex.test(smileCode)) {
  			const smileTextElement = document.getElementById('smileText');
  			smileTextElement.innerHTML = '<span style="color: red;">올바르지 않은 휴대폰 번호입니다.</span>';
  			setTimeout(() => {
  				smileTextElement.innerHTML = '회원님의 휴대폰 번호를 입력해 주세요.';
  			}, 3000);
  			return;
  		} else {
  			document.smileForm.submit();
  		}
  	}
  </script>
</body>
</html>