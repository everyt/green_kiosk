<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 시스템</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
</head>
<body>
  <div class="header"><span style='margin-left: 2vw;'>원하시는 결제 방법을 선택해 주세요.</span></div>
  <div class="payment-options">
    <div class="payment-option select">
      <img src="../../assets/svg/phone.svg" alt="phone" width='80' />모바일 카드</div>
    <div class="payment-option">
      <img src="../../assets/svg/samsung-pay.svg" alt="Samsung Pay" width='80' />
    </div>
    <div class="payment-option">
      <img src="../../assets/svg/apple-pay.png" alt="Apple Pay" width='100' />
    </div>
    <div class="payment-option" style='border-right-width: 2px;'>
    </div>
  </div>
  <div class="payment-options">
    <div class="payment-option select" style='border-bottom-width: 2px; border-radius: 0 0 0 30px;'>
      <img src="../../assets/svg/barcode.svg" alt="barcode" width='80' />바코드 스캔</div>
    <div class="payment-option" style='border-bottom-width: 2px;'>
      <img src="../../assets/svg/kakao-pay.svg" alt="Kakao Pay" width='100' />
    </div>
    <div class="payment-option" style='border-bottom-width: 2px;'>
      <img src="../../assets/svg/naver-pay.svg" alt="Naver Pay" width='100' />
    </div>
    <div class="payment-option" style='border-right-width: 2px; border-bottom-width: 2px; border-radius: 0 0 30px 0;'>
      <img src="../../assets/svg/l-pay.svg" alt="L Pay" width='100' />
    </div>
  </div>
  <div class="payment-cancle">취소</div>
</body>
</html>