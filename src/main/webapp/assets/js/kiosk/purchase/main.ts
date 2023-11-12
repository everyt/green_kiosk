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

type smile = {
  index: number;
  name: string;
  mileage: number;
  value: string;
  type: 'phoneNumber' | 'userID';
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
  who: number;

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
    this.who = null;
  }

  toObject() {
    return {
      time: this.time,
      foods: this.foods,
      price: this.price,
      discount: this.discount,
      coupon: this.coupon,
      type: this.type,
      use_mile: this.use_mile,
      use_mile_amount: this.use_mile_amount,
      add_mile: this.add_mile,
      add_mile_amount: this.add_mile_amount,
      who: this.who,
    };
  }
}

class Item {
  store: Storage;
  constructor(storage: Storage) {
    this.store = storage;
  }
  get(str: string) {
    return this.store.getItem(str) === null ? null : JSON.parse(this.store.getItem(str));
  }
  set(str: string, data: any) {
    this.store.setItem(str, JSON.stringify(data));
  }
}

const SVG_PATH = '../../assets/svg/';

const ARRAY_ICONS = ['bag', 'shop', 'coupon', 'smile', 'card', 'mobile'];
const ARRAY_HREF_ICONS = ['card', 'mobile'];

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

const fetchDetail = async (url: string, type: string, body: string) => {
  try {
    const response = await fetch(url, {
      method: type,
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: encodeURIComponent(body),
    });

    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);
    }

    const json = await response.json();

    return json;
  } catch (error) {
    // 네트워크 오류 및 JSON 파싱 오류에 대한 예외 처리
    console.error('Fetch error:', error);
    throw new PurchaseException('Failed to fetch data');
  }
};

const drawArrayToHTMLElement = (element: HTMLElement, arr: any[], drawCallback: (arr: any[]) => string) => {
  if (arr == null) {
    element.innerHTML = 'Null';
  }
  let html = drawCallback(arr);

  element.innerHTML = html;
};

const generateBasketPageButtonHTML = (arr: any[]) => {
  let html: string;

  const pages = Math.ceil(arr.length / 10);

  for (let i = 1; i <= pages; i++) {
    html +=
      `<div class='purchase-page-button-main'` +
      `onClick='GenerateBasketPageHTML(state.foods, ` +
      i +
      `)'>` +
      i +
      `</div>`;
  }

  return html;
};

const generateBasketPageHTML = (arr: any[], page: number = 0) => {
  let html: string;
  const divCountValue = 10 * page;

  for (let i = 0 + divCountValue; i < 10 + divCountValue; i++) {
    html += `<div class='basket'>`;
    html += `<span style='width: 120px;'>` + (i < arr.length ? arr[i].name : '&nbsp;') + `</span>`;
    html += `<span style='width: 40px;'>` + (i < arr.length ? arr[i].amount : '&nbsp;') + `</span>`;
    html += `<span style='width: 80px;'>` + (i < arr.length ? arr[i].price : '&nbsp;') + `</span>`;
    html += `</div>`;
  }

  return html;
};

