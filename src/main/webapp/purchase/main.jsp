<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>결제 시스템</title>
    <link rel="stylesheet" href="../../assets/css/purchase.css" />
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
        <div id="discountedPrice" style="width: 240px"></div>
        <div id="discountPrice" style="width: 240px"></div>
      </div>
      <div class="colbox">
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 1.</span>
          <span style="margin-left: 2vw">포장 선택</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" onClick="handleClick('bag')" style="border-bottom-width: 2px; cursor: pointer;">
            <img id="bag" src="../../assets/svg/bag.svg" alt="bag" width="70" />
            <span>포장</span><span>(1회용기 제공)</span>
          </div>
          <div class="payment-option small-font" onClick="handleClick('shop')" style="border-right-width: 2px; border-bottom-width: 2px; cursor: pointer;">
            <img id="shop" src="../../assets/svg/shop.svg" alt="shop" width="70" />
            <span>매장</span><span>(다회용기 제공)</span>
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 2.</span>
          <span style="margin-left: 2vw">할인/적립</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" onClick="handleClick('coupon')" style="border-bottom-width: 2px; cursor: pointer;">
            <img id="coupon" src="../../assets/svg/coupon.svg" alt="coupon" width="80" />
            할인쿠폰 사용
          </div>
          <div class="payment-option small-font" onClick="handleClick('smile')" style="border-right-width: 2px; border-bottom-width: 2px; cursor: pointer;">
            <img id="smile" src="../../assets/svg/smile.svg" alt="smile" width="80" />
            마일리지
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 3.</span>
          <span style="margin-left: 2vw">결제방법 선택</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font" onClick="handleClick('card')" style="border-bottom-width: 2px; cursor: pointer;">
            <img id="card" src="../../assets/svg/card.svg" alt="credit-card" width="80" />
            신용/체크카드
          </div>
          <div
            class="payment-option small-font" onClick="handleClick('mobile')"
            style="border-right-width: 2px; border-bottom-width: 2px; cursor: pointer;">
            <img id="mobile" src="../../assets/svg/mobile.svg" alt="phone" width="80" />
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
      
   	  [
   		  'bag',
   		  'shop',
   		  'coupon',
   		  'smile',
   		  'card',
   		  'mobile',
   	  ].forEach(v => {
   	      const element = document.getElementById(v);
   		  if (JSON.parse(localStorage.getItem(v))) {
   	    		element.src = '../../assets/svg/check.svg';
   		  } else {
 	    		element.src = '../../assets/svg/' + v + '.svg';
   		  }
   	  })
      
	  const hrefTo = (href) => {
	    location.href = href;
	  }
      
      const changeIcon = (str, boolean) => {
    	const element = document.getElementById(str);
    	const src = '../../assets/svg/' + str + '.svg';
    	const check = '../../assets/svg/check.svg';
    	let isChecked = false;
    	
    	const selectOne = (se1, se2) => {
       	  if (str === se1) {
       		const doubleCheck = JSON.parse(localStorage.getItem(se2));
       		if (doubleCheck) {
       	      localStorage.setItem(se2, false);
         	  document.getElementById(se2).src = '../../assets/svg/' + se2 + '.svg';
       	      isChecked = false;
       		}
       	  }
    	}
    	
        if (!(localStorage.getItem(str) === null)) {
        	isChecked = JSON.parse(localStorage.getItem(str));
        	selectOne('bag', 'shop');
        	selectOne('shop', 'bag');
        	selectOne('card', 'mobile');
        	selectOne('mobile', 'card');
        }
    	if (isChecked) {
    		isChecked = false;
    		element.src = src;
    	} else {
    		isChecked = true;
    		element.src = check;
    	}
    	localStorage.setItem(str, isChecked);
      }
      
      const handleClick = (who) => {
        changeIcon(who);
        
    	if (who === 'coupon' || who === 'smile') {
    		hrefTo(who + '.jsp');
    	}
      }
	  const inputDigits = (i) => {
		const str = i.toString();
	   	const l = str.length;
	   	let result = '';
	   	let j = 0;
	   	
	   	for (let k = l - 1; k >= 0; k--) {
	   	  j++;
	   	  result += str[k];
	   	  if (j % 3 === 0) result += ',';
	   	}
	   		
	   	return result.split('').reverse().join('');
	  }

      let basketArray = [];
      let basketLength = 0;

      if (JSON.parse(localStorage.getItem('basketArray')) === null) {
        // devMode; 개발이 끝나면 예외처리
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
      
      let callPrice = 0;
      basketArray.forEach(v => callPrice += v.price);

      document.getElementById('callPrice').innerHTML = '<div class="flex-between""><span class="price-name">주문금액:</span><span class="price-value">' + inputDigits(callPrice) + '</span></div>';

      let couponArray = [];
      let discountedPrice = 0;
      let discountPrice = 0;

      if (JSON.parse(localStorage.getItem('couponArray')) === null) {
        // devMode; 개발이 끝나면 예외처리
        couponArray = {
          name: '테스트',
          menuNo: 1,
          discount: 50,
        };
        discountPrice = callPrice / Math.floor(1000 / couponArray.discount) * 10;
        discountedPrice = callPrice - discountPrice;
      } else {
        basketArray = JSON.parse(localStorage.getItem('couponArray'));
        discountPrice = callPrice / Math.floor(1000 / couponArray.discount) * 10;
        discountedPrice = callPrice - discountPrice;
      }
      
      document.getElementById('discountedPrice').innerHTML = '<div class="flex-between"><span class="price-name">할인금액:</span><span class="price-value">' + inputDigits(discountedPrice) + '</span></div>';
      document.getElementById('discountPrice').innerHTML = '<div class="flex-between" style="background-color: #bb2649; color: white; font-weight: 500;"><span class="price-name">결제할금액:</span><span class="price-value">' + inputDigits(discountPrice) + '</span></div>';
    </script>
  </body>
</html>
