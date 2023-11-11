class PurchaseException extends error {
  constructor(reason) {
    super();
    this.name = 'PurchaseException';
    this.reason = reason;
    if (Error.captureStackTrace) {
      // Chrome and NodeJS
      Error.captureStackTrace(this, PurchaseException);
    } else {
      // FF, IE 10+ and Safari 6+. Fallback for others
      this.stack = new Error().stack || '';
    }
  }
  toString() {
    return this.name + ': ' + this.reason;
  }
}