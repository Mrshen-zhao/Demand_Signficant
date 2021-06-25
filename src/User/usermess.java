package User;

public class usermess {
	private String username;
	private String password;
	private String employee;
	private String factoryname;
	private String postal;
	private String premission;
	
	public String getPremission() {
		return premission;
	}

	public void setPremission(String premission) {
		this.premission = premission;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}

	public String getFactoryname() {
		return factoryname;
	}

	public void setFactoryname(String factoryname) {
		this.factoryname = factoryname;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public usermess(String username, String password, String employee, String factoryname, String postal,String premission) {
		super();
		this.username = username;
		this.password = password;
		this.employee = employee;
		this.factoryname = factoryname;
		this.postal = postal;
		this.premission=premission;
	}

	public  usermess() {
		
	}

}
