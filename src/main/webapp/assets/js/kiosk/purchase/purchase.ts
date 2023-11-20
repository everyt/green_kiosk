class Recipie {
  no: number;
  is_togo: boolean;
  timestamp: Date;
  foods: food[];
  price: number;
  discount: number;
  tax: number;
  mileage: boolean;
  mileage_id: string;
  mileage_type: string;
  mileage_value: number;
  payment_type: string;
  barcode: number;
  waitCount: number;

  constructor(orderObject, mileage: mileage, pk: number) {
    this.no = 0;
    this.is_togo = orderObject.order_is_togo;
    this.timestamp = new Date();
    this.foods = orderObject.order_foods;
    this.price = orderObject.order_price;
    this.discount = orderObject.order_discount;
    this.tax = Math.floor((this.price * 10) / 110);

    if (orderObject.order_who !== null) {
      this.mileage = true;
    } else {
      this.mileage = false;
    }

    if (this.mileage) {
      this.mileage_id = mileage.value;
      this.mileage_type = mileage.type;
      this.mileage_value = mileage.mileage;
    }

    this.payment_type = orderObject.order_type;

    this.barcode = Math.floor(Math.random() * 10 ** 17);
    this.waitCount = pk;
  }
}

const handleClickCancleRecipie = () => {
  location.href = 'main.jsp';
};

const handleClickOkRecipie = (orderObject, element: HTMLElement, pk: number) => {
  const mileage = JSON.parse(sessionStorage.getItem('mileage'));

  const recipie = new Recipie(orderObject, mileage, pk);
  // element에 영수증 출력해서 보여주기
  let html = '';
  html += `<div class='colbox' style='width:400px'>`;

  html += `<span style='font-size: 0.8rem'>[ 무&nbsp;&nbsp;&nbsp;&nbsp;인 ]</span>`;
  html += `<span style='font-size: 1.2rem'>대기번호</span>`;
  html += `<span style='font-size: 1.2rem'>${recipie.waitCount}</span>`;
  html += `<span style='font-size: 1.2rem'>[&nbsp;${recipie.is_togo ? '매장 식사' : '포장 주문'}&nbsp;]</span>`;

  html += `<span>---------------------------------------------------------------------------</span>`;
  html += `<div class='rowbox' style='justify-content:space-between'>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>제품명</span>`;
  html += `<span>단가</span>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>수량</span>`;
  html += `<span>금액</span>`;
  html += `</div>`;
  html += `</div>`;
  html += `<span>---------------------------------------------------------------------------</span>`;

  for (let i = 0; i < recipie.foods.length; i++) {
    const food = recipie.foods[i] as any;
    html += `<div class='rowbox' style='justify-content:space-between'>`;
    html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
    html += `<span>${food.name}</span>`;
    html += `<span>${food.price}</span>`;
  html += `</div>`;
    html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
    html += `<span>${food.amount}</span>`;
    html += `<span>${food.price * food.amount}</span>`;
    html += `</div>`;
    html += `</div>`;
  }

  html += `<span>---------------------------------------------------------------------------</span>`;
  html += `<div class='rowbox' style='justify-content:space-between'>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>총 합 계</span>`;
  html += `<span>${recipie.price}</span>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>할   인</span>`;
  html += `<span>${recipie.discount}</span>`;
  html += `</div>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between'>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>과세금액</span>`;
  html += `<span>${recipie.price - recipie.tax}</span>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>부가세</span>`;
  html += `<span>${recipie.tax}</span>`;
  html += `</div>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between'>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>청구금액</span>`;
  html += `<span>${recipie.price - recipie.tax}</span>`;
  html += `</div>`;
  html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
  html += `<span>받 은 돈</span>`;
  html += `<span>${recipie.price}</span>`;
  html += `</div>`;
  html += `</div>`;
  html += `<span>---------------------------------------------------------------------------</span>`;
  if (recipie.mileage) {
    html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
    html += `<span>마일리지</span>`;
    html += `<span>${recipie.mileage_id}</span>`;
    html += `</div>`;
    html += `<div class='rowbox' style='justify-content:space-between;width:170px'>`;
    html += `<span>적립POINT</span>`;
    html += `<span>${Math.floor(recipie.price - recipie.discount) / 100}</span>`;
    html += `</div>`;
    html += `<span>---------------------------------------------------------------------------</span>`;
  }
  html += `<span>${recipie.payment_type}</span>`;
  html += `<span>---------------------------------------------------------------------------</span>`;
  html += `<div class="payment-cancle" onClick="handleClickCancleRecipie()">닫기</div>`

  html += `</div>`;

  element.innerHTML = html;
};

