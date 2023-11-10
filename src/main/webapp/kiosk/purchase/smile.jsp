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
<body style="overflow: hidden;">
  <div class="header"><span>마일리지 사용/적립</span></div>
  <div class="payment-card within-top-border" style='height: 460px;'>
  
    <img src="../../assets/svg/smile.svg" alt="coupon" width='100' style="margin-bottom: 5px;" />
    <span><span style="color: green; font-size: 1.05rem; font-weight: 700;">적립</span> 을 원하시면 <span style="color: green; font-size: 1.05rem; font-weight: 700;">'휴대폰 번호'</span> 입력</span>
    <span><span style="color: red; font-size: 1.05rem; font-weight: 700;">사용과 적립</span> 둘다 원하시면 <span style="color: red; font-size: 1.05rem; font-weight: 700;">'회원 ID'</span> 입력</span>
    <span id="couponText">&nbsp;</span>
  	<form name="smileForm" method="post" action="./process/process-smile.jsp">
  	  <input type="text"
  	   id='smilePhone'
  	   name='smilePhone'
  	   size="20"
  	   style='
  	    margin-bottom: 24px;
  	    font-size: 1.2rem;
  	    font-weight: 500;
  	    outline: none;
  	    border: solid #ddd;
  	    border-width: 0 0 2px 0;
  	   '
  	   placeholder='카드번호/휴대폰번호'
  	   readOnly
  	  ></input>
  	  <input type="hidden"
  	   id="smileType"
  	   name="smileType"
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
  <div class="rowbox">
    <div class="payment-ok" onClick="handleSmileForm()">확인</div>
    <div class="payment-cancle" onClick="back()">취소</div>
  </div>
  <script>
    const phoneNumberStartRegex = /^01(0|1|6|7|8|9)/
    const handleKeypad = (num) => {
    	const input = document.querySelector("#smilePhone");
    	const length = input.value.length;
      let temp = '';
    	if (phoneNumberStartRegex.test(input.value) && length < 13) {
        if ((length - 3) === 0) {
        	document.querySelector("#smileType").value = 'phoneNumber';
          temp += '-';
        } else if ((length - 8) === 0) {
        	temp += '-';
        }
    	  input.value += temp + num;
    	} else if (length < 3) {
        input.value += num + '';
    	} else if (!phoneNumberStartRegex.test(input.value) && length < 19) {
        document.querySelector("#smileType").value = 'userID';
        input.value += temp + num;
    	}
    }
    const clearKeypad = () => {
      const input = document.querySelector("#smilePhone");
      input.value = '';
    }
  	const back = () => {
  		sessionStorage.setItem('smile', false);
  	  location.href = 'main.jsp';
  	}
  	if (!<%=isFirstConnect%>) {
  		if (!<%=isCorrect%>) {
  			const smileTextElement = document.getElementById('smileText');
  			smileTextElement.innerHTML = '<span style="color: red;">등록되어 있지 않은 휴대폰 번호입니다.</span>';
  			setTimeout(() => {
  				smileTextElement.innerHTML = '&nbsp;';
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
  				smileTextElement.innerHTML = '&nbsp;';
  			}, 3000);
  			return;
  		} else {
  			document.smileForm.submit();
  		}
  	}
  </script>
</body>
</html>