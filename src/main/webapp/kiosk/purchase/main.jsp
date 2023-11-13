<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>결제 시스템</title>
    <link rel="stylesheet" href="../../assets/css/purchase.css" />
  </head>
  <body style="overflow: hidden">
    <div class="rowbox">
      <div class="colbox">
        <div class="rowbox" style="background-color: #eee; border: 2px solid #ddd; align-self: center; padding: 3px 0">
          <span style="width: 120px">제품</span>
          <span style="width: 40px">수량</span>
          <span style="width: 80px">금액</span>
        </div>
        <!-- 여기서 메뉴 리스트 JS로 표시, 정해진 줄 길이, 넘어가면 페이지로,  -->
        <div id="basketPageElement"></div>
        <!-- 로컬 스토리지 끝 -->
        <div class="rowbox" style="justify-content: space-between; width: 240px">
          <div class="purchase-page-button-left"></div>
          <div id="basketPageButtonElement"></div>
          <div class="purchase-page-button-right"></div>
        </div>
        <div id="priceElement" style="width: 240px"></div>
        <div id="discountElement" style="width: 240px"></div>
        <div id="discountedPriceElement" style="width: 240px"></div>
        <div id="mileageElement" style="width: 240px"></div>
      </div>
      <div class="colbox">
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0">
          <span>STEP 1.</span>
          <span id="icon-1" style="margin-left: 2vw">포장 선택</span>
        </div>
        <div class="rowbox">
          <div
            class="payment-option small-font right-bottom-border"
            onClick="handleClickIcon('bag')"
            style="cursor: pointer">
            <img id="bag" src="../../assets/svg/bag.svg" alt="bag" width="70" />
            <span>포장</span><span>(1회용기 제공)</span>
          </div>
          <div
            class="payment-option small-font right-bottom-border"
            onClick="handleClickIcon('shop')"
            style="cursor: pointer">
            <img id="shop" src="../../assets/svg/shop.svg" alt="shop" width="70" />
            <span>매장</span><span>(다회용기 제공)</span>
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0">
          <span>STEP 2.</span>
          <span style="margin-left: 2vw">할인/적립</span>
        </div>
        <div class="rowbox">
          <div
            class="payment-option small-font bottom-border"
            onClick="handleClickIcon('coupon')"
            style="cursor: pointer">
            <img id="coupon" src="../../assets/svg/coupon.svg" alt="coupon" width="80" />
            할인쿠폰 사용
          </div>
          <div
            class="payment-option small-font right-bottom-border"
            onClick="handleClickIcon('smile')"
            style="cursor: pointer">
            <img id="smile" src="../../assets/svg/smile.svg" alt="smile" width="80" />
            마일리지
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0">
          <span>STEP 3.</span>
          <span id="icon-2" style="margin-left: 2vw">결제방법 선택</span>
        </div>
        <div class="rowbox">
          <div
            class="payment-option small-font bottom-border"
            onClick="handleClickIcon('card')"
            style="cursor: pointer">
            <img id="card" src="../../assets/svg/card.svg" alt="credit-card" width="80" />
            신용/체크카드
          </div>
          <div
            class="payment-option small-font right-bottom-border"
            onClick="handleClickIcon('mobile')"
            style="cursor: pointer">
            <img id="mobile" src="../../assets/svg/mobile.svg" alt="phone" width="80" />
            모바일/바코드
          </div>
        </div>
        <div class="rowbox">
          <div class="payment-ok" onClick="handleClickOk()">결제</div>
          <div class="payment-cancle" onClick="handleClickCancleButton()">취소</div>
        </div>
      </div>
    </div>
    <script src="../../assets/js/kiosk/purchase/detailedFetch.js"></script>
    <script src="../../assets/js/kiosk/purchase/main.js"></script>
  </body>
</html>
