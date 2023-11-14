package menu;

public class Menu_component_Bean {
	
	private int component_no;        //순서
	private String component_name;   //재료 이름
	private int component_price;     //재료 가격
	private int component_amount;    //재료 수량
	private String component_imgPath;//재료 사진 경로
	private int component_isUse; // 재료 사용 여부
	private int component_isTopping; //재료 토핑으로 사용 여부 
	
	
	public int getComponent_no() {
		return component_no;
	}
	public void setComponent_no(int component_no) {
		this.component_no = component_no;
	}
	public String getComponent_name() {
		return component_name;
	}
	public void setComponent_name(String component_name) {
		this.component_name = component_name;
	}
	public int getComponent_price() {
		return component_price;
	}
	public void setComponent_price(int component_price) {
		this.component_price = component_price;
	}
	public int getComponent_amount() {
		return component_amount;
	}
	public void setComponent_amount(int component_amount) {
		this.component_amount = component_amount;
	}
	public String getComponent_imgPath() {
		return component_imgPath;
	}
	public void setComponent_imgPath(String component_imgPath) {
		this.component_imgPath = component_imgPath;
	}
	public int getComponent_isUse() {
		return component_isUse;
	}
	public void setComponent_isUse(int component_isUse) {
		this.component_isUse = component_isUse;
	}
	public int getComponent_isTopping() {
		return component_isTopping;
	}
	public void setComponent_isTopping(int component_isTopping) {
		this.component_isTopping = component_isTopping;
	}
	

	
}
