const hrefTo = (href) => {
  location.href = href;
};

const backTo = (str) => {
  sessionStorage.setItem(str, false);
  hrefTo('main.jsp');
};
const processGetHTMLElement = (element, callback) => {
  if (element !== undefined || element !== null) {
    return element;
  } else {
    if (callback === undefined) {
      return null;
    } else {
      callback();
    }
  }
};

const clearInput = (str) => {
  const input = getHTMLElement('#couponCode');
  if (input !== null) input.value = '';
};

const getCookie = (str) => {
  let key, value;
  const parts = document.cookie.split(';');

  for (let i = 0; i < parts.length; i++) {
    key = parts[i].substring(0, parts[i].indexOf('=')).trim();
    value = parts[i].substring(parts[i].indexOf('=') + 1).trim();
    if (key === str) {
      return decodeURIComponent(value);
    }
  }

  return null;
};

const getSessionStorageItem = (str, callback1, callback2) => {
  if (sessionStorage.getItem(str) === null) {
    if (!callback1 === undefined) callback1();
    return null;
  } else {
    if (!callback2 === undefined) callback2();
    return JSON.parse(sessionStorage.getItem(str));
  }
};

const getSessionStorageArray = (str) => {
  if (JSON.parse(sessionStorage.getItem(str)) === null) {
    return null;
  } else {
    return JSON.parse(sessionStorage.getItem(str));
  }
};
