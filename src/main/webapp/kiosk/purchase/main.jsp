<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>

<jsp:useBean id="Coupon_Mgr" class="coupon.Coupon_Mgr"/>

<%
	String couponIsCorrect = request.getParameter("couponIsCorrect");
	
	if (couponIsCorrect == "true" && (couponIsCorrect == null || couponIsCorrect.isEmpty())) {
	  Cookie[] cookies = request.getCookies();
	  String coupons = "";
    
    for(int i = 0; i < cookies.length; i++){
      if (cookies[i].getName().equals("coupons")) {
        coupons = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
      }
    }
    Cookie cookie = new Cookie("coupons", "");
    cookie.setHttpOnly(false);
    cookie.setMaxAge(0); // 쿠키의 유효기간을 만료시킴
    cookie.setSecure(true);
    cookie.setPath("/");
    response.addCookie(cookie);
    
    List<Map<String, String>> m_coupon = new ArrayList<Map<String, String>>();
    Gson gson = new Gson();
    
    if (!coupons.isBlank()) {
      m_coupon = gson
          .fromJson(coupons, new TypeToken<ArrayList<Map<String, String>>>(){}
          .getType());
    }
    coupons = "";
    
    for(Map<String, String> coupon : m_coupon) {
      if (Coupon_Mgr.checkCouponCode(coupon.get("code")) > 0) {
        coupons += gson.toJson(coupon) + ",";
      }
    }
    if (!coupons.isBlank()) {
      coupons = coupons.substring(0, coupons.length() - 1);
      cookie = new Cookie("coupons", "[" + URLEncoder.encode(coupons, "UTF-8") + "]");
      cookie.setHttpOnly(false);
      cookie.setMaxAge(-1);
      cookie.setSecure(true);
      cookie.setPath("/");
      response.addCookie(cookie);
    }
	}
%>

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
          <div class="payment-option small-font bottom-border" onClick="handleClick('bag')" style="cursor: pointer;">
            <img id="bag" src="../../assets/svg/bag.svg" alt="bag" width="70" />
            <span>포장</span><span>(1회용기 제공)</span>
          </div>
          <div class="payment-option small-font right-bottom-border" onClick="handleClick('shop')" style="cursor: pointer;">
            <img id="shop" src="../../assets/svg/shop.svg" alt="shop" width="70" />
            <span>매장</span><span>(다회용기 제공)</span>
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 2.</span>
          <span style="margin-left: 2vw">할인/적립</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font bottom-border" onClick="handleClick('coupon')" style="cursor: pointer;">
            <img id="coupon" src="../../assets/svg/coupon.svg" alt="coupon" width="80" />
            할인쿠폰 사용
          </div>
          <div class="payment-option small-font right-bottom-border" onClick="handleClick('smile')" style="cursor: pointer;">
            <img id="smile" src="../../assets/svg/smile.svg" alt="smile" width="80" />
            마일리지
          </div>
        </div>
        <div class="header" style="width: 244px; font-weight: 400; font-size: 1.2rem; border-radius: 0;">
          <span>STEP 3.</span>
          <span style="margin-left: 2vw">결제방법 선택</span>
        </div>
        <div class="rowbox">
          <div class="payment-option small-font bottom-border" onClick="handleClick('card')" style="cursor: pointer;">
            <img id="card" src="../../assets/svg/card.svg" alt="credit-card" width="80" />
            신용/체크카드
          </div>
          <div
            class="payment-option small-font right-bottom-border" onClick="handleClick('mobile')"
            style="cursor: pointer;">
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
    <script src="../../assets/js/kiosk/purchase/inputDigits.js"></script>
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
   	  if (JSON.parse(sessionStorage.getItem(v))) {
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
    	
      const selectOnlyOne = (se1, se2) => {
        if (str === se1) {
       	  const secondCheck = JSON.parse(sessionStorage.getItem(se2));
       	  if (secondCheck) {
       		  sessionStorage.setItem(se2, false);
         	  document.getElementById(se2).src = '../../assets/svg/' + se2 + '.svg';
       	    isChecked = false;
         	}
        }
      }
    	
      if (!(sessionStorage.getItem(str) === null)) {
        isChecked = JSON.parse(sessionStorage.getItem(str));
        selectOnlyOne('bag', 'shop');
        selectOnlyOne('shop', 'bag');
        selectOnlyOne('card', 'mobile');
        selectOnlyOne('mobile', 'card');
      }
      if (isChecked) {
      	isChecked = false;
    	  element.src = src;
      } else {
    	  isChecked = true;
    	  element.src = check;
      }
      sessionStorage.setItem(str, isChecked);
    }
      
    const handleClick = (who) => {
      changeIcon(who);
        
    	if (who === 'coupon' || who === 'smile') {
    		hrefTo(who + '.jsp');
    	}
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

    const generateBasketArrayHTML = (arr, page) => {
      let basketHTML = '';

      const max = 10 * (page - 1); // 1페이지부터 시작

      for (let i = 0 + max; i < 10 + max; i++) {
        basketHTML += `<div class='rowbox' style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
        if (i < basketLength) {
          basketHTML += `<span style='width: 120px;'>` + arr[i].name + `</span>`;
          basketHTML += `<span style='width: 40px;'>` + arr[i].count + `</span>`;
          basketHTML += `<span style='width: 80px;'>` + arr[i].price + `</span>`;
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

    generateBasketArrayHTML(basketArray, 1);

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

    if (JSON.parse(localStorage.getItem('couponArray')) === null) {
      // devMode; 개발이 끝나면 예외처리
      couponArray = [{
        name: '테스트',
        menuNo: 1,
        discount: 50,
      }];
    } else {
  	  couponArray = JSON.parse(localStorage.getItem('couponArray'));
    }
    
    const acceptCoupon = () => {
  	  if (couponArray !== []) {
  		  couponArray.forEach(v1 => {
  			  basketArray.forEach(v2 => {
  				  if (v1.menuNo === v2.index) {
  					  const discountValue = v2.price / Math.floor(1000 / v1.discount) * 10;
  					  if (v2.hasOwnProperty('discount')) {
  						  if (v2.discount < discountValue) {
  			          v2.discount = discountValue;
  						  }
  					  } else {
  			        v2.discount = discountValue;
  					  }
  				  }
  			  })
  		  })
  	  } else {
  		  console.log('적용될 쿠폰이 없습니다.');
  	  }
    }
    
    acceptCoupon();

    let discountedPrice = 0;
    
    basketArray.forEach(v => {
  	  if (v.hasOwnProperty('discount')) {
  		  discountedPrice += v.discount;
  	  }
    })
    
    let discountPrice = callPrice - discountedPrice;
    
    document.getElementById('discountedPrice').innerHTML = '<div class="flex-between"><span class="price-name">할인금액:</span><span class="price-value">' + inputDigits(discountedPrice) + '</span></div>';
    document.getElementById('discountPrice').innerHTML = '<div class="flex-between" style="background-color: #bb2649; color: white; font-weight: 500;"><span class="price-name">결제할금액:</span><span class="price-value">' + inputDigits(discountPrice) + '</span></div>';
    
    const handleClickPayButton = () => {
  	  let order = {};
    }
    </script>
  </body>
</html>