const drawPriceToHTMLElement = (str: string, value: number) => {
  document.querySelector(str).innerHTML =
    '<div class="flex-between">' +
    '<span class="price-name">적립될 마일리지: </span>' +
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
  if (item.get('basketArray')) {
    state.foods = item.get('basketArray');
    state.price = state.foods.reduce((acc, cur) => {
      return acc + cur.amount * cur.price;
    }, 0);

    drawArrayToHTMLElement(document.querySelector('#basketPageElement'), state.foods, generateBasketPageHTML);
    drawArrayToHTMLElement(
      document.querySelector('#basketPageButtonElement'),
      state.foods,
      generateBasketPageButtonHTML,
    );

    drawPriceToHTMLElement('#priceElement', state.price);
  } else {
    throw new PurchaseException('basketArray is null');
  }

  if (item.get('couponArray')) {
    const couponArray = await fetchDetail('/api/kiosk/purchase/coupons', 'POST', item.get('couponArray'));
    state.coupon = couponArray;

    if (state.coupon) {
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

      drawPriceToHTMLElement('#discountElement', state.discount);
      drawPriceToHTMLElement('#discountedPriceElement', state.price - state.discount);
    } else {
      throw new PurchaseException('fetch failed: /api/kiosk/purchase/coupons');
    }
  }

  if (item.get('smileArray')) {
    const smileArray = await fetchDetail('/api/kiosk/purchase/mileage', 'POST', item.get('smileArray'));

    if (smileArray) {
      const mileAmount = Math.floor((state.price - state.discount) / 10);
      state.add_mile = true;
      state.add_mile_amount = mileAmount;
      state.use_mile = smileArray.type === 'userID' ? true : false;
      state.use_mile_amount = smileArray.type === 'userID' && mileAmount;
      state.who = smileArray.index;
      drawPriceToHTMLElement('#mileageElement', state.add_mile_amount);
    } else {
      throw new PurchaseException('fetch failed: /api/kiosk/purchase/mileage');
    }
  }

  ARRAY_ICONS.forEach((value) => {
    const element = document.querySelector('#' + value) as HTMLImageElement;
    element.src = item.get(value) ? formatSVGPath('check') : formatSVGPath(value);
  });

  //TODO: 즉시실행함수에서 필요한 기능은 모두 구현했고, 나머지는 클릭 가능한 아이콘과 결제 버튼에서 필요한 프로세스
})();

const swapIcon = (str: string) => {
  const element = document.querySelector('#' + str) as HTMLImageElement;
  let boolean = false;
  boolean = item.get(str) === null ? false : item.get(str);

  for (let pair of PAIRS_ICONS)
    if (boolean && ((str === pair[0] && item.get(pair[1])) || (str === pair[1] && item.get(pair[0])))) {
      item.set(str === pair[0] ? pair[1] : pair[0], false);
      const pairElement = document.querySelector('#' + str === pair[0] ? pair[1] : pair[0]) as HTMLImageElement;
      pairElement.src = formatSVGPath(str === pair[0] ? pair[1] : pair[0]);
    }

  element.src = boolean ? formatSVGPath(str) : formatSVGPath('check');
  item.set(str, boolean);
};

const handleClickIcon = (str: string) => {
  swapIcon(str);

  for (let icon of ARRAY_HREF_ICONS) location.href = str === icon && icon + '.jsp';
};

const allOpionSelected = () => {
  for (let icon of ARRAY_ICONS) {
    if (item.get(icon) === null) {
      return false;
    }
  }
  return true;
};

const changeLoreForOptionNotSelected = () => {
  for (let i = 1; i <= PAIRS_ICONS.length; i++) {
    if (item.get(PAIRS_ICONS[i][0]) === null || item.get(PAIRS_ICONS[i][1]) === null) {
      const element = document.querySelector('#' + i.toString());
      const originValue = element.innerHTML;
      element.innerHTML = '<span style="color: red;">둘 중 하나를 선택해 주세요.</span>';
      setTimeout(() => {
        element.innerHTML = originValue;
      }, 2500);
    }
  }
};

const handleClickOk = () => {
  if (allOpionSelected()) {
    if (item.get(ARRAY_HREF_ICONS[0]) || item.get(ARRAY_HREF_ICONS[1])) {
      state.type = item.get(ARRAY_HREF_ICONS[0]) ? item.get(ARRAY_HREF_ICONS[0]) : item.get(ARRAY_HREF_ICONS[1]);
    } else {
      throw new PurchaseException('Unexpected error: item.get(icon) has null');
    }
    const orderObject = state.toObject();
    fetchDetail('/api/kiosk/purchase/order', 'POST', JSON.stringify(orderObject));
  } else {
    changeLoreForOptionNotSelected();
  }
};
