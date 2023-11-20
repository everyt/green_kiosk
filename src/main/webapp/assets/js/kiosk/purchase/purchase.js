var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var _this = this;
var Recipie = /** @class */ (function () {
    function Recipie(orderObject, mileage, pk) {
        this.no = 0;
        this.is_togo = orderObject.order_is_togo;
        this.timestamp = new Date();
        this.foods = orderObject.order_foods;
        this.price = orderObject.order_price;
        this.discount = orderObject.order_discount;
        this.tax = Math.floor((this.price * 10) / 110);
        if (orderObject.order_who !== null) {
            this.mileage = true;
        }
        else {
            this.mileage = false;
        }
        if (this.mileage) {
            this.mileage_id = mileage.value;
            this.mileage_type = mileage.type;
            this.mileage_value = mileage.mileage;
        }
        this.payment_type = orderObject.order_type;
        this.barcode = Math.floor(Math.random() * Math.pow(10, 17));
        this.waitCount = pk;
    }
    return Recipie;
}());
var handleClickCancleRecipie = function () {
    location.href = 'main.jsp';
};
var handleClickOkRecipie = function (orderObject, element, pk) {
    var mileage = JSON.parse(sessionStorage.getItem('mileage'));
    var recipie = new Recipie(orderObject, mileage, pk);
    // element에 영수증 출력해서 보여주기
    var html = '';
    html += "<div class='colbox' style='width:400px'>";
    html += "<span style='font-size: 0.8rem'>[ \uBB34&nbsp;&nbsp;&nbsp;&nbsp;\uC778 ]</span>";
    html += "<span style='font-size: 1.2rem'>\uB300\uAE30\uBC88\uD638</span>";
    html += "<span style='font-size: 1.2rem'>".concat(recipie.waitCount, "</span>");
    html += "<span style='font-size: 1.2rem'>[&nbsp;".concat(recipie.is_togo ? '매장 식사' : '포장 주문', "&nbsp;]</span>");
    html += "<span>---------------------------------------------------------------------------</span>";
    html += "<div class='rowbox' style='justify-content:space-between'>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uC81C\uD488\uBA85</span>";
    html += "<span>\uB2E8\uAC00</span>";
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uC218\uB7C9</span>";
    html += "<span>\uAE08\uC561</span>";
    html += "</div>";
    html += "</div>";
    html += "<span>---------------------------------------------------------------------------</span>";
    for (var i = 0; i < recipie.foods.length; i++) {
        var food = recipie.foods[i];
        html += "<div class='rowbox' style='justify-content:space-between'>";
        html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
        html += "<span>".concat(food.name, "</span>");
        html += "<span>".concat(food.price, "</span>");
        html += "</div>";
        html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
        html += "<span>".concat(food.amount, "</span>");
        html += "<span>".concat(food.price * food.amount, "</span>");
        html += "</div>";
        html += "</div>";
    }
    html += "<span>---------------------------------------------------------------------------</span>";
    html += "<div class='rowbox' style='justify-content:space-between'>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uCD1D \uD569 \uACC4</span>";
    html += "<span>".concat(recipie.price, "</span>");
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uD560   \uC778</span>";
    html += "<span>".concat(recipie.discount, "</span>");
    html += "</div>";
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between'>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uACFC\uC138\uAE08\uC561</span>";
    html += "<span>".concat(recipie.price - recipie.tax, "</span>");
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uBD80\uAC00\uC138</span>";
    html += "<span>".concat(recipie.tax, "</span>");
    html += "</div>";
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between'>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uCCAD\uAD6C\uAE08\uC561</span>";
    html += "<span>".concat(recipie.price - recipie.tax, "</span>");
    html += "</div>";
    html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
    html += "<span>\uBC1B \uC740 \uB3C8</span>";
    html += "<span>".concat(recipie.price, "</span>");
    html += "</div>";
    html += "</div>";
    html += "<span>---------------------------------------------------------------------------</span>";
    if (recipie.mileage) {
        html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
        html += "<span>\uB9C8\uC77C\uB9AC\uC9C0</span>";
        html += "<span>".concat(recipie.mileage_id, "</span>");
        html += "</div>";
        html += "<div class='rowbox' style='justify-content:space-between;width:170px'>";
        html += "<span>\uC801\uB9BDPOINT</span>";
        html += "<span>".concat(Math.floor(recipie.price - recipie.discount) / 100, "</span>");
        html += "</div>";
        html += "<span>---------------------------------------------------------------------------</span>";
    }
    html += "<span>".concat(recipie.payment_type, "</span>");
    html += "<span>---------------------------------------------------------------------------</span>";
    html += "<div class=\"payment-cancle\" onClick=\"handleClickCancleRecipie()\">\uB2EB\uAE30</div>";
    html += "</div>";
    element.innerHTML = html;
};
var purchase = function (type) { return __awaiter(_this, void 0, void 0, function () {
    var element, orderObject, insertOrder, mile_type, mile_log, insertMileage;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                element = document.querySelector('.modal__message');
                orderObject = JSON.parse(sessionStorage.getItem('order'));
                orderObject.order_type = type;
                return [4 /*yield*/, detailedFetch('/green_kiosk/api/kiosk/purchase/order', 'POST', encodeURIComponent(JSON.stringify(orderObject)))];
            case 1:
                insertOrder = _a.sent();
                if (!insertOrder.result) return [3 /*break*/, 5];
                mile_type = orderObject.order_add_mile && orderObject.order_use_mile
                    ? 'both'
                    : orderObject.order_add_mile && !orderObject.order_use_mile
                        ? 'add'
                        : orderObject.order_use_mile && !orderObject.order_add_mile
                            ? 'use'
                            : 'none';
                if (!(orderObject.order_who !== null)) return [3 /*break*/, 3];
                mile_log = {
                    mile_uid: orderObject.order_who,
                    mile_type: mile_type,
                    mile_reason: 'order',
                    mile_deff: orderObject.order_add_amount,
                    mile_order_no: insertOrder.primaryKey,
                    mile_timestamp: new Date(),
                };
                return [4 /*yield*/, detailedFetch('/green_kiosk/api/kiosk/milelogs', 'POST', encodeURIComponent(JSON.stringify(mile_log)))];
            case 2:
                insertMileage = _a.sent();
                if (insertMileage.result) {
                    element.innerHTML = "<div class=\"colbox\"><span style='color: black; margin-bottom: 8px;'>\uC601\uC218\uC99D\uC744 \uCD9C\uB825\uD558\uC2DC\uACA0\uC2B5\uB2C8\uAE4C?</span><div class=\"rowbox\">\n        <div class=\"payment-ok\" onClick=\"handleClickOkRecipie(orderObject_g, element_g, insertOrder_g)\">&nbsp;\uB124&nbsp;</div>\n          <div class=\"payment-cancle\" onClick=\"handleClickCancleRecipie()\">\uC544\uB2C8\uC624</div>\n        </div>\n        </div>";
                }
                else {
                    element.innerHTML = "<span style='color: red;'>\uB9C8\uC77C\uB9AC\uC9C0 \uC815\uC0B0\uC5D0 \uC2E4\uD328\uD588\uC2B5\uB2C8\uB2E4.</span>";
                    setTimeout(function () {
                        handleClickCancleRecipie();
                    }, 2500);
                }
                return [3 /*break*/, 4];
            case 3:
                element.innerHTML = "<div class=\"colbox\"><span style='color: black; margin-bottom: 8px;'>\uC601\uC218\uC99D\uC744 \uCD9C\uB825\uD558\uC2DC\uACA0\uC2B5\uB2C8\uAE4C?</span><div class=\"rowbox\">\n        <div class=\"payment-ok\" onClick=\"handleClickOkRecipie(orderObject_g, element_g, insertOrder_g)\">&nbsp;\uB124&nbsp;</div>\n        <div class=\"payment-cancle\" onClick=\"handleClickCancleRecipie()\">\uC544\uB2C8\uC624</div>\n      </div>\n      </div>";
                _a.label = 4;
            case 4: return [3 /*break*/, 6];
            case 5:
                element.innerHTML = "<span style='color: red;'>\uC8FC\uBB38\uC5D0 \uC2E4\uD328\uD588\uC2B5\uB2C8\uB2E4.</span>";
                setTimeout(function () {
                    handleClickCancleRecipie();
                }, 2500);
                _a.label = 6;
            case 6: return [2 /*return*/];
        }
    });
}); };
var detailedFetch2 = function (url, type, body) { return __awaiter(_this, void 0, void 0, function () {
    var response, json, error_1;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 3, , 4]);
                return [4 /*yield*/, fetch(url, {
                        method: type,
                        mode: 'cors',
                        cache: 'no-cache',
                        credentials: 'same-origin',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
                        },
                        redirect: 'follow',
                        referrerPolicy: 'no-referrer',
                        body: body,
                    })];
            case 1:
                response = _a.sent();
                if (!response.ok) {
                    throw new Error("Network response was not ok: ".concat(response.statusText));
                }
                return [4 /*yield*/, response.json()];
            case 2:
                json = _a.sent();
                return [2 /*return*/, json];
            case 3:
                error_1 = _a.sent();
                // 네트워크 오류 및 JSON 파싱 오류에 대한 예외 처리
                console.error('Fetch error:', error_1);
                return [3 /*break*/, 4];
            case 4: return [2 /*return*/];
        }
    });
}); };
var insertOrder_g = null;
var getPk = function () { return __awaiter(_this, void 0, void 0, function () {
    var pk;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, detailedFetch2('/green_kiosk/api/kiosk/purchase/order/primary-key', 'POST', encodeURIComponent(JSON.stringify({})))];
            case 1:
                pk = _a.sent();
                insertOrder_g = pk.primaryKey + 1;
                return [2 /*return*/];
        }
    });
}); };
var element_g = document.querySelector('.modal__message');
var orderObject_g = JSON.parse(sessionStorage.getItem('order'));
(function () {
    setTimeout(function () { getPk(); }, 100);
})();
