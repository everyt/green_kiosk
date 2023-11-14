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
    function Recipie() {
    }
    return Recipie;
}());
var handleClickCancleRecipie = function () {
    location.href = 'main.jsp';
};
var handleClickOkRecipie = function (element) {
    // element에 영수증 출력해서 보여주기
    var html = '';
    html += "";
    setTimeout(function () {
        location.href = 'main.jsp'; //TODO: 키오스크 초기화면, 영수증에 주문번호 출력해서 보여주기
    }, 2500);
};
var purchase = function (type) { return __awaiter(_this, void 0, void 0, function () {
    var element, orderObject, insertOrder, mile_type, mile_log, insertMileage;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                element = document.querySelector('#modal__message');
                orderObject = JSON.parse(sessionStorage.getItem('order'));
                orderObject.orders_type = type;
                return [4 /*yield*/, detailedFetch('/green_kiosk/api/kiosk/purchase/order', 'POST', encodeURIComponent(JSON.stringify(orderObject)))];
            case 1:
                insertOrder = _a.sent();
                if (!insertOrder.result) return [3 /*break*/, 4];
                mile_type = orderObject.orders_add_mile && orderObject.orders_use_mile
                    ? 'both'
                    : orderObject.orders_add_mile && !orderObject.orders_use_mile
                        ? 'add'
                        : orderObject.orders_use_mile && !orderObject.orders_add_mile
                            ? 'use'
                            : 'none';
                if (!(orderObject.orders_who !== null)) return [3 /*break*/, 3];
                mile_log = {
                    mem_uid: orderObject.orders_who,
                    mile_type: mile_type,
                    mile_reason: 'order',
                    mile_deff: orderObject.orders_add_amount,
                    mile_order_no: insertOrder.primaryKey,
                    mile_timestamp: new Date(),
                };
                return [4 /*yield*/, detailedFetch('/green_kiosk/api/kiosk/milelogs', 'POST', encodeURIComponent(JSON.stringify(mile_log)))];
            case 2:
                insertMileage = _a.sent();
                if (insertMileage.result) {
                    element.innerHTML = "<div class=\"colbox\"><span style='color: black; margin-bottom: 8px;'>\uC601\uC218\uC99D\uC744 \uCD9C\uB825\uD558\uC2DC\uACA0\uC2B5\uB2C8\uAE4C?</span>";
                    element.innerHTML += "<div class=\"rowbox\">\n          <div class=\"payment-ok\" onClick=\"handleClickOk()\">&nbsp;\uB124&nbsp;</div>\n          <div class=\"payment-cancle\" onClick=\"handleClickCancleRecipie()\">\uC544\uB2C8\uC624</div>\n        </div>\n        </div>";
                }
                else {
                    element.innerHTML = "<span style='color: red;'>\uB9C8\uC77C\uB9AC\uC9C0 \uC815\uC0B0\uC5D0 \uC2E4\uD328\uD588\uC2B5\uB2C8\uB2E4.</span>";
                    setTimeout(function () {
                        handleClickCancleRecipie();
                    }, 2500);
                }
                _a.label = 3;
            case 3: return [3 /*break*/, 5];
            case 4:
                element.innerHTML = "<span style='color: red;'>\uC8FC\uBB38\uC5D0 \uC2E4\uD328\uD588\uC2B5\uB2C8\uB2E4.</span>";
                setTimeout(function () {
                    handleClickCancleRecipie();
                }, 2500);
                _a.label = 5;
            case 5: return [2 /*return*/];
        }
    });
}); };
