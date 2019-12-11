package cn.edu.njust.bean;

public class Student {
	private String stuID;
	private String stuName;
	private String stuPassword;
	private Boolean pubFree;
	private int usedNum;
	private int scoreNum;
	private String stuPersonID;
	
	
	public Student(String stuID, String stuName, String stuPassword, Boolean pubFree, int usedNum, int scoreNum,
			String stuPersonID) {
		super();
		this.stuID = stuID;
		this.stuName = stuName;
		this.stuPassword = stuPassword;
		this.pubFree = pubFree;
		this.usedNum = usedNum;
		this.scoreNum = scoreNum;
		this.stuPersonID = stuPersonID;
	}


	public String getStuPersonID() {
		return stuPersonID;
	}


	public void setStuPersonID(String stuPersonID) {
		this.stuPersonID = stuPersonID;
	}

	public String getStuID() {
		return stuID;
	}


	public void setStuID(String stuID) {
		this.stuID = stuID;
	}


	public String getStuName() {
		return stuName;
	}


	public void setStuName(String stuName) {
		this.stuName = stuName;
	}


	public String getStuPassword() {
		return stuPassword;
	}


	public void setStuPassword(String stuPassword) {
		this.stuPassword = stuPassword;
	}


	public Boolean getPubFree() {
		return pubFree;
	}


	public void setPubFree(Boolean pubFree) {
		this.pubFree = pubFree;
	}


	public int getUsedNum() {
		return usedNum;
	}


	public void setUsedNum(int usedNum) {
		this.usedNum = usedNum;
	}


	public int getScoreNum() {
		return scoreNum;
	}


	public void setScoreNum(int scoreNum) {
		this.scoreNum = scoreNum;
	}


	public Student() {
		// TODO 自动生成的构造函数存根
	}

}
