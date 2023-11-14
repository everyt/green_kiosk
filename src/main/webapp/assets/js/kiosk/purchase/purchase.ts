class Recipie {
  no: number;
  is_togo: boolean;
}

const handleClickCancleRecipie = () => {
  location.href = 'main.jsp';
};

const handleClickOkRecipie = (element: HTMLElement) => {
  // element에 영수증 출력해서 보여주기
  let html = '';
  html += ``;
  setTimeout(() => {
    location.href = 'main.jsp'; //TODO: 키오스크 초기화면, 영수증에 주문번호 출력해서 보여주기
  }, 2500);
};

const purchase = async (type: string) => {
  const element = document.querySelector('#modal__message') as HTMLElement;

  const orderObject = JSON.parse(sessionStorage.getItem('order'));
  orderObject.orders_type = type;
  const insertOrder = await detailedFetch(
    '/green_kiosk/api/kiosk/purchase/order',
    'POST',
    encodeURIComponent(JSON.stringify(orderObject)),
  );
  if (insertOrder.result) {
    const mile_type =
      orderObject.orders_add_mile && orderObject.orders_use_mile
        ? 'both'
        : orderObject.orders_add_mile && !orderObject.orders_use_mile
        ? 'add'
        : orderObject.orders_use_mile && !orderObject.orders_add_mile
        ? 'use'
        : 'none';
    if (orderObject.orders_who !== null) {
      const mile_log = {
        mem_uid: orderObject.orders_who,
        mile_type,
        mile_reason: 'order',
        mile_deff: orderObject.orders_add_amount,
        mile_order_no: insertOrder.primaryKey,
        mile_timestamp: new Date(),
      };
      const insertMileage = await detailedFetch(
        '/green_kiosk/api/kiosk/milelogs',
        'POST',
        encodeURIComponent(JSON.stringify(mile_log)),
      );
      if (insertMileage.result) {
        element.innerHTML = `<div class="colbox"><span style='color: black; margin-bottom: 8px;'>영수증을 출력하시겠습니까?</span>`;
        element.innerHTML += `<div class="rowbox">
          <div class="payment-ok" onClick="handleClickOk()">&nbsp;네&nbsp;</div>
          <div class="payment-cancle" onClick="handleClickCancleRecipie()">아니오</div>
        </div>
        </div>`;
      } else {
        element.innerHTML = `<span style='color: red;'>마일리지 정산에 실패했습니다.</span>`;
        setTimeout(() => {
          handleClickCancleRecipie();
        }, 2500);
      }
    }
  } else {
    element.innerHTML = `<span style='color: red;'>주문에 실패했습니다.</span>`;
    setTimeout(() => {
      handleClickCancleRecipie();
    }, 2500);
  }
};
