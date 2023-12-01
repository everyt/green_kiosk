package coupon;

import java.sql.Timestamp;

public class Coupon_Bean {
        private int coupon_no;                 //쿠폰 발행 넘버
        private String coupon_name;            //쿠폰 이름   
        private String coupon_code;            //쿠폰 코드   
        private int coupon_menuNo;             //쿠폰 관련 메뉴 
        private int coupon_discount;           //쿠폰 할인율
        private Timestamp coupon_issueDate;    
        private Timestamp coupon_expireDate;
        private Timestamp coupon_limitTime1;
        private Timestamp coupon_limitTime2;
        private String coupon_owner;
        private boolean coupon_used;
        
        public int getCoupon_no() {
                return coupon_no;
        }
        public String getCoupon_name() {
                return coupon_name;
        }
        public String getCoupon_code() {
                return coupon_code;
        }
        public int getCoupon_menuNo() {
                return coupon_menuNo;
        }
        public int getCoupon_discount() {
                return coupon_discount;
        }
        public Timestamp getCoupon_issueDate() {
                return coupon_issueDate;
        }
        public Timestamp getCoupon_expireDate() {
                return coupon_expireDate;
        }
        public Timestamp getCoupon_limitTime1() {
                return coupon_limitTime1;
        }
        public Timestamp getCoupon_limitTime2() {
                return coupon_limitTime2;
        }
        public void setCoupon_no(int coupon_no) {
                this.coupon_no = coupon_no;
        }
        public void setCoupon_name(String coupon_name) {
                this.coupon_name = coupon_name;
        }
        public void setCoupon_code(String coupon_code) {
                this.coupon_code = coupon_code;
        }
        public void setCoupon_menuNo(int coupon_menuNo) {
                this.coupon_menuNo = coupon_menuNo;
        }
        public void setCoupon_discount(int coupon_discount) {
                this.coupon_discount = coupon_discount;
        }
        public void setCoupon_issueDate(Timestamp coupon_issueDate) {
                this.coupon_issueDate = coupon_issueDate;
        }
        public void setCoupon_expireDate(Timestamp coupon_expireDate) {
                this.coupon_expireDate = coupon_expireDate;
        }
        public void setCoupon_limitTime1(Timestamp coupon_limitTime1) {
                this.coupon_limitTime1 = coupon_limitTime1;
        }
        public void setCoupon_limitTime2(Timestamp coupon_limitTime2) {
                this.coupon_limitTime2 = coupon_limitTime2;
        }
		public String get_owner() {
			return coupon_owner;
		}
		public void set_owner(String coupon_owner) {
			this.coupon_owner = coupon_owner;
		}
		public boolean getCoupon_used() {
			return coupon_used;
		}
		public void setCoupon_used(boolean coupon_used) {
			this.coupon_used = coupon_used;
		}
}