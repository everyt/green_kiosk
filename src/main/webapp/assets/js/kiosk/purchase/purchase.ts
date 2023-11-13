const purchase = async (type: string) => {
  const orderObject = JSON.parse(sessionStorage.getItem('order'));
  orderObject.type = type;
  const insertOrder = await detailedFetch('/green_kiosk/api/kiosk/purchase/order', 'POST', encodeURIComponent(JSON.stringify(orderObject)));
  if (insertOrder.result) {
    console.log('success');
    const mile_type = 
    orderObject.add_mile && orderObject.use_mile
    ? 'both'
    : orderObject.add_mile && !orderObject.use_mile
    ? 'add' 
    : orderObject.use_mile && !orderObject.add_mile
    ? 'use'
    : 'none';
    const mile_log = {
      mem_uid: orderObject.who,
      mile_type,
      mile_reason: 'order',
      mile_deff: orderObject.add_mile_amount,
      mile_order_no: insertOrder.primaryKey,
      mile_timestamp: new Date()
    }
    const insertMileage = await detailedFetch('/green_kiosk/api/kiosk/milelogs', 'POST', encodeURIComponent(JSON.stringify(mile_log)));
    if (insertMileage.result) {
      console.log('success');
    } else {
      console.log('failed');
    }
  } else {
    console.log('failed');
  }
}