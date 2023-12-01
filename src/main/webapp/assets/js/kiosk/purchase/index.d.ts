interface ErrorConstructor {
  captureStackTrace(error: Object, constructor?: Function): void;
}

type fetchFoodType = {
  result: boolean;
  body?: foodType[];
};

type fetchCouponType = {
  result: boolean;
  body?: couponType | 'invalid' | 'over-time';
};

type fetchCouponArrayType = {
  result: boolean;
  body?: couponType[];
};

type fetchMileageType = {
  result: boolean;
  body?: mileageType;
};

type fetchEventType = {
  result: boolean;
  body?: eventType[];
};

type fetchEventmenuType = {
  result: boolean;
  body?: eventMenuType;
};

type fetchOrderType = {
  result: boolean;
  body?: {
    primaryKey: number;
  };
};

type foodType = {
  index: number;
  name: string;
  price: number;
  amount: number;
  discount?: number;
};

type couponType = {
  code: string;
  name: string;
  menuNo: number;
  discount: number;
};

type mileageType = {
  index?: number;
  name?: string;
  mileage?: number;
  value?: string;
  type?: 'phoneNumber' | 'cardNumber' | 'x';
  result?: null;
};

type eventType = {
  no: number;
  name: string;
  desc: string;
  image: string;
};

type eventMenuType = {
  eventNo: number;
  menuNo: number;
  discount: number;
};

type orderType = {
  order_time: Date;
  order_foods: foodType[];
  order_price: number;
  order_discount: number;
  order_coupon: couponType[];
  order_type: 'card' | 'mobile';
  order_use_mile: boolean;
  order_use_amount: number;
  order_add_mile: boolean;
  order_add_amount: number;
  order_is_maked: boolean;
  order_who: string;
  order_is_togo: boolean;
};

type lines = [boolean, boolean, boolean, boolean, boolean, boolean];

type barcode_dic_type = {
  [key: number]: lines;
};
