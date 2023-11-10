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
<body>
  <div class="header"><span>할인쿠폰 사용</span></div>
  <div class="payment-card within-top-border" style='height: 500px;'>
    <img src="../../assets/svg/coupon.svg" alt="coupon" width='100' style='margin-bottom: 5px;' />
    <div class="rowbox">
	    <div class="colbox" style="border: 2px solid #eee; padding: 10px; margin-right: 16px;">
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
		       size="20"
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
		      <div class="numeric-keypad numeric-clear" onClick="clearKeypad()">Clear</div>
		    </div>
	    </div>
    </div>
  </div>
  <div class="rowbox">
    <div class="payment-cancle" onClick="handleCouponForm()">확인</div>
    <div class="payment-cancle" onClick="back()">취소</div>
  </div>
  <script src="../../assets/js/kiosk/purchase/getCookie.js"></script>
  <script>
    const handleKeypad = (num) => {
      const input = document.querySelector("#couponCode");
      const length = input.value.length;
      let temp = '';
      
      if (length < 19) {
        if ((length + 1) % 5 === 0) {
          temp = '-';
        }
    	  input.value += temp + num;
      }
    }
    const clearKeypad = () => {
      const input = document.querySelector("#couponCode");
      input.value = '';
    }
    const back = () => {
    	sessionStorage.setItem('coupon', false);
      location.href = 'main.jsp';
    }
    const generateCouponHTML = (arr, count) => {
      let couponHTML = '';
      
      if (arr === []) {
        couponHTML += `<div class='rowbox' style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
        couponHTML += `<span style='width: 120px;'>없음</span>`;
        couponHTML += `</div>`;
      } else {
        for (let i = 0; i < count; i++) {
          couponHTML += `<div class='rowbox' style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
          couponHTML += `<span style='width: 120px;'>` + arr[i].name + `</span>`;
          couponHTML += `</div>`;
        }
      }

      const couponElement = document.getElementById('couponDOM');

      couponElement.innerHTML = couponHTML;
    };
    
    let couponArray = [];

    if (getCookie('coupons') === undefined) {
      // devMode; 개발이 끝나면 예외처리
      couponArray = [{
        name: '테스트',
        menuNo: 1,
        discount: 50,
      }];
    } else {
      couponArray = JSON.parse(decodeURIComponent(getCookie('coupons')));
    }
    
    generateCouponHTML(couponArray, couponArray.length);
    
    if (!<%=isFirstConnect%>) {
      if (!<%=isCorrect%>) {
        const couponTextElement = document.getElementById('couponText');
        couponTextElement.innerHTML = '<span style="color: red;">현재 사용할 수 없는 쿠폰입니다.</span>';
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