class State {
  constructor(foods) {
    this.time = null;
    this.foods = foods;
    this.price = 0;
    this.discount = 0;
    this.coupon = null;
    this.type = null;
    this.use_mile = false;
    this.use_mile_amount = 0;
    this.add_mile = false;
    this.add_mile_amount = 0;
    this.who = null;
  }
}

const handleClick = (who) => {
  changeIcon(who);

  if (who === 'coupon' || who === 'smile') {
    hrefTo(who + '.jsp');
  }
};

const selectOnlyOne = (str, se1, se2) => {
  for (let i = 0; i < 2; i++) {
    if (i > 0) {
      const temp = se1;
      se1 = se2;
      se2 = temp;
    }
    if (str === se1) {
      const secondCheck = sessionStorage.getItem(se2);
      if (secondCheck === null || JSON.parse(secondCheck)) {
        sessionStorage.setItem(se2, false);
        document.getElementById(se2).src = formatSVGPath(se2);
        isChecked = false;
      }
    }
  }
};

const changeIcon = (str) => {
  const element = document.getElementById(str);
  let isChecked = false;

  isChecked = getSessionStorageItem(str, () => {
    sessionStorage.setItem(str, false);
    isChecked = false;
  });

  PAIRS_ICONS.forEach((v) => {
    selectOnlyOne(str, v[0], v[1]);
  });

  if (isChecked) {
    element.src = formatSVGPath(str);
  } else if (!isChecked) {
    element.src = formatSVGPath('check');
  }

  isChecked = !isChecked;

  sessionStorage.setItem(str, isChecked);
};

const getnerateBasketPageButtonHTML = (length) => {
  let basketPageButtonHTML = '';

  const pages = Math.ceil(length / 10);

  for (let i = 1; i <= pages; i++) {
    basketPageButtonHTML +=
      `<div class='purchase-page-button-main'` + `onClick='generateBasketArrayHTML(` + i + `)'>` + i + `</div>`;
  }

  return basketPageButtonHTML;
};

const acceptCoupon = (arr1, arr2) => {
  if (arr1 !== []) {
    arr1.forEach((v1) => {
      arr2.forEach((v2) => {
        if (v1.menuNo === v2.index) {
          const discountValue = ((v2.price * v2.count) / Math.floor(1000 / v1.discount)) * 10;
          if (v2.hasOwnProperty('discount')) {
            if (v2.discount < discountValue) {
              v2.discount = discountValue;
            }
          } else {
            v2.discount = discountValue;
          }
        }
      });
    });
  }
  return arr2;
};

const handleClickPayButton = () => {
  let order = new Order(callPrice, discountedPrice, getOptionItem('card', 'mobile'));

  order.setCoupon(
    couponArray.map((v) => ({
      name: v.name,
    })),
  );

  order.setFoods(
    basketArray.map((v) => ({
      name: v.name,
      amount: v.count,
      price: v.price,
    })),
  );

  const smile = JSON.parse(decodeURIComponent(getCookie('smile')))[0];

  let add_mile = false;
  let add_mile_amount = 0;
  let use_mile = false;
  let use_mile_amount = 0;

  if (smile.type === 'phoneNumber' || smile.type === 'userID') {
    add_mile = true;
    add_mile_amount = Math.floor(discountPrice / 20);
  }
  if (smile.type === 'userID') {
    use_mile = true;
    use_mile_amount = Math.floor(discountPrice / 20);
  }

  order.smile(add_mile, add_mile_amount, use_mile, use_mile_amount);

  sessionStorage.setItem('order', encodeURIComponent(JSON.stringify(order.toObject())));

  if (getOptionItem('bag', 'shop') === 'null' || order.type === 'null') {
    location.href = 'main.jsp';
  } else if (order.type === 'card') {
    location.href = 'card.jsp';
  } else if (order.type === 'mobile') {
    location.href = 'mobile.jsp';
  } else {
    location.href = 'error.jsp';
  }
};

const getOptionItem = (op1, op2) => {
  const v_op1 = getSessionStorageItem(op1);
  const v_op2 = getSessionStorageItem(op2);

  if (v_op1 === null && v_op2 === null) {
    return 'null';
  } else if (v_op1 === null || v_op1 === false) {
    return op1;
  } else if (v_op2 === null || v_op2 === false) {
    return op2;
  } else {
    return 'error';
  }
};

const generateBasketHTML = (arr) => {
  let basketHTML = '';

  const max = 10 * Math.floor(arr.length / 10); // 1페이지부터 시작

  for (let i = 0 + max; i < 10 + max; i++) {
    basketHTML +=
      `<div class='rowbox'` +
      `style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
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

(() => {
  if (getSessionStorageArray('basketArray') !== null) {
    drawArrayToDOM(getHTMLElement('#basketDOM'), getSessionStorageArray('basketArray'), generateBasketHTML);
  } else {
    throw new PurchaseException('basketArray is null');
  }

  if (getSessionStorageItem('coupons') !== null) {
  }

  axios
    .post('/api/kiosk/purchase/coupons', JSON.parse())
    .then((res) => {
      console.log(res);
    })
    .catch((error) => {
      console.log(error);
    });

  if (getSessionStorageItem('order') !== null) {
    if (getOptionValue('bag', 'shop') === 'null') {
      getHTMLElement('#1').innerHTML = '<span style="color: red;">포장 여부를 선택해주세요.</span>';
      setTimeout(() => {
        getHTMLElement('#1').innerHTML = '포장 선택';
      }, 2500);
    }
    if (getOptionValue('card', 'mobile') === 'null') {
      getHTMLElement('#1').innerHTML = '<span style="color: red;">결제 방법을 선택해주세요.</span>';
      setTimeout(() => {
        getHTMLElement('#1').innerHTML = '결제방법 선택';
      }, 2500);
    }
  }

  const basketArray = getSessionStorageArray('basketArray');
  const couponArray = getSessionStorageArray('couponArray');

  const callPrice = basketArray.reduce((acc, cur) => {
    return acc + cur.count * cur.price;
  }, 0);

  const discountedPrice = acceptCoupon(couponArray, basketArray).reduce((arr, cur) => {
    if (cur.hasOwnProperty('discount')) {
      return arr + cur.discount;
    } else {
      return arr;
    }
  }, 0);

  const discountPrice = callPrice - discountedPrice;

  getHTMLElement('#basketDOM').innerHTML = generateBasketArrayHTML(basketArray, basketArray.length);
  getHTMLElement('#basketPageButtonDOM').innerHTML = getnerateBasketPageButtonHTML(basketArray.length);
  getHTMLElement('#callPrice').innerHTML =
    '<div class="flex-between"">' +
    '<span class="price-name">주문금액:</span>' +
    '<span class="price-value">' +
    inputDigits(callPrice) +
    '</span>' +
    '</div>';
  document.getElementById('discountedPrice').innerHTML =
    '<div class="flex-between">' +
    '<span class="price-name">할인금액:</span>' +
    '<span class="price-value">' +
    inputDigits(discountedPrice) +
    '</span>' +
    '</div>';
  document.getElementById('discountPrice').innerHTML =
    '<div class="flex-between" style="background-color: #bb2649; color: white; font-weight: 500;">' +
    '<span class="price-name">결제할금액:</span>' +
    '<span class="price-value">' +
    inputDigits(discountPrice) +
    '</span>' +
    '</div>';
})();
