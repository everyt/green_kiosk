/**
 * @param cookie_name
 * @return cookie
 */
function getCookie(cookie_name) {
  let x, y;
  const val = document.cookie.split(';');

  for (var i = 0; i < val.length; i++) {
    x = val[i].substring(0, val[i].indexOf('='));
    y = val[i].substring(val[i].indexOf('=') + 1);
    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
    if (x == cookie_name) {
      return decodeURIComponent(y);
    }
  }
}