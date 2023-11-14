interface ErrorConstructor {
  captureStackTrace(error: Object, constructor?: Function): void;
}

type food = {
  index: number;
  name: string;
  price: number;
  amount: number;
  discount?: number;
};

type coupon = {
  code: string;
  name: string;
  menuNo: number;
  discount: number;
};

type mileage = {
  index: number;
  name: string;
  mileage: number;
  value: string;
  type: 'phoneNumber' | 'cardNumber' | 'x';
};

class PurchaseException extends Error {
  reason: string;
  constructor(reason: string) {
    super();
    this.name = 'PurchaseException';
    this.reason = reason;
    if (Error.captureStackTrace) {
      // Chrome and NodeJS
      Error.captureStackTrace(this, PurchaseException);
    } else {
      // FF, IE 10+ and Safari 6+. Fallback for others
      this.stack = new Error().stack || '';
    }
  }
  toString() {
    return this.name + ': ' + this.reason;
  }
}

class State {
  time: Date;
  foods: food[];
  price: number;
  discount: number;
  coupon: coupon[];
  type: 'card' | 'mobile';
  use_mile: boolean;
  use_mile_amount: number;
  add_mile: boolean;
  add_mile_amount: number;
  is_maked: boolean;
  who: string;
  is_togo: boolean;

  constructor() {
    this.time = new Date();
    this.foods = null;
    this.price = 0;
    this.discount = 0;
    this.coupon = null;
    this.type = null;
    this.use_mile = false;
    this.use_mile_amount = 0;
    this.add_mile = false;
    this.add_mile_amount = 0;
    this.is_maked = false;
    this.who = null;
    this.is_togo = null;
  }

  toObject() {
    return {
      order_time: this.time,
      order_foods: this.foods,
      order_price: this.price,
      order_discount: this.discount,
      order_coupon: this.coupon,
      order_type: this.type,
      order_use_mile: this.use_mile,
      order_use_amount: this.use_mile_amount,
      order_add_mile: this.add_mile,
      order_add_amount: this.add_mile_amount,
      order_is_maked: this.is_maked,
      order_who: this.who,
      order_is_togo: this.is_togo,
    };
  }
}

class Item {
  store: Storage;
  constructor(storage: Storage) {
    this.store = storage;
  }
  get(str: string) {
    return this.store.getItem(str) === null ? null : this.store.getItem(str);
  }
  set(str: string, data: string) {
    this.store.setItem(str, data);
  }
}

const SVG_PATH = '../../assets/svg/';

const ARRAY_ICONS = ['bag', 'shop', 'coupon', 'smile', 'card', 'mobile'];
const ARRAY_HREF_ICONS = ['coupon', 'smile'];
const ARRAY_PAY_ICONS = ['card', 'mobile'];
const ARRAY_TOGO_ICONS = ['bag', 'shop'];

const PAIRS_ICONS = [
  ['bag', 'shop'],
  ['card', 'mobile'],
];

const formatSVGPath = (str: string) => {
  let svg = SVG_PATH + str + '.svg';
  return svg;
};

const inputDigits = (num: number) => {
  const str = num.toString();
  const length = str.length;
  let result = [];
  let j = 0;

  for (let k = length - 1; k >= 0; k--) {
    j++;
    result.push(str[k]);
    if (j % 3 === 0 && k !== 0) result.push(',');
  }

  return result.reverse().join('');
};

const drawArrayToHTMLElement = (element: HTMLElement, arr: any[], drawCallback: (arr: any[]) => string) => {
  if (arr == null) {
    element.innerHTML = 'null';
  } else {
    let html = drawCallback(arr);

    element.innerHTML = html;
  }
};

const deleteBasketItem = (page: number, index: number) => {
  state.foods.splice(index, 1);
  item.set('basketArray', JSON.stringify(state.foods));
  generateBasketPageHTML(state.foods, page);
};

const generateBasketPageHTML = (arr: any[], page: number = 0) => {
  let html: string = '';
  const divCountValue = 10 * page;

  for (let i = 0 + divCountValue; i < 10 + divCountValue; i++) {
    html += `<div class='basket'>`;
    html += `<span style='width: 100px;'>` + (i < arr.length ? arr[i].name : '&nbsp;') + `</span>`;
    html += `<span style='width: 40px;'>` + (i < arr.length ? arr[i].amount : '&nbsp;') + `</span>`;
    html += `<span style='width: 70px;'>` + (i < arr.length ? inputDigits(arr[i].price) : '&nbsp;') + `</span>`;
    if (i < arr.length) {
      html +=
        `<div 'width: 20px;' onClick='deleteBasketItem(` +
        page +
        ',' +
        i +
        `)'><div class='rowbox delete-button'><p class='delete-text'>x</p></div></div>`;
    }
    html += `</div>`;
  }

  return html;
};

