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
  name: string;
  mileage: number;
  value: string;
  type: 'phoneNumber' | 'userID';
};

const SVG_PATH = '../../assets/svg/';

const ARRAY_ICONS = ['bag', 'shop', 'coupon', 'smile', 'card', 'mobile'];

const PAIRS_ICONS = [
  ['bag', 'shop'],
  ['card', 'mobile'],
];

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
  who: string;

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
    this.store.setItem(str, data);
  }
}

const formatSVGPath = (str: string) => {
  let svg = SVG_PATH + str + '.svg';
  return svg;
};

const fetchDetail = (url: string, type: string, body: string) => {
  return fetch(url, {
    method: type,
    mode: 'cors',
    cache: 'no-cache',
    credentials: 'same-origin',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    redirect: 'follow',
    referrerPolicy: 'no-referrer',
    body,
  });
};

const drawArrayToHTMLElement = (element: HTMLElement, arr: any[], drawCallback: (arr: any[]) => string) => {
  if (arr == null) {
    element.innerHTML = 'Null';
  }
  let html = drawCallback(arr);

  element.innerHTML = html;
};

const GenerateBasketPageButtonHTML = (arr: any[]) => {
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

const GenerateBasketPageHTML = (arr: any[], page: number = 0) => {
  let html: string;
  const divCountValue = 10 * page;

  for (let i = 0 + divCountValue; i < 10 + divCountValue; i++) {
    html += `<div class='basket'>`;
    html += `<span style='width: 120px;'>` + (i < arr.length ? arr[i].name : '&nbsp;') + `</span>`;
    html += `<span style='width: 40px;'>` + (i < arr.length ? arr[i].count : '&nbsp;') + `</span>`;
    html += `<span style='width: 80px;'>` + (i < arr.length ? arr[i].price : '&nbsp;') + `</span>`;
    html += `</div>`;
  }

  return html;
};

const handleClickCancle = () => {
  location.href = ''; //TODO: 장바구니 url
};

const state = new State(); // 데이터를 저장해서 페이지를 벗어나기 전까지 DOM과 상호작용 하기 위해 페이지 스코프를 줍니다.

(async () => {
  // 즉시 실행 함수 IIFE, 스코프 제한, 메모리 관리를 위해 사용됩니다.

  const item = new Item(sessionStorage);

  if (item.get('basketArray')) {
    state.foods = item.get('basketArray');
    state.price = state.foods.reduce((acc, cur) => {
      return acc + cur.amount * cur.price;
    }, 0);
    drawArrayToHTMLElement(document.querySelector('#basketPageElement'), state.foods, GenerateBasketPageHTML);
    drawArrayToHTMLElement(
      document.querySelector('#basketPageButtonElement'),
      state.foods,
      GenerateBasketPageButtonHTML,
    );
  } else {
    throw new PurchaseException('basketArray is null');
  }

  if (item.get('couponArray')) {
    let couponArray: coupon[];
    await fetchDetail(
      '/api/kiosk/purchase/coupons',
      'POST',
      encodeURIComponent(JSON.stringify(item.get('couponArray'))),
    )
      .then((res) => res.json())
      .then((json) => {
        couponArray = json;
      });
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
    } else {
      throw new PurchaseException('fetch failed: /api/kiosk/purchase/coupons');
    }
  }

  if (item.get('smileArray')) {
    let smileArray: smile;
    await fetchDetail('/api/kiosk/purchase/mileage', 'POST', encodeURIComponent(JSON.stringify(item.get('smileArray'))))
      .then((res) => res.json())
      .then((json) => {
        smileArray = json;
      });

    if (smileArray) {
      const mileAmount = Math.floor((state.price - state.discount) / 10);
      state.add_mile = true;
      state.add_mile_amount = mileAmount;
      state.use_mile = smileArray.type === 'userID' ? true : false;
      state.use_mile_amount = smileArray.type === 'userID' && mileAmount;
    } else {
      throw new PurchaseException('fetch failed: /api/kiosk/purchase/mileage');
    }
  }

  ARRAY_ICONS.forEach((value) => {
    const element = document.querySelector('#' + value) as HTMLImageElement;
    if (item.get(value)) {
      element.src = formatSVGPath('check');
    } else {
      element.src = formatSVGPath(value);
    }
  });

  //TODO: 즉시실행함수에서 필요한 기능은 모두 구현했고, 나머지는 클릭 가능한 아이콘과 결제 버튼에서 필요한 프로세스
})();
