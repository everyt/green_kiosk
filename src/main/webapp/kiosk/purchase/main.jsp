<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>결제 시스템</title>
    <link rel="stylesheet" href="../../assets/css/purchase.css" />
    <script>
    	const hrefTo = (href) => {
    		location.href(href);
    	}
    </script>
  </head>
  <body>
    <div class="rowbox">
      <div class="colbox">
        <div class="rowbox" style="background-color: #eee; border: 2px solid #ddd; align-self: center; padding: 3px 0;">
          <span style="width: 120px">제품</span>
          <span style="width: 40px">수량</span>
          <span style="width: 80px">금액</span>
        </div>
        <!-- 여기서 메뉴 리스트 JS로 표시, 정해진 줄 길이, 넘어가면 페이지로,  -->
        <div id="basketDOM"></div>
        <!-- 로컬 스토리지 끝 -->
        <div class="rowbox" style="justify-content: space-between; width: 240px">
          <div class="purchase-page-button-left"></div>
          <div id="basketPageButtonDOM"></div>
          <div class="purchase-page-button-right"></div>
        </div>
        <div id="callPrice" style="width: 240px"></div>
        <div id="discountPrice" style="width: 240px"></div>
        <div id="payPrice" style="width: 240px"></div>
        <div id="paidPrice" style="width: 240px"></div>
      </div>
      <div class="colbox">
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 1.</span>
          <span style="margin-left: 2vw">포장 선택</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" style="border-bottom-width: 2px">
            <img src="../../assets/svg/bag.svg" alt="bag" width="70" />
            <span>포장</span><span>(1회용기 제공)</span>
          </div>
          <div class="payment-option small-font" style="border-right-width: 2px; border-bottom-width: 2px">
            <img src="../../assets/svg/shop.svg" alt="shop" width="70" />
            <span>매장</span><span>(다회용기 제공)</span>
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0">
          <span>STEP 2.</span>
          <span style="margin-left: 2vw">할인/적립</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" style="border-bottom-width: 2px" onClick="hrefTo('./discount.jsp')">
            <img src="../../assets/svg/coupon.svg" alt="coupon" width="80" />
            할인쿠폰 사용
          </div>
          <div class="payment-option small-font" style="border-right-width: 2px; border-bottom-width: 2px">
            <img src="../../assets/svg/smile.svg" alt="smile" width="80" />
            마일리지 적립
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0">
          <span>STEP 3.</span>
          <span style="margin-left: 2vw">결제방법 선택</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" style="border-bottom-width: 2px;">
            <img src="../../assets/svg/creditcard.svg" alt="credit-card" width="80" />
            신용/체크카드
          </div>
          <div
            class="payment-option small-font"
            style="border-right-width: 2px; border-bottom-width: 2px;">
            <img src="../../assets/svg/phone.svg" alt="phone" width="80" />
            모바일/바코드
          </div>
        </div>
        <div class="rowbox">
          <div class="payment-cancle">결제</div>
          <div class="payment-cancle">취소</div>
        </div>
      </div>
    </div>
    <script>
      // 키오스크 페이지에서 로컬 스토리지에 저장해서 쓸 장바구니 배열 구조입니다.
      // basketArray = [{
      //   index: number,
      //   name: '제품 이름',
      //   count: '갯수',
      //   price: '가격',
      // }]

      let basketArray = [];
      let basketLength = 0;

      if (JSON.parse(localStorage.getItem('basketArray')) === null) {
        // devMode;
        basketArray = [
          {
            index: 0,
            name: '테스트',
            count: 1,
            price: 5000,
          },
        ];
        basketLength = 1;
      } else {
        basketArray = JSON.parse(localStorage.getItem('basketArray'));
        basketLength = basketArray.length;
      }
      
      let callPrice = 0;
      basketArray.forEach(v => callPrice += v.price);

      document.getElementById('callPrice').innerHTML = '주문금액: ' + callPrice;

      const basketPages = Math.floor(basketLength / 10);

      const generateBasketArrayHTML = (page) => {
        let basketHTML = '';

        const max = 10 * (page - 1); // 1페이지부터 시작

        for (let i = 0 + max; i < 10 + max; i++) {
          basketHTML += `<div class='rowbox' style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
          if (i < basketLength) {
            basketHTML += `<span style='width: 120px;'>` + basketArray[0].name + `</span>`;
            basketHTML += `<span style='width: 40px;'>` + basketArray[0].count + `</span>`;
            basketHTML += `<span style='width: 80px;'>` + basketArray[0].price + `</span>`;
          } else {
            basketHTML += `<span style='width: 120px;'>&nbsp;</span>`;
            basketHTML += `<span style='width: 40px;'>&nbsp;</span>`;
            basketHTML += `<span style='width: 80px;'>&nbsp;</span>`;
          }
          basketHTML += `</div>`;
        }

        const basketElement = document.getElementById('basketDOM');

        basketElement.innerHTML = basketHTML;
      };

      generateBasketArrayHTML(1);

      const getnerateBasketPageButtonHTML = () => {
        let basketPageButtonHTML = '';

        for (let i = 1; i <= basketLength; i++) {
          basketPageButtonHTML +=
            `<div class='purchase-page-button-main' onClick='generateBasketArrayHTML(` + i + `)'>` + i + `</div>`;
        }

        const basketPageButtonElement = document.getElementById('basketPageButtonDOM');

        basketPageButtonElement.innerHTML = basketPageButtonHTML;
      };

      getnerateBasketPageButtonHTML();
      
      document.getElementById('discountPrice').innerHTML = '할인금액: 0';
      document.getElementById('payPrice').innerHTML = '결제할금액: 0';
      document.getElementById('paidPrice').innerHTML = '결제한금액: 0';
    </script>
  </body>
</html>
