package cn.edu.njust.bean;

public class Admin {
	
	private String adminID;
	private String adminPassword;
	private String adminGrade;
	
	
	public Admin(String adminID, String adminPassword, String adminGrade) {
		super();
		this.adminID = adminID;
		this.adminPassword = adminPassword;
		this.adminGrade = adminGrade;
	}


	public String getAdminID() {
		return adminID;
	}


	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}


	public String getAdminPassword() {
		return adminPassword;
	}


	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}


	public String getAdminGrade() {
		return adminGrade;
	}


	public void setAdminGrade(String adminGrade) {
		this.adminGrade = adminGrade;
	}


	public Admin() {
		// TODO 自动生成的构造函数存根
	}

}