const purchase = async (type: string) => {

  const element = document.querySelector('.modal__message') as HTMLElement;
  const orderObject = JSON.parse(sessionStorage.getItem('order'));
  orderObject.order_type = type;
  const insertOrder = await detailedFetch(
    '/green_kiosk/api/kiosk/purchase/order',
    'POST',
    encodeURIComponent(JSON.stringify(orderObject)),
  );
  if (insertOrder.result) {
    const mile_type =
      orderObject.order_add_mile && orderObject.order_use_mile
        ? 'both'
        : orderObject.order_add_mile && !orderObject.order_use_mile
        ? 'add'
        : orderObject.order_use_mile && !orderObject.order_add_mile
        ? 'use'
        : 'none';
    if (orderObject.order_who !== null) {
      const mile_log = {
        mile_uid: orderObject.order_who,
        mile_type,
        mile_reason: 'order',
        mile_deff: orderObject.order_add_amount,
        mile_order_no: insertOrder.primaryKey,
        mile_timestamp: new Date(),
      };
      const insertMileage = await detailedFetch(
        '/green_kiosk/api/kiosk/milelogs',
        'POST',
        encodeURIComponent(JSON.stringify(mile_log)),
      );
      if (insertMileage.result) {
        element.innerHTML = `<div class="colbox"><span style='color: black; margin-bottom: 8px;'>영수증을 출력하시겠습니까?</span><div class="rowbox">
        <div class="payment-ok" onClick="handleClickOkRecipie(orderObject_g, element_g, insertOrder_g)">&nbsp;네&nbsp;</div>
          <div class="payment-cancle" onClick="handleClickCancleRecipie()">아니오</div>
        </div>
        </div>`;
      } else {
        element.innerHTML = `<span style='color: red;'>마일리지 정산에 실패했습니다.</span>`;
        setTimeout(() => {
          handleClickCancleRecipie();
        }, 2500);
      }
    } else {
      element.innerHTML = `<div class="colbox"><span style='color: black; margin-bottom: 8px;'>영수증을 출력하시겠습니까?</span><div class="rowbox">
        <div class="payment-ok" onClick="handleClickOkRecipie(orderObject_g, element_g, insertOrder_g)">&nbsp;네&nbsp;</div>
        <div class="payment-cancle" onClick="handleClickCancleRecipie()">아니오</div>
      </div>
      </div>`;
    }
  } else {
    element.innerHTML = `<span style='color: red;'>주문에 실패했습니다.</span>`;
    setTimeout(() => {
      handleClickCancleRecipie();
    }, 2500);
  }
};


let insertOrder_g = null;

const getPk = async() => {
  try {
    const response = await fetch('/green_kiosk/api/kiosk/purchase/order/primary-key', {
      method: 'GET',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer'
    });

    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);
    }
    const json = await response.json();

    return json.primaryKey + 1;
  } catch (error) {
    // 네트워크 오류 및 JSON 파싱 오류에 대한 예외 처리
    console.error('Fetch error:', error);
  }
};

const element_g = document.querySelector('.modal__message') as HTMLElement;
const orderObject_g = JSON.parse(sessionStorage.getItem('order'));

(() => {
  setTimeout(() => {getPk()}, 100);
})();
