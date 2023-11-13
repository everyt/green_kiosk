<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 시스템</title>
<link rel='stylesheet' href='../../assets/css/purchase.css' />
<link rel='stylesheet' href='../../assets/css/micromodal.css' />
<script src='https://unpkg.com/micromodal/dist/micromodal.min.js'></script>
</head>
<body style="overflow: hidden;">
  <div class="header"><span>원하시는 결제 방법을 선택해 주세요.</span></div>
  <div class="payment-options">
    <div class="payment-option select">
      <img src="../../assets/svg/mobile.svg" alt="phone" width='80' />모바일 카드</div>
    <div class="payment-option" onClick="hrefTo('samsung')">
      <img src="../../assets/svg/samsung-pay.svg" alt="Samsung Pay" width='80' />
    </div>
    <div class="payment-option" onClick="hrefTo('apple')">
      <img src="../../assets/svg/apple-pay.png" alt="Apple Pay" width='100' />
    </div>
    <div class="payment-option" style='border-right-width: 2px;'>
    </div>
  </div>
  <div class="payment-options">
    <div class="payment-option select" style='border-bottom-width: 2px; border-radius: 0 0 0 30px;'>
      <img src="../../assets/svg/barcode.svg" alt="barcode" width='80' />바코드 스캔</div>
    <div class="payment-option" style='border-bottom-width: 2px;' onClick="hrefTo('kakao')">
      <img src="../../assets/svg/kakao-pay.svg" alt="Kakao Pay" width='100' />
    </div>
    <div class="payment-option" style='border-bottom-width: 2px;' onClick="hrefTo('naver')">
      <img src="../../assets/svg/naver-pay.svg" alt="Naver Pay" width='100' />
    </div>
    <div class="payment-option" style='border-right-width: 2px; border-bottom-width: 2px; border-radius: 0 0 30px 0;' onClick="hrefTo('l')">
      <img src="../../assets/svg/l-pay.svg" alt="L Pay" width='100' />
    </div>
  </div>
  <div class="payment-cancle" onClick="back()">취소</div>
  
  <div class="modal micromodal-slide" id="modal-1" aria-hidden="true">
    <div class="modal__overlay" tabindex="-1" data-micromodal-close>
      <div class="modal__container" role="dialog" aria-modal="true" aria-labelledby="modal-1-title">
        <main class="modal__content" id="modal-1-content">
          <p>
            결제 처리중입니다. 잠시만 기다려주세요...
          </p>
        </main>
      </div>
    </div>
  </div>
  
  <script src="../../assets/js/kiosk/purchase/purchase.js"></script>
  <script src="../../assets/js/kiosk/purchase/detailedFetch.js"></script>
  <script>
    MicroModal.init();
    
  	const back = () => {
  		sessionStorage.setItem('mobile', false);
  	  location.href = 'main.jsp';
  	}
  	const hrefTo = (type) => {
   	  MicroModal.show('modal-1');
   	  setTimeout(() => {
          purchase(type);
   	  }, 2500)
    }
  </script>
</body>
</html>