package orders;

import java.sql.Timestamp;
import java.util.Date;

public class Orders_Bean {
	private Integer order_no;
	private Timestamp order_time;
	private String order_foods;
	private Integer	order_price;
	private Integer order_discount;
	private String order_coupon;
	private String order_type;
	private boolean order_use_mile;
	private Integer order_use_amount;
	private boolean order_add_mile;
	private Integer order_add_amount;
	private boolean order_is_maked;
	private String order_who;
	

	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	public Timestamp getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}
	public String getOrder_foods() {
		return order_foods;
	}
	public void setOrder_foods(String order_foods) {
		this.order_foods = order_foods;
	}
	public Integer getOrder_price() {
		return order_price;
	}
	public void setOrder_price(Integer order_price) {
		this.order_price = order_price;
	}
	public Integer getOrder_discount() {
		return order_discount;
	}
	public void setOrder_discount(Integer order_discount) {
		this.order_discount = order_discount;
	}
	public String getOrder_coupon() {
		return order_coupon;
	}
	public void setOrder_coupon(String order_coupon) {
		this.order_coupon = order_coupon;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public boolean isOrder_use_mile() {
		return order_use_mile;
	}
	public void setOrder_use_mile(boolean order_use_mile) {
		this.order_use_mile = order_use_mile;
	}
	public Integer getOrder_use_amount() {
		return order_use_amount;
	}
	public void setOrder_use_amount(Integer order_use_amount) {
		this.order_use_amount = order_use_amount;
	}
	public boolean isOrder_add_mile() {
		return order_add_mile;
	}
	public void setOrder_add_mile(boolean order_add_mile) {
		this.order_add_mile = order_add_mile;
	}
	public Integer getOrder_add_amount() {
		return order_add_amount;
	}
	public void setOrder_add_amount(Integer order_add_amount) {
		this.order_add_amount = order_add_amount;
	}
	public boolean isOrder_is_maked() {
		return order_is_maked;
	}
	public void setOrder_is_maked(boolean order_is_maked) {
		this.order_is_maked = order_is_maked;
	}
	public String get_who() {
		return order_who;
	}
	public void set_who(String order_who) {
		this.order_who = order_who;
	}
}
