package coupon;

public class Coupon_VO {
	private String code;
	private String name;
	private int menuNo;
	private int discount;
	public Coupon_VO(String code, String name, int menuNo, int discount) {
		super();
		this.code = code;
		this.name = name;
		this.menuNo = menuNo;
		this.discount = discount;
	}
	public String getCode() {
		return code;
	}
	public String getName() {
		return name;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public int getDiscount() {
		return discount;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
}