const generateBasketPageButtonHTML = (arr: any[]) => {
  let html: string = '';

  const pages = Math.ceil(arr.length / 10);

  for (let i = 1; i <= pages; i++) {
    html +=
      `<div class='purchase-page-button-main'` +
      `onClick='generateBasketPageHTML(state.foods, ` +
      i +
      `)'>` +
      i +
      `</div>`;
  }

  return html;
};

const drawPriceToHTMLElement = (str: string, text: string, value: number) => {
  document.querySelector(str).innerHTML =
    '<div class="flex-between">' +
    '<span class="price-name">' +
    text +
    ': </span>' +
    '<span class="price-value">' +
    inputDigits(value) +
    '</span>' +
    '</div>';
};

const handleClickCancle = () => {
  location.href = ''; //TODO: 장바구니 url
};

const state = new State(); // 데이터를 저장해서 페이지를 벗어나기 전까지 DOM과 상호작용 하기 위해 페이지 스코프를 줍니다.
const item = new Item(sessionStorage);

(async () => {
  // 즉시 실행 함수 IIFE, 스코프 제한, 메모리 관리를 위해 사용됩니다.
  item.set(
    'basketArray',
    JSON.stringify([
      {
        index: 0,
        name: '치즈버거',
        price: 3000,
        amount: 5,
      },
    ]),
  );
  item.set(
    'couponArray',
    JSON.stringify([
      {
        code: '1234-1234-1234-1234',
        name: '홍길동',
        menuNo: 0,
        discount: 30,
      },
    ]),
  );
  if (item.get('basketArray')) {
    // 장바구니 데이터 관리
    state.foods = JSON.parse(item.get('basketArray')); // 장바구니 상태관리
    state.price = state.foods.reduce((acc, cur) => {
      // 누산기로 총 가격 계산, 머리터질거같아서 일일이 주석 달아줌
      return acc + cur.amount * cur.price;
    }, 0);

    drawArrayToHTMLElement(document.querySelector('#basketPageElement'), state.foods, generateBasketPageHTML);
    drawArrayToHTMLElement(
      // 미리 생성해놓은 위치의 HTMLElement들에게 html코드를 생성해서 주입
      document.querySelector('#basketPageButtonElement'),
      state.foods,
      generateBasketPageButtonHTML,
    );

    drawPriceToHTMLElement('#priceElement', '주문금액', state.price); // 가격 보여줌, 디스플레이
  } else {
    throw new PurchaseException('basketArray is null');
  }

  if (item.get('couponArray')) {
    // 쿠폰 데이터 관리
    const couponArray = await detailedFetch(
      // 쿠폰 데이터를 세션스토리지에서 couponArray라는 이름으로 꺼내오고
      '/green_kiosk/api/kiosk/purchase/couponArray', // JSON문자열화 시킨다음에 api서버로 POST 요청 후 응답을 couponArray에 삽입
      'POST', // 이제 다 다른 서블릿을 쓰니까 coupons 이런 ㅁㅁㄴ 안해도 되고 smile도 array일 필요 X
      // 국제표준을 지키는 모습을 보여주기 위해서 encodeURIcomponent 사용
      // 내부에서 encode 처리 해줘도 되는데 그러면 너무 관리가 빡셈 보기가 어려워
      encodeURIComponent(item.get('couponArray')),
    );
    state.coupon = couponArray;
  } else {
    // 쿠폰이 없으면 가라데이터를 넣어서 출력
    state.coupon = [
      {
        code: 'x',
        name: 'x',
        menuNo: 0,
        discount: 0,
      },
    ];
  }

  drawPriceToHTMLElement('#discountElement', '할인금액', state.discount);
  drawPriceToHTMLElement('#discountedPriceElement', '결제할금액', state.price - state.discount);

  state.coupon.forEach((couponValue) => {
    state.foods.forEach((foodValue) => {
      if (couponValue.menuNo === foodValue.index) {
        const sum = ((foodValue.price * foodValue.amount) / Math.floor(1000 / couponValue.discount)) * 10;
        if (
          (foodValue.hasOwnProperty('discount') && foodValue.discount < sum) ||
          !foodValue.hasOwnProperty('discount')
        ) {
          foodValue.discount = sum;
        }
      }
    });
  });

  state.discount = state.foods.reduce((arr, cur) => {
    if (cur.hasOwnProperty('discount')) {
      return arr + cur.discount;
    } else {
      return arr;
    }
  }, 0);

  if (item.get('mileage')) {
    const mileage = await detailedFetch(
      '/green_kiosk/api/kiosk/purchase/mileage',
      'POST',
      encodeURIComponent(JSON.stringify(item.get('mileage'))),
    );
    const mileAmount = Math.floor((state.price - state.discount) / 10);
    state.add_mile = true;
    state.add_mile_amount = mileAmount;
    state.use_mile = mileage.type === 'cardNumber' ? true : false;
    state.use_mile_amount = mileage.type === 'cardNumber' && mileAmount;
    state.who = mileage.index.toString();
    drawPriceToHTMLElement('#mileageElement', '적립마일리지', state.add_mile_amount);
  }

  ARRAY_ICONS.forEach((value) => {
    const element = document.querySelector('#' + value) as HTMLImageElement;
    element.src =
      item.get(value) === null
        ? formatSVGPath(value)
        : JSON.parse(item.get(value)) === false
        ? formatSVGPath(value)
        : formatSVGPath('check');
  });
})();

