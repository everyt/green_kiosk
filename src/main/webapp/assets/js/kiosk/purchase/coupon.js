const couponRegex = /^[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}$/;

const handleKeypad = (num) => {
  const input = document.querySelector("#couponCode");
  const length = input.value.length;
  let temp = '';
  
  if (length < 19) {
    if ((length + 1) % 5 === 0) {
      temp = '-';
    }
    input.value += temp + num;
  }
}
const generateCouponHTML = (arr, count) => {
  let couponHTML = '';
  
  if (!arr === []){
    for (let i = 0; i < count; i++) {
      couponHTML += `<div class='rowbox' style='border: solid #ddd; border-width: 0 0 2px 0; align-self: center; padding: 3px 0;'>`;
      couponHTML += `<span style='width: 120px;'>` + arr[i].name + `</span>`;
      couponHTML += `</div>`;
    }
  } else {
    document.getElementById('couponDOM2').style.display = 'none';
  }

  const couponElement = document.getElementById('couponDOM');

  couponElement.innerHTML = couponHTML;
};

let couponArray = [];

if (!getCookie('coupons') === undefined) {
  couponArray = JSON.parse(decodeURIComponent(getCookie('coupons')));
}

generateCouponHTML(couponArray, couponArray.length);

const handleCouponForm = () => {
  const couponCode = document.couponForm.couponCode.value;
  if (!couponRegex.test(couponCode)) {
    const couponTextElement = document.getElementById('couponText');
    couponTextElement.innerHTML = '<span style="color: red;">올바르지 않은 쿠폰 코드입니다.</span>';
    setTimeout(() => {
      couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
    }, 3000);
    return;
  } else {
    document.couponForm.submit();
  }
}