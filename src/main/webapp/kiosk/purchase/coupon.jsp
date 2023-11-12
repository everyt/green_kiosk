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
<title>할인쿠폰 사용</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
</head>
<body style="overflow: hidden;">
  <div class="header"><span>할인쿠폰 사용</span></div>
  <div class="payment-card within-top-border" style='height: 500px;'>
    <img src="../../assets/svg/coupon.svg" alt="coupon" width='100' style='margin-bottom: 5px;' />
    <div class="rowbox">
	    <div id="couponDOM2" class="colbox" style="border: 2px solid #eee; padding: 10px; margin-right: 16px;">
	      <!-- 여기서 쿠폰 리스트 JS로 표시, 정해진 줄 길이, 넘어가면 페이지로,  -->
	      <span style="width: 120px; background-color: #eee; border: 2px solid #ddd; align-self: center; padding: 3px 0;">적용된 쿠폰</span>
	      <div id="couponDOM"></div>
	    </div>
	    <div class="colbox" style="border: 2px solid #eee; padding: 10px;">
		    <div id="couponText" style="margin-bottom: 16px;">할인 쿠폰 코드를 입력해 주세요.</div>
		    <form name="couponForm" method="post" action="./process/process-coupon.jsp">
		      <input type="text"
		       id='couponCode'
		       name='couponCode'
		       size="16"
		       style='
		        margin-bottom: 24px;
		        font-size: 1.2rem;
		        font-weight: 500;
		        outline: none;
		        border: solid #ddd;
		        border-width: 0 0 2px 0;
		       '
		       placeholder='쿠폰 번호'
		       readOnly
		      ></input>
		    </form>
		    <div class="rowbox">
		      <div class="numeric-keypad" onClick="handleKeypad(1)">1</div>
		       <div class="numeric-keypad" onClick="handleKeypad(2)">2</div>
		       <div class="numeric-keypad" onClick="handleKeypad(3)">3</div>
		    </div>
		    <div class="rowbox">
		      <div class="numeric-keypad" onClick="handleKeypad(4)">4</div>
		      <div class="numeric-keypad" onClick="handleKeypad(5)">5</div>
		      <div class="numeric-keypad" onClick="handleKeypad(6)">6</div>
		    </div>
		    <div class="rowbox">
		      <div class="numeric-keypad" onClick="handleKeypad(7)">7</div>
		      <div class="numeric-keypad" onClick="handleKeypad(8)">8</div>
		      <div class="numeric-keypad" onClick="handleKeypad(9)">9</div>
		    </div>
		    <div class="rowbox">
		      <div class="numeric-keypad" onClick="handleKeypad(0)">0</div>
		      <div class="numeric-keypad numeric-clear" onClick="clearInput('#couponCode')">Clear</div>
		    </div>
	    </div>
    </div>
  </div>
  <div class="rowbox">
    <div class="payment-ok" onClick="handleCouponForm()">확인</div>
    <div class="payment-cancle" onClick="backTo('coupon')">취소</div>
  </div>
  <script src="../../assets/js/kiosk/purchase/util.js"></script>
  <script src="../../assets/js/kiosk/purchase/coupon.js"></script>
  <script>
	  if (!<%=isFirstConnect%>) {
		  if (!<%=isCorrect%>) {
		    const couponTextElement = document.getElementById('couponText');
		    couponTextElement.innerHTML = '<span style="color: red;">현재 사용할 수 없는 쿠폰입니다.</span>';
		    setTimeout(() => {
		      couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
		    }, 3000);
		  }
		}
  </script>
</body>
</html>