const swapIcon = (str: string) => {
  const element = document.querySelector('#' + str) as HTMLImageElement;
  let boolean = false;

  boolean = item.get(str) === null ? false : JSON.parse(item.get(str)) === false ? false : true;

  boolean = !boolean;

  if (boolean) {
    for (let pair of PAIRS_ICONS) {
      if (str === pair[0] && JSON.parse(item.get(pair[1])) === true) {
        item.set(pair[1], JSON.stringify(false));
        const pairElement = document.querySelector('#' + pair[1]) as HTMLImageElement;
        pairElement.src = formatSVGPath(pair[1]);
      } else if (str === pair[1] && JSON.parse(item.get(pair[0])) === true) {
        item.set(pair[0], JSON.stringify(false));
        const pairElement = document.querySelector('#' + pair[0]) as HTMLImageElement;
        pairElement.src = formatSVGPath(pair[0]);
      }
    }
  }

  element.src = boolean ? formatSVGPath('check') : formatSVGPath(str);
  item.set(str, JSON.stringify(boolean));
};

const handleClickIcon = (str: string) => {
  swapIcon(str);

  for (let icon of ARRAY_HREF_ICONS) if (str === icon) location.href = icon + '.jsp';
};

const allOpionSelected = () => {
  for (let pair of PAIRS_ICONS) {
    if (!item.get(pair[0]) && !item.get(pair[1])) {
      return false;
    }
  }
  return true;
};

const changeLoreForOptionNotSelected = () => {
  for (let i = 1; i <= PAIRS_ICONS.length; i++) {
    if (!item.get(PAIRS_ICONS[i][0]) || !item.get(PAIRS_ICONS[i][1])) {
      const element = document.querySelector('#icon-' + i.toString());
      const originValue = element.innerHTML;
      element.innerHTML = '<span style="color: red;">둘 중 하나를 선택해 주세요.</span>';
      setTimeout(() => {
        element.innerHTML = originValue;
      }, 2500);
    }
  }
};

const handleClickOk = async () => {
  if (allOpionSelected()) {
    if (item.get(ARRAY_PAY_ICONS[0]) || item.get(ARRAY_PAY_ICONS[1])) {
      state.type =
        item.get(ARRAY_PAY_ICONS[0]) && JSON.parse(item.get(ARRAY_PAY_ICONS[0]))
          ? (ARRAY_PAY_ICONS[0] as 'card')
          : (ARRAY_PAY_ICONS[1] as 'mobile');
    } else {
      throw new PurchaseException('Unexpected error: item.get(icon) has null');
    }
    if (item.get(ARRAY_TOGO_ICONS[0]) || item.get(ARRAY_TOGO_ICONS[1])) {
      state.is_togo = item.get(ARRAY_TOGO_ICONS[0]) && JSON.parse(item.get(ARRAY_TOGO_ICONS[0])) ? false : true;
    } else {
      throw new PurchaseException('Unexpected error: item.get(icon) has null');
    }
    const orderObject = state.toObject();
    item.set('order', JSON.stringify(orderObject));
    location.href = state.type + '.jsp';
  } else {
    changeLoreForOptionNotSelected();
  }
};
