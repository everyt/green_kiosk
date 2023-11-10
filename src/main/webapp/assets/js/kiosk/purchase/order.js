class Order {
  constructor(price, discount, type) {
    this.time = new Date().toISOString();
    this.foods = {};
    this.price = price;
    this.discount = discount;
    this.coupon = {};
    this.type = type;
    this.add_mile = false;
    this.add_mile_amount = 0;
    this.use_mile = false;
    this.use_mile_amount = 0;
  }
  setFoods(array) {
    this.foods = array;
  }
  setCoupon(array) {
    this.coupon = array;
  }
  smile(add_mile, add_mile_amount, use_mile, use_mile_amount) {
    this.add_mile = add_mile;
    this.add_mile_amount = add_mile_amount;
    this.use_mile = use_mile;
    this.use_mile_amount = use_mile_amount;
  }
  toObject() {
    return {
      'time': this.time,
      'foods': this.foods,
      'price': this.price,
      'discount': this.discount,
      'coupon': this.coupon,
      'type': this.type,
      'add_mile': this.add_mile,
      'add_mile_amount': this.add_mile_amount,
      'use_mile': this.use_mile,
      'use_mile_amount': this.use_mile_amount,
    }
  }
}