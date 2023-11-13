package mile;

public class Mileage_VO {
	  private int index;
	  private String name;
	  private int mileage;
	  private String value;
	  private String type;
	public int getIndex() {
		return index;
	}
	public String getName() {
		return name;
	}
	public int getMileage() {
		return mileage;
	}
	public String getValue() {
		return value;
	}
	public String getType() {
		return type;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Mileage_VO(int index, String name, int mileage, String value, String type) {
		super();
		this.index = index;
		this.name = name;
		this.mileage = mileage;
		this.value = value;
		this.type = type;
	}
	  
}
