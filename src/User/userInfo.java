package User;

public class userInfo {
	private Integer id;
	private String companyname;
	private String comaddress;
	private String comwebsite;
	private String email;
	private String lawperson;
	private String postal;
	private String contacts;
	private String phone;
	private String fax;
	private String insattr;
	private String belongcom;
	private String summary;
	private String techname;
	private String techchat;
	private String discuss;
	private String subject;
	private String domain;
	private String vocation;
	private String togemodern;
	private String togecom;
	private String status;
	private String money;
	private String belongarea;
	private String totime;
	private String telphone;
	private String keyword;
	private String xsadvice;
	private String bmadvice;
	private String xsshenhe;
	private String bmshenhe;
	private String office;
	
	
	


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getXsshenhe() {
		return xsshenhe;
	}
	public void setXsshenhe(String xsshenhe) {
		this.xsshenhe = xsshenhe;
	}
	public String getBmshenhe() {
		return bmshenhe;
	}
	public void setBmshenhe(String bmshenhe) {
		this.bmshenhe = bmshenhe;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getXsadvice() {
		return xsadvice;
	}
	public void setXsadvice(String xsadvice) {
		this.xsadvice = xsadvice;
	}
	public String getBmadvice() {
		return bmadvice;
	}
	public void setBmadvice(String bmadvice) {
		this.bmadvice = bmadvice;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getTotime() {
		return totime;
	}
	public void setTotime(String totime) {
		this.totime = totime;
	}
	public String getBelongarea() {
		return belongarea;
	}
	public void setBelongarea(String belongarea) {
		this.belongarea = belongarea;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getComaddress() {
		return comaddress;
	}
	public void setComaddress(String comaddress) {
		this.comaddress = comaddress;
	}
	public String getComwebsite() {
		return comwebsite;
	}
	public void setComwebsite(String comwebsite) {
		this.comwebsite = comwebsite;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLawperson() {
		return lawperson;
	}
	public void setLawperson(String lawperson) {
		this.lawperson = lawperson;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getInsattr() {
		return insattr;
	}
	public void setInsattr(String insattr) {
		this.insattr = insattr;
	}
	public String getBelongcom() {
		return belongcom;
	}
	public void setBelongcom(String belongcom) {
		this.belongcom = belongcom;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getTechname() {
		return techname;
	}
	public void setTechname(String techname) {
		this.techname = techname;
	}
	public String getTechchat() {
		return techchat;
	}
	public void setTechchat(String techchat) {
		this.techchat = techchat;
	}
	public String getDiscuss() {
		return discuss;
	}
	public void setDiscuss(String discuss) {
		this.discuss = discuss;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getVocation() {
		return vocation;
	}
	public void setVocation(String vocation) {
		this.vocation = vocation;
	}
	public String getTogemodern() {
		return togemodern;
	}
	public void setTogemodern(String togemodern) {
		this.togemodern = togemodern;
	}
	public String getTogecom() {
		return togecom;
	}
	public void setTogecom(String togecom) {
		this.togecom = togecom;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public userInfo(String companyname, String comaddress, String comwebsite, String email, String lawperson,
			String postal, String contacts, String phone, String fax, String insattr, String belongcom, String summary,
			String techname, String techchat, String discuss, String subject, String domain, String vocation,
			String togemodern, String togecom, String status, String money,String belongarea,String totime,String telphone,String keyword,String xsadvice,String bmadvice,String xsshenhe,
			String office,String bmshenhe,int id) {
		super();
		this.companyname = companyname;
		this.comaddress = comaddress;
		this.comwebsite = comwebsite;
		this.email = email;
		this.lawperson = lawperson;
		this.postal = postal;
		this.contacts = contacts;
		this.phone = phone;
		this.fax = fax;
		this.insattr = insattr;
		this.belongcom = belongcom;
		this.summary = summary;
		this.techname = techname;
		this.techchat = techchat;
		this.discuss = discuss;
		this.subject = subject;
		this.domain = domain;
		this.vocation = vocation;
		this.togemodern = togemodern;
		this.togecom = togecom;
		this.status = status;
		this.money = money;
		this.belongarea=belongarea;
		this.totime=totime;
		this.telphone=telphone;
		this.keyword=keyword;
		this.xsadvice=xsadvice;
		this.bmadvice=bmadvice;
		this.xsshenhe=xsshenhe;
		this.bmshenhe=bmshenhe;
		this.office=office;
		this.id=id;
	}
	public userInfo() {
		
	}
	
	

}
