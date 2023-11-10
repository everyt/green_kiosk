/**
 * @param i number
 * @return 000,000,000
 */
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

/**
 * @param href 이동할 링크
 * location.href = href;
 */
const hrefTo = (href) => {
  location.href = href;
}

/**
 * @param str = Image DOM id, SVG file name
 * sessionStorage.setItem(str, true|false);
 * document.getElementById(str).src = '../../assets/svg/' + str + '.svg' | '../../assets/svg/check.svg'
 */
const changeIcon = (str) => {
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

/**
 * @param who name
 * handleClick by icon
 */
const handleClick = (who) => {
  changeIcon(who);
    
  if (who === 'coupon' || who === 'smile') {
    hrefTo(who + '.jsp');
  }
}

/**
 * @param arr basketArray
 * @param page basketPageCount
 * @return basketHTML
 */
const generateBasketArrayHTML = (arr, length) => {
  let basketHTML = '';

  const max = 10 * Math.floor(length / 10); // 1페이지부터 시작

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
  
  return basketHTML;
};

/**
 * @param length basketArray.length
 * @return basketPageButtonHTML;
 */
const getnerateBasketPageButtonHTML = (length) => {
  let basketPageButtonHTML = '';
  
  const pages = Math.ceil(length / 10);

  for (let i = 1; i <= pages; i++) {
    basketPageButtonHTML +=
      `<div class='purchase-page-button-main' onClick='generateBasketArrayHTML(` + i + `)'>` + i + `</div>`;
  }
  
  return basketPageButtonHTML;
};

/**
 * @param arr1 couponArray
 * @param arr2 basketArray
 * @return arr2;
 */
const acceptCoupon = (arr1, arr2) => {
  if (arr1 !== []) {
    arr1.forEach(v1 => {
      arr2.forEach(v2 => {
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
  return arr2;
}


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

const basketElement = document.getElementById('basketDOM');
basketElement.innerHTML = generateBasketArrayHTML(basketArray, basketLength);

const basketPageButtonElement = document.getElementById('basketPageButtonDOM');
basketPageButtonElement.innerHTML = getnerateBasketPageButtonHTML(basketLength);

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

basketArray = acceptCoupon(couponArray, basketArray);

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