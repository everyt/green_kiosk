<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 시스템</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
</head>
<body>
  <div class="header"><span>신용/체크카드</span></div>
  <div class="payment-card within-top-border" style='position: relative;'>
  	<div style='position: absolute; font-size: 0.6rem; top: 31vh;'>
  		<a href="https://www.freepik.com/free-vector/hand-holding-debit-credit-card-near-scanner-electronic-terminal-making-purchase-smart-transaction-via-digital-machine-flat-vector-illustration-contactless-payment-emv-commerce-concept_21683828.htm#query=credit%20card%20payment&position=1&from_view=keyword&track=ais">Image by pch.vector</a> on Freepik
  	</div>
  	<img src="../../assets/svg/creditcard-paying.svg" alt="phone" width='350' style='border: 1px solid #ddd;' />
  	카드를 기기에 인식시켜 주세요.
  </div>
  <div class="payment-cancle" onClick="back()">취소</div>
  <script>
  	const back = () => {
  		sessionStorage.setItem('card', false);
  	  location.href = 'main.jsp';
  	}
  </script>
</body>
</html>