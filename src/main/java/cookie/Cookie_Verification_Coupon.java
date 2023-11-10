package cookie;

import coupon.Coupon_Mgr;

public class Cookie_Verification_Coupon implements Cookie_Verification {
	@Override
	public boolean verification(String str) {
		Coupon_Mgr coupon_Mgr = new Coupon_Mgr();
		return coupon_Mgr.checkCouponCode(str) > 0;
	}
}