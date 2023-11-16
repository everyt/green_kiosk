package coupon;

import java.util.List;

public class Coupon_kind_Bean {
	private Integer numb;
	private String name;
	private String desc;
	private Integer discount_per;
	private List<String> category;
	private boolean enable;
	private Integer vaild_date;
	private boolean default_coupon;
	public Integer getNumb() {
		return numb;
	}
	public void setNumb(Integer numb) {
		this.numb = numb;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Integer getDiscount_per() {
		return discount_per;
	}
	public void setDiscount_per(Integer discount_per) {
		this.discount_per = discount_per;
	}
	public List<String> getCategory() {
		return category;
	}
	public void addCategory(String category) {
		this.category.add(category);
	}
	public void removeCategory(String category) {
		this.category.remove(category);
	}
	public void setCategory(List<String> category) {
		this.category = category;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public Integer getVaild_date() {
		return vaild_date;
	}
	public void setVaild_date(Integer vaild_date) {
		this.vaild_date = vaild_date;
	}
	public boolean isDefault_coupon() {
		return default_coupon;
	}
	public void setDefault_coupon(boolean default_coupon) {
		this.default_coupon = default_coupon;
	}
}
