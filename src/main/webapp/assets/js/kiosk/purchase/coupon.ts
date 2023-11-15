const couponRegex = /^[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}-[A-Za-z0-9]{4}$/;

const handleKeypad = (num) => {
  const input = document.querySelector('#couponCode') as HTMLInputElement;
  const length = input.value.length;
  let temp = '';

  if (length < 19) {
    if ((length + 1) % 5 === 0) {
      temp = '-';
    }
    input.value += temp + num;
  }
};
const generateCouponHTML = (arr: any[]) => {
  let couponHTML = '';

  if (arr.length > 0) {
    document.getElementById('couponDOM2').style.display = 'inline-block';
    for (let i = 0; i < arr.length; i++) {
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

(() => {
  let couponArray = [];
  const couponItem = sessionStorage.getItem('couponArray');
  if (couponItem !== null || couponItem !== undefined) {
    couponArray = JSON.parse(sessionStorage.getItem('couponArray'));
  }
  generateCouponHTML(couponArray);
})();

const handleClickCancle2 = () => {
  const couponItem = sessionStorage.getItem('couponArray');

  if (couponItem !== null || couponItem !== undefined) {
    sessionStorage.setItem('coupon', JSON.stringify(false));
  }

  location.href = 'main.jsp';
};

const clearKeypad = () => {
  const input = document.querySelector('#couponCode') as HTMLInputElement;
  input.value = '';
};

const handleCouponForm = async () => {
  const couponCodeElement = document.querySelector('#couponCode') as HTMLInputElement;
  const couponCode = couponCodeElement.value;
  if (!couponRegex.test(couponCode)) {
    const couponTextElement = document.getElementById('couponText');
    couponTextElement.innerHTML = '<span style="color: red;">올바르지 않은 쿠폰 코드입니다.</span>';
    setTimeout(() => {
      couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
    }, 3000);
  } else {
    const coupon = {
      'code': couponCode,
    };
    const coupon2 = await detailedFetch(
      '/green_kiosk/api/kiosk/purchase/coupon',
      'POST',
      encodeURIComponent(JSON.stringify(coupon)),
    );
    if (coupon2[0].code !== 'x' && coupon2[0].code !== 't') {
      const couponItem = sessionStorage.getItem('couponArray');
      let couponArray = [];
      if (couponItem !== null || couponItem !== undefined) {
        couponArray = JSON.parse(sessionStorage.getItem('couponArray'));
        couponArray.push(coupon2[0]);
      } else {
        couponArray = coupon2;
      }
      sessionStorage.setItem('couponArray', JSON.stringify(couponArray));
      generateCouponHTML(couponArray);
      console.log(1);
    } else {
      const couponTextElement = document.getElementById('couponText');
      if (coupon.code === 'x') {
        couponTextElement.innerHTML = '<span style="color: red;">유효하지 않은 쿠폰입니다.</span>';
      } else {
        couponTextElement.innerHTML = '<span style="color: red;">현재 사용 불가능한 쿠폰입니다.</span>';
      }
      setTimeout(() => {
        couponTextElement.innerHTML = '할인 쿠폰 코드를 입력해 주세요.';
      }, 3000);
    }
  }
};
