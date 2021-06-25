package User;

public class Area {
	private String code;
	private String areaname;
	public Area(String code, String areaname) {
		super();
		this.code = code;
		this.areaname = areaname;
	}
	public Area() {
		super();
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	

}